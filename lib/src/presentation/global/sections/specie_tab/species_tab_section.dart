import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/repositories/favorite/favorite_repository.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/global/functions/build_multi_grids.dart';
import 'package:species/src/presentation/global/functions/get_main_color_by_int.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/pageStorage/page_storage_bucket.dart';
import 'package:species/src/presentation/global/sections/grid_loading.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';
import 'package:species/src/presentation/global/sections/specie_tab/state/specie_tab_state.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/card/card_to_specie_grid.dart';
import 'package:species/src/presentation/global/widgets/card/custom_grid_card.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/global/widgets/skeleton/skeleton_container.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/species_details/controller/species_details_controller.dart';
import 'package:species/src/presentation/router/routes.dart';




class SpeciesTabSection extends StatefulWidget {
  final int type;
  final SpecieTabState state;
  final PagingController<int, Specie> pagingController;
  final Future<void> Function() onRefresh;
  final void Function() retryLastFailedRequest;
  final void Function() switchName;
  final void Function() switchScientificName;

  const SpeciesTabSection({
    super.key,
    required this.type,
    required this.state,
    required this.pagingController,
    required this.onRefresh,
    required this.retryLastFailedRequest,
    required this.switchName,
    required this.switchScientificName,
  });

  @override
  State<SpeciesTabSection> createState() => _SpeciesTabSectionState();
}

class _SpeciesTabSectionState extends State<SpeciesTabSection> {
  late Map<String, dynamic> mainOpaqueColor;
  late Color mainColor;
  late Color opaqueColor;
  SessionController get sessionController => context.read();
  

  @override
  void initState() {
    mainOpaqueColor = getMainColorByInt(widget.type);
    mainColor = mainOpaqueColor['main'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    opaqueColor = mainOpaqueColor['opaque'];
    final orderByName = widget.state.orderByName;
    final orderAsc = widget.state.orderAsc;
    final double width = MediaQuery.of(context).size.width;
    final SessionController sessionControllerWatch = context.watch();
    final sessionState = sessionControllerWatch.state;
    const paddingExclusive = EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 100.0);

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: widget.onRefresh,
          color: mainColor,
          child: PageStorage(
            bucket: PersistenScrollPosition.bucketGlobal,
            child: PagedMasonryGridView<int, Specie>(
              padding: paddingExclusive,
              key: PageStorageKey(widget.type),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              gridDelegateBuilder: (int childCount) {
                return SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: buildMultiGrids(width),
                );
              },
              pagingController: widget.pagingController,
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              builderDelegate: PagedChildBuilderDelegate<Specie>(
                animateTransitions: true,
                transitionDuration: const Duration(milliseconds: 400),
                newPageProgressIndicatorBuilder: (_) =>
                    const SkeletonConatiner(height: 320.0),
                firstPageErrorIndicatorBuilder: (context) => MessageException(
                  padding: paddingExclusive,
                  onPressed: widget.onRefresh,
                  lottie: 'assets/lotties/error_data.json',
                ),
                noItemsFoundIndicatorBuilder: (context) => MessageException(
                  padding: paddingExclusive,
                  onPressed: widget.onRefresh,
                  text: 'Parece que no hay especies aquí',
                  lottie: 'assets/lotties/without_data.json',
                ),
                newPageErrorIndicatorBuilder: (context) => CustomGridCard(
                  onTap: widget.retryLastFailedRequest,
                  title: 'Algo salió mal, inténtalo de nuevo',
                  image: Padding(
                    padding:
                        PaddingConfig.allWithoutBottomL,
                    child: Lottie.asset('assets/lotties/error_data.json'),
                  ),
                ),
                firstPageProgressIndicatorBuilder: (_) => const GridLoading(
                  littleGrid: true,
                  padding: paddingExclusive,
                ),
                itemBuilder: (context, specie, index) {
                  return CardToSpeciesGrid(
                    specie: specie,
                    mainColor: mainColor,
                    opaqueColor: opaqueColor,
                    onTap: () => context.pushNamed(
                      Routes.specieDetails,
                      pathParameters: {'id': specie.id.toString()},
                    ),
                    favoriteIcon: sessionState != null
                        ? _FavoriteIcon(
                            userId: sessionState,
                            idSpecie: specie.id,
                            mainColor: mainColor,
                            opaqueColor: opaqueColor,
                          )
                        : CustomIconButton(
                            tooltip: texts.general.addToFavorites,
                            icon: Icons.favorite_outline_rounded,
                            iconColor: mainColor,
                            onPressed: () {
                              context.pushNamed(Routes.signIn);
                            },
                          ),
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 48.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            reverse: true,
            padding: PaddingConfig.asymetrict,
            children: [
              ElevatedButton.icon(
                onPressed: widget.switchScientificName,
                icon: !orderByName
                    ? Icon(orderAsc
                        ? Icons.text_rotate_vertical_rounded
                        : Icons.text_rotate_up_rounded)
                    : const SizedBox(),
                label: Text(texts.species.orderScientificName),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    !orderByName ? mainColor : opaqueColor,
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    !orderByName ? opaqueColor : mainColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton.icon(
                  onPressed: widget.switchName,
                  icon: orderByName
                      ? Icon(orderAsc
                          ? Icons.text_rotate_vertical_rounded
                          : Icons.text_rotate_up_rounded)
                      : const SizedBox(),
                  label: Text(texts.species.orderName),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      orderByName ? mainColor : opaqueColor,
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      orderByName ? opaqueColor : mainColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FavoriteIcon extends StatefulWidget {
  final String userId;
  final int idSpecie;
  final Color mainColor;
  final Color opaqueColor;

  const _FavoriteIcon({
    required this.userId,
    required this.idSpecie,
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

  @override
  void initState() {
    isFavoriteStream = favoriteRepository.isFavorite(
        userId: widget.userId, idSpecie: widget.idSpecie);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: isFavoriteStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(
            color: widget.mainColor,
            backgroundColor: Colors.white,
          );
        }
        final isFavorite = snapshot.data ?? false;

        return Stack(
          alignment: Alignment.center,
          children: [
            CustomIconButton(
              tooltip: isFavorite
                  ? texts.general.removeFromFavorites
                  : texts.general.addToFavorites,
              icon: isFavorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_outline_rounded,
              iconColor: isFavorite ? Colors.white : widget.mainColor,
              backgroundColor: isFavorite ? widget.mainColor : null,
              onPressed: () async {
                if (sessionController.state != null) {
                  if (isFavorite) {
                    await favoriteRepository.deleteSpecieFavorite(
                        userId: widget.userId, idSpecie: widget.idSpecie);
                  } else {
                    setState(() => loading = true);
                    await speciesDetailsController
                        .getSpecie(widget.idSpecie.toString());
                    if (speciesDetailsController
                            .state.mapOfId[widget.idSpecie.toString()] ==
                        null) {
                      setState(() => loading = false);
                      if (mounted) {
                        customSnackBar(
                          context: context,
                          title: 'No se pudo guardar esta especie en favoritos',
                          large: true,
                          error: true,
                        );
                      }
                    } else {
                      setState(() => loading = false);
                      await favoriteRepository.saveSpecieFavorite(
                        userId: widget.userId,
                        specie: speciesDetailsController
                            .state.mapOfId[widget.idSpecie.toString()]!,
                      );
                    }
                  }
                } else {
                  context.pushNamed(Routes.signIn);
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
