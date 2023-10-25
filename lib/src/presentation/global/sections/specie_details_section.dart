// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import 'package:species/src/data/repositories_implementation/species_iiap/specie_species_iiap_repository_impl.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/presentation/global/functions/get_main_color_by_string.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/global/widgets/multimedia/custom_audio_bar.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';
import 'package:species/src/presentation/router/routes.dart';

class SpecieDetailsSection extends StatelessWidget {
  final Specie specie;
  final String tag;
  final void Function()? onTapForFullImage;
  const SpecieDetailsSection({
    Key? key,
    required this.specie,
    required this.tag,
    this.onTapForFullImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    late Map<String, dynamic> mainOpaqueColor;
    late Color mainColor;
    late Color opaqueColor;

    mainOpaqueColor = getMainColorByString(specie.type);
    mainColor = mainOpaqueColor['main'];
    opaqueColor = mainOpaqueColor['opaque'];

    return Scaffold(
      body: Stack(
        children: [
          GridTwoResponsive(
            leftChild: Stack(
              children: [
                CustomImageContainer(
                  tag: '${specie.id}$tag',
                  mainColor: mainColor,
                  onTap: onTapForFullImage,
                  imageUrl: specie.images.first,
                  heightImage:
                      size.height > size.width + 32.0 ? 384.0 : double.infinity,
                ),
                _ActionsForSpecieDetails(
                  context: context,
                  specie: specie,
                  mainColor: mainColor,
                ),
              ],
            ),
            rightChildren: [
              Text(
                specie.name,
                style: textTheme.titleLarge?.copyWith(
                  color: mainColor,
                ),
              ),
              Text(
                specie.scientificName,
                style: textTheme.titleMedium
                    ?.copyWith(color: colorScheme.onBackground),
              ),
              if (specie.sound.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CustomAudioBar(
                    audioUrl: specie.sound,
                    backgroundColor: mainColor,
                    progressBarColor: opaqueColor,
                  ),
                ),
              if (specie.authors.isNotEmpty)
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      specie.authors.join(', '),
                      style: textTheme.titleMedium
                          ?.copyWith(color: colorScheme.onSurfaceVariant),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  '${specie.kingdom} - ${specie.phylum} - ${specie.class_} - ${specie.order} - ${specie.family}',
                  style: textTheme.titleMedium
                      ?.copyWith(color: colorScheme.onSurface),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  specie.description.replaceAll('\t', ''),
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
              )
            ],
          ),
          const Positioned(
            left: 56.0,
            top: 8.0,
            child: CustomBackButton(),
          ),
        ],
      ),
    );
  }
}

class _ActionsForSpecieDetails extends StatefulWidget {
  final BuildContext context;
  final Color mainColor;
  final Specie specie;
  const _ActionsForSpecieDetails({
    required this.context,
    required this.mainColor,
    required this.specie,
  });

  @override
  State<_ActionsForSpecieDetails> createState() =>
      _ActionsForSpecieDetailsState();
}

class _ActionsForSpecieDetailsState extends State<_ActionsForSpecieDetails> {
  double? _progress;

  late Stream<bool> isFavoriteStream;

  @override
  void initState() {
    super.initState();
    isFavoriteStream = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('favorites')
        .doc(widget.specie.id.toString())
        .snapshots()
        .map((snapshot) => snapshot.exists);
  }

  final firebaseInstance = FirebaseAuth.instance;
  final specieRepository = SpecieSpeciesIiapRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16.0,
      right: 16.0,
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              if (_progress != null)
                const SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: CircularProgressIndicator(),
                ),
              SizedBox(
                height: 40.0,
                width: 40.0,
                child: PopupMenuButton(
                  tooltip: 'Descargar',
                  offset: const Offset(0, 48.0),
                  padding: const EdgeInsets.all(0.0),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 0,
                      child: _simpleList(
                          icon: Icons.picture_as_pdf_rounded,
                          text: 'Generar PDF'),
                      onTap: () => context.pushNamed(
                        Routes.pdfPreview,
                        pathParameters: {
                          'specie': jsonEncode(widget.specie.toJson()),
                        },
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: _simpleList(
                          icon: Icons.image_rounded, text: 'Descargar Imagen'),
                      onTap: () => download(
                          context: widget.context,
                          urlDownload: widget.specie.images.first),
                    ),
                    if (widget.specie.sound.isNotEmpty)
                      PopupMenuItem(
                        value: 1,
                        child: _simpleList(
                            icon: Icons.music_note_rounded,
                            text: 'Descargar Audio'),
                        onTap: () => download(
                            context: widget.context,
                            urlDownload: widget.specie.sound),
                      ),
                  ],
                  icon: CircleAvatar(
                    backgroundColor: widget.mainColor,
                    child:
                        const Icon(Icons.download_rounded, color: Colors.white),
                  ),
                  surfaceTintColor: Colors.transparent,
                ),
              ),
            ],
          ),
          CustomIconButton(
            tooltip: 'Compartir',
            icon: Icons.share,
            iconColor: Colors.white,
            backgroundColor: widget.mainColor,
            onPressed: () => Share.share(
                '¿Qué te parece esta espcie amazónica? https://amazonia.iiap.gob.pe/species/specie-details/${widget.specie.id}'),
          ),
          StreamBuilder<bool>(
            stream: isFavoriteStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: CircularProgressIndicator(color: widget.mainColor),
                );
              }
              final isFavorite = snapshot.data ?? false;

              return CustomIconButton(
                tooltip: isFavorite
                    ? 'Eliminar en favoritos'
                    : 'Guardar de favoritos',
                icon: isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline_rounded,
                iconColor: isFavorite ? Colors.white : widget.mainColor,
                backgroundColor: isFavorite ? widget.mainColor : null,
                onPressed: () {
                  if (firebaseInstance.currentUser == null ||
                      !firebaseInstance.currentUser!.emailVerified) {
                    context.pushNamed(Routes.signIn);
                  } else {
                    isFavorite
                        ? specieRepository.deleteSpecieFavorite(
                            userId: firebaseInstance.currentUser!.uid,
                            idSpecie: widget.specie.id)
                        : specieRepository.saveSpecieFavorite(
                            userId: firebaseInstance.currentUser!.uid,
                            specie: widget.specie,
                          );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _simpleList({
    required IconData icon,
    required String text,
  }) =>
      Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text),
          ),
        ],
      );

  Future<void> download({
    required BuildContext context,
    required String urlDownload,
  }) async {
    const permissionStorage = Permission.storage;
    final status = await permissionStorage.status;
    if (status.isDenied) {
      await permissionStorage.request();
    } else if (status.isGranted) {
      {
        FileDownloader.downloadFile(
          url: urlDownload,
          onDownloadError: (error) => customSnackBar(
            title: 'Algo salió mal',
            context: widget.context,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
          onDownloadCompleted: (progress) {
            setState(() => _progress = null);
            customSnackBar(
              title: 'Descarga finalizada',
              context: widget.context,
              backgroundColor: widget.mainColor,
            );
          },
          onProgress: (name, progress) => setState(() => _progress = progress),
        );
      }
    }
  }
}
