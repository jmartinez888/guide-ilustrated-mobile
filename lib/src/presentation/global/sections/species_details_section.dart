import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:species/src/data/services/local/download_service.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/repositories/favorite/favorite_repository.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/global/functions/get_main_color_by_int.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/pageStorage/page_storage_bucket.dart';
import 'package:species/src/presentation/global/sections/author_to_specie_section.dart';
import 'package:species/src/presentation/global/sections/taxonomy_table_section.dart';
import 'package:species/src/presentation/global/utils/conservation_states_helper/conservation_states_helper.dart';
import 'package:species/src/presentation/global/widgets/alerts/custom_bottom_sheet.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/card/simple_chip.dart';
import 'package:species/src/presentation/global/widgets/images/image_generic.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/global/widgets/multimedia/custom_audio_bar.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/species_details/controller/species_details_controller.dart';
import 'package:species/src/presentation/router/routes.dart';

class SpecieDetailSection extends StatefulWidget {
  final Specie specie;
  const SpecieDetailSection({
    Key? key,
    required this.specie,
  }) : super(key: key);

  @override
  State<SpecieDetailSection> createState() => _SpecieDetailSectionState();
}

class _SpecieDetailSectionState extends State<SpecieDetailSection> {
  SessionController get sessionController => context.read();

  final download = DownloadService();

  late Map<String, dynamic> mainOpaqueColor;

  late Color mainColor;
  late Color opaqueColor;

  late Specie specie;

  late TextStyle titleLarge;
  late TextStyle titleMedium;
  late TextStyle bodyLarge;
  bool loadingDownload = false;

  @override
  void initState() {
    super.initState();
    specie = widget.specie;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    mainOpaqueColor = getMainColorByInt(specie.type?.id ?? 0);
    mainColor = mainOpaqueColor['main'];
    opaqueColor = mainOpaqueColor['opaque'];
    titleLarge = textTheme.titleLarge!;
    titleMedium = textTheme.titleMedium!;
    bodyLarge = textTheme.bodyLarge!;
    final SessionController sessionControllerWatch = context.watch();
    final sessionState = sessionControllerWatch.state;

    return Extend(
      child: GridTwoResponsive(
        leftChild: Stack(
          children: [
            specie.images != null && specie.images!.isNotEmpty
                ? InkWell(
                    borderRadius: BorderRadius.circular(16.0),
                    onTap: () => context.pushNamed(
                      Routes.image,
                      pathParameters: {
                        'images': jsonEncode(
                          specie.images,
                        ).toString(),
                      },
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: ImageGeneric(
                        backgroundColor: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        specie.images!.first,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : const Icon(Icons.image_not_supported_rounded),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 40.0,
                        width: 40.0,
                        child: PopupMenuButton(
                          enabled: !loadingDownload,
                          tooltip: texts.speciesDetailsPage.download,
                          offset: const Offset(0, 48.0),
                          padding: const EdgeInsets.all(0.0),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 0,
                              child: _simpleList(
                                  icon: Icons.picture_as_pdf_rounded,
                                  text: texts.speciesDetailsPage.generatePdf),
                              onTap: () => context.pushNamed(
                                Routes.speciePdfPreview,
                                pathParameters: {
                                  'specie': jsonEncode(specie.toJson()),
                                },
                              ),
                            ),
                            if (specie.images != null &&
                                specie.images!.isNotEmpty &&
                                specie.images!.first.isNotEmpty)
                              PopupMenuItem(
                                value: 1,
                                onTap: () async {
                                  setState(() {
                                    loadingDownload = true;
                                  });
                                  final result = await download
                                      .download(specie.images!.first);
                                  if (mounted) {
                                    if (result != null) {
                                      customSnackBar(
                                        context: context,
                                        title: result,
                                      );
                                      setState(() {
                                        loadingDownload = false;
                                      });
                                    } else {
                                      customSnackBar(
                                        context: context,
                                        error: true,
                                        title: texts
                                            .speciesDetailsPage.errorDownload,
                                      );
                                      setState(() {
                                        loadingDownload = false;
                                      });
                                    }
                                  }
                                },
                                child: _simpleList(
                                  icon: Icons.image_rounded,
                                  text: texts.speciesDetailsPage.downloadImage,
                                ),
                              ),
                            if (specie.sound != null &&
                                specie.sound!.isNotEmpty)
                              PopupMenuItem(
                                value: 1,
                                onTap: () async {
                                  setState(() {
                                    loadingDownload = true;
                                  });
                                  final result =
                                      await download.download(specie.sound!);
                                  if (mounted) {
                                    if (result != null) {
                                      customSnackBar(
                                        context: context,
                                        title: result,
                                      );
                                      setState(() {
                                        loadingDownload = false;
                                      });
                                    } else {
                                      customSnackBar(
                                        context: context,
                                        error: true,
                                        title: texts
                                            .speciesDetailsPage.errorDownload,
                                      );
                                      setState(() {
                                        loadingDownload = false;
                                      });
                                    }
                                  }
                                },
                                child: _simpleList(
                                  icon: Icons.volume_up_rounded,
                                  text: texts.speciesDetailsPage.downloadAudio,
                                ),
                              ),
                          ],
                          icon: CircleAvatar(
                            backgroundColor: mainColor,
                            child: const Icon(Icons.download_rounded,
                                color: Colors.white),
                          ),
                          surfaceTintColor: Colors.transparent,
                        ),
                      ),
                      if (loadingDownload)
                        CircularProgressIndicator(
                          color: mainColor,
                          backgroundColor: opaqueColor,
                        ),
                    ],
                  ),
                  CustomIconButton(
                    tooltip: texts.speciesDetailsPage.share,
                    icon: Icons.share,
                    iconColor: Colors.white,
                    backgroundColor: mainColor,
                    onPressed: () => Share.share(
                        '¡${texts.speciesDetailsPage.attractiveMessage} ${widget.specie.name}, https://amazonia.iiap.gob.pe/species/details/${widget.specie.id}!'),
                  ),
                  sessionState != null
                      ? _FavoriteIcon(
                          userId: sessionState,
                          specie: specie,
                          mainColor: mainColor,
                          opaqueColor: opaqueColor,
                        )
                      : CustomIconButton(
                          tooltip: texts.speciesDetailsPage.saveFavorite,
                          icon: Icons.favorite_outline_rounded,
                          iconColor: mainColor,
                          onPressed: () {
                            context.pushNamed(Routes.signIn);
                          },
                        ),
                ],
              ),
            ),
            if (specie.conservationStates != null &&
                specie.conservationStates!.isNotEmpty)
              Positioned(
                left: 8.0,
                right: 8.0,
                bottom: 8.0,
                child: SizedBox(
                  height: 40.0,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(right: 128.0),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: specie.conservationStates!.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 4.0),
                    itemBuilder: (_, index) {
                      final conservationState =
                          specie.conservationStates![index];
                      return InkWell(
                        onTap: () => showModalBottomSheet(
                            context: context,
                            builder: (context) => CustomBottomSheet(
                                  automaticallyImplyLeading: true,
                                  title: texts.speciesDetailsPage.attractiveMessage,
                                  body: [
                                    Material(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: ListTile(
                                            textColor: Colors.white,
                                            leading: ImageGeneric(
                                              conservationState.image!,
                                              height: 56.0,
                                              width: 56.0,
                                              fit: BoxFit.contain,
                                            ),
                                            title: Text(
                                              conservationState.name != null
                                                  ? conservationState.name!
                                                  : texts.speciesDetailsPage.noInformation,
                                            ),
                                            subtitle:
                                                conservationState.description !=
                                                        null
                                                    ? Text(conservationState
                                                        .description!)
                                                    : null),
                                      ),
                                    ),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 8.0),
                                      itemCount: ConservationStatesHelper
                                              .allConservationStates()
                                          .length,
                                      itemBuilder: (_, index) {
                                        final conservationStateHelper =
                                            ConservationStatesHelper
                                                .allConservationStates()[index];
                                        return ListTile(
                                          leading: SizedBox(
                                            height: 56.0,
                                            width: 120.0,
                                            child: Wrap(
                                              spacing: 8.0,
                                              runSpacing: 8.0,
                                              children:
                                                  conservationStateHelper.images
                                                      .map(
                                                        (image) => ImageGeneric(
                                                          image,
                                                          height: 56.0,
                                                          width: 56.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      )
                                                      .toList(),
                                            ),
                                          ),
                                          title: Text(
                                              conservationStateHelper.name),
                                          subtitle: Text(conservationStateHelper
                                              .description),
                                        );
                                      },
                                    ),
                                  ],
                                  floatingActionButton: const SizedBox(),
                                )),
                        child: ImageGeneric(
                          conservationState.image!,
                          height: 40.0,
                          width: 40.0,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
        rightChild: PageStorage(
          bucket: PersistenScrollPosition.bucketGlobal,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            key: PageStorageKey('${specie.id}D'),
            slivers: [
              SliverPadding(
                padding: PaddingConfig.allL,
                sliver: SliverList.list(
                  children: [
                    Text(
                      specie.name != null && specie.name!.isNotEmpty
                          ? specie.name!
                          : texts.speciesDetailsPage.nameNotAvailable,
                      style: titleLarge.copyWith(color: mainColor),
                    ),
                    Text(
                      specie.scientificName != null &&
                              specie.scientificName!.isNotEmpty
                          ? specie.scientificName!
                          : texts.speciesDetailsPage.scientificNameNotAvailable,
                      style: titleMedium.copyWith(fontStyle: FontStyle.italic),
                    ),
                    if (specie.sound != null && specie.sound!.isNotEmpty)
                      Padding(
                        padding: PaddingConfig.onlyTop,
                        child: CustomAudioBar(
                          audioUrl: specie.sound!,
                          backgroundColor: mainColor,
                          progressBarColor: Colors.white,
                        ),
                      ),
                    if (specie.year != null && specie.year!.isNotEmpty)
                      Padding(
                        padding: PaddingConfig.onlyTop,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SimpleChip(
                            backgroundColor: mainColor,
                            label: '${texts.speciesDetailsPage.year}: ${specie.year}',
                          ),
                        ),
                      ),
                    if (specie.description != null &&
                        specie.description!.isNotEmpty)
                      Padding(
                        padding: PaddingConfig.onlyTopL,
                        child: Text(
                          specie.description!.replaceAll('\t', ''),
                          textAlign: TextAlign.start,
                          style: bodyLarge,
                        ),
                      ),
                    Padding(
                      padding: PaddingConfig.onlyTopL,
                      child: TaxonomyTableSection(
                        mainColor: mainColor,
                        opaqueColor: opaqueColor,
                        classC: specie.classC,
                        family: specie.family,
                        kingdom: specie.kingdom,
                        order: specie.order,
                        phylum: specie.phylum,
                      ),
                    ),
                  ],
                ),
              ),
              if (specie.authors != null && specie.authors!.isNotEmpty)
                SliverPadding(
                  padding: PaddingConfig.allWithoutTopBottomSafeL,
                  sliver: AuthorToSpecieSection(authors: specie.authors!),
                ),
            ],
          ),
        ),
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
}

class _FavoriteIcon extends StatefulWidget {
  final String userId;
  final Specie specie;
  final Color mainColor;
  final Color opaqueColor;

  const _FavoriteIcon({
    required this.userId,
    required this.specie,
    required this.mainColor,
    required this.opaqueColor,
  });

  @override
  State<_FavoriteIcon> createState() => __FavoriteIconState();
}

class __FavoriteIconState extends State<_FavoriteIcon> {
  FavoriteRepository get favoriteRepository => context.read();
  SpecieRepository get specieRepository => context.read();
  SessionController get sessionController => context.read();
  SpeciesDetailsController get speciesDetailsController => context.read();

  late Stream<bool> isFavoriteStream;
  bool loading = false;
  late int idSpecie;

  @override
  void initState() {
    idSpecie = widget.specie.id;
    isFavoriteStream = favoriteRepository.isFavorite(
        userId: widget.userId, idSpecie: idSpecie);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: isFavoriteStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }
        final isFavorite = snapshot.data ?? false;

        return Stack(
          alignment: Alignment.center,
          children: [
            CustomIconButton(
              tooltip: isFavorite
                  ? texts.speciesDetailsPage.deleteFavorite
                  : texts.speciesDetailsPage.saveFavorite,
              icon: isFavorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_outline_rounded,
              iconColor: isFavorite ? Colors.white : widget.mainColor,
              backgroundColor: isFavorite ? widget.mainColor : null,
              onPressed: () async {
                if (isFavorite) {
                  setState(() => loading = true);
                  await favoriteRepository.deleteSpecieFavorite(
                      userId: widget.userId, idSpecie: idSpecie);
                  if (mounted) {
                    setState(() => loading = false);
                  }
                } else {
                  setState(() => loading = true);
                  await favoriteRepository.saveSpecieFavorite(
                    userId: widget.userId,
                    specie: speciesDetailsController
                        .state.mapOfId[idSpecie.toString()]!,
                  );
                  if (mounted) {
                    setState(() => loading = false);
                  }
                }
              },
            ),
            if (loading)
              CircularProgressIndicator(
                color: widget.mainColor,
                backgroundColor: Colors.white,
              ),
          ],
        );
      },
    );
  }
}
