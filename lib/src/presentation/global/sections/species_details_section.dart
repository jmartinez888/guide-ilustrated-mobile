import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/entities/kindom/kindom.dart';
import 'package:species/src/domain/repositories/account/account_repository.dart';
import 'package:species/src/domain/repositories/favorite/favorite_repository.dart';
import 'package:species/src/presentation/global/functions/get_main_color_by_int.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/global/widgets/multimedia/custom_audio_bar.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';
import 'package:species/src/presentation/router/routes.dart';

class SpecieDetailsSection extends StatelessWidget {
  final Specie specie;
  const SpecieDetailsSection({
    Key? key,
    required this.specie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    late Map<String, dynamic> mainOpaqueColor;
    late Color mainColor;
    late Color opaqueColor;

    mainOpaqueColor = getMainColorByInt(specie.type?.id ?? 0);
    mainColor = mainOpaqueColor['main'];
    opaqueColor = mainOpaqueColor['opaque'];

    return Scaffold(
      body: Extend(
        child: GridTwoResponsive(
          leftChild: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                color: Colors.white,
                child: CustomImageContainer(
                  mainColor: mainColor,
                  onTap: () {
                    /* Specie specieFirebase =
                        SpecieMapper.specieToSpecieFavorite(specie);
                    final value = jsonEncode(specieFirebase.toJson());

                    context.pushNamed(
                      Routes.specieImage,
                      pathParameters: {'specie': value},
                    ); */
                  },
                  imageUrl: specie.images != null && specie.images!.isNotEmpty
                      ? specie.images!.first
                      : null,
                  heightImage:
                      size.height > size.width + 32.0 ? 288 : double.infinity,
                ),
              ),
              if (specie.conservationStates != null &&
                  specie.conservationStates!.isNotEmpty)
                Positioned(
                  left: 8.0,
                  bottom: 8.0,
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      for (var statusImage in specie.conservationStates!)
                        CustomImageContainer(
                          borderRadius: BorderRadius.zero,
                          imageUrl: statusImage.image,
                          mainColor: mainColor,
                          heightImage: 40.0,
                          width: 40.0,
                        ),
                    ],
                  ),
                ),
              _ActionsForSpecieDetails(
                context: context,
                mainColor: mainColor,
                specie: specie,
              ),
            ],
          ),
          rightChildren: [
            if (specie.name != null && specie.name!.isNotEmpty)
              Text(
                specie.name!,
                style: textTheme.titleLarge?.copyWith(color: mainColor),
              ),
            if (specie.scientificName != null &&
                specie.scientificName!.isNotEmpty)
              Text(
                specie.scientificName!,
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onBackground,
                  fontStyle: FontStyle.italic,
                ),
              ),
            if (specie.sound != null && specie.sound!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CustomAudioBar(
                  audioUrl: specie.sound!,
                  backgroundColor: mainColor,
                  progressBarColor: opaqueColor,
                ),
              ),
            if (specie.authors != null && specie.authors!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Autores',
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.end,
                ),
              ),
            if (specie.authors != null && specie.authors!.isNotEmpty)
              Text(
                specie.authors!
                    .where((author) => author.name != null)
                    .map((author) => author.name!)
                    .join(', '),
                style: textTheme.titleMedium
                    ?.copyWith(color: colorScheme.onSurfaceVariant),
                textAlign: TextAlign.end,
              ),
            /* if (specie.taxonomy != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _table(
                  context: context,
                  mainColor: mainColor,
                  opaqueColor: opaqueColor,
                  
                ),
              ), */
            if (specie.description != null && specie.description!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  specie.description!,
                  textAlign: TextAlign.start,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Widget _doubleListTile({
  String? firstText,
  String? secondText,
  Color? divideColor,
  Color? backgroundColor,
  TextStyle? style,
}) {
  const padding = EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0);
  return Material(
    color: backgroundColor ?? Colors.transparent,
    child: Row(
      children: [
        if (firstText != null)
          Expanded(
            child: Container(
              padding: padding,
              child: Text(
                firstText,
                style: style,
              ),
            ),
          ),
        if (divideColor != null)
          Container(
            height: 24.0,
            width: 1.5,
            color: divideColor,
          ),
        if (secondText != null)
          Expanded(
            child: Container(
              padding: padding,
              child: Text(
                secondText,
                style: style,
              ),
            ),
          ),
      ],
    ),
  );
}

Widget _table({
  required Color mainColor,
  required Color opaqueColor,
  required BuildContext context,
  required Kingdom kingdom,
}) {
  final textTheme = Theme.of(context).textTheme;
  final customDivider = Divider(
    height: 1.5,
    thickness: 1.5,
    color: mainColor,
    indent: 8.0,
    endIndent: 8.0,
  );
  return Container(
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24.0),
      border: Border.all(
        width: 2,
        color: mainColor,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _doubleListTile(
          firstText: 'Información Taxonómica',
          backgroundColor: opaqueColor,
          style: textTheme.titleLarge,
        ),
        Divider(
          height: 2.0,
          thickness: 2.0,
          color: mainColor,
        ),
        /* _doubleListTile(
          firstText: 'Reino',
          secondText: kingdom.name ?? '-',
          divideColor: mainColor,
          style: textTheme.labelLarge,
        ),
        customDivider,
        _doubleListTile(
          firstText: 'Filo',
          secondText: taxonomy.phylum?.name ?? '-',
          divideColor: mainColor,
          style: textTheme.labelLarge,
        ),
        customDivider,
        _doubleListTile(
          firstText: 'Clase',
          secondText: taxonomy.classC?.name ?? '-',
          divideColor: mainColor,
          style: textTheme.labelLarge,
        ),
        customDivider,
        _doubleListTile(
          firstText: 'Orden',
          secondText: taxonomy.order?.name ?? '-',
          divideColor: mainColor,
          style: textTheme.labelLarge,
        ),
        customDivider,
        _doubleListTile(
          firstText: 'Familia',
          secondText: taxonomy.family?.name ?? '-',
          divideColor: mainColor,
          style: textTheme.labelLarge,
        ), */
      ],
    ),
  );
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
  FavoriteRepository get favoriteRepository => context.read();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8.0,
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
                        Routes.speciePdfPreview,
                        pathParameters: {
                          'specie': jsonEncode(widget.specie.toJson()),
                        },
                      ),
                    ),
                    if (widget.specie.images != null &&
                        widget.specie.images!.isNotEmpty)
                      PopupMenuItem(
                        value: 1,
                        child: _simpleList(
                            icon: Icons.image_rounded,
                            text: 'Descargar Imagen'),
                        onTap: () => download(
                            context: context,
                            urlDownload: widget.specie.images!.first),
                      ),
                    if (widget.specie.sound != null &&
                        widget.specie.sound!.isNotEmpty)
                      PopupMenuItem(
                        value: 1,
                        child: _simpleList(
                            icon: Icons.music_note_rounded,
                            text: 'Descargar Audio'),
                        onTap: () => download(
                            context: context,
                            urlDownload: widget.specie.sound!),
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
              widget.specie.name != null && widget.specie.name!.isNotEmpty
                  ? '¡Comparte la belleza de la Amazonía! Comparte esta valiosa información sobre ${widget.specie.name}, https://amazonia.iiap.gob.pe/species/details/${widget.specie.id}'
                  : '¡Comparte la belleza de la Amazonía! https://amazonia.iiap.gob.pe/species/details/${widget.specie.id}',
            ),
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
                  AccountRepository accountRepository = context.read();
                  final result = accountRepository.acces();
                  if (result) {
                    isFavorite
                        ? favoriteRepository.deleteSpecieFavorite(
                            userId: firebaseInstance.currentUser!.uid,
                            idSpecie: widget.specie.id)
                        : favoriteRepository.saveSpecieFavorite(
                            userId: firebaseInstance.currentUser!.uid,
                            specie: widget.specie,
                          );
                  } else {
                    context.pushNamed(Routes.signIn);
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
            context: context,
            error: true,
          ),
          onDownloadCompleted: (progress) {
            setState(() => _progress = null);
            customSnackBar(
              title: 'Descarga finalizada',
              context: context,
            );
          },
          onProgress: (name, progress) => setState(() => _progress = progress),
        );
      }
    }
  }
}
