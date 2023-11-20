import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:species/src/data/repositories_implementation/species_iiap/specie_species_iiap_repository_impl.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:species/src/presentation/global/functions/build_multi_grids.dart';
import 'package:species/src/presentation/global/functions/get_main_color_by_int.dart';
import 'package:species/src/presentation/global/sections/grid_loading.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/card/custom_grid_card.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/global/widgets/skeleton/skeleton_container.dart';
import 'package:species/src/presentation/router/routes.dart';

class SpeciesTabPageSection extends StatefulWidget {
  final int type;
  const SpeciesTabPageSection({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<SpeciesTabPageSection> createState() => _SpeciesTabPageSectionState();
}

class _SpeciesTabPageSectionState extends State<SpeciesTabPageSection> {
  final int numberOfPostsPerRequest = 16;
  final PagingController<int, Specie> _pagingController =
      PagingController(firstPageKey: 1);
  bool asc = true;
  bool orderByName = true;

  final SpecieRepository specieRepository = SpecieSpeciesIiapRepositoryImpl();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      specieRepository.getSpecies(
        numberOfPostsPerRequest: numberOfPostsPerRequest,
        pageKey: pageKey,
        type: widget.type,
        pagingController: _pagingController,
        asc: asc,
        orderBy: orderByName,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();

    super.dispose();
  }

  late Map<String, dynamic> mainOpaqueColor;
  late Color mainColor;
  late Color opaqueColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    mainOpaqueColor = getMainColorByInt(widget.type);
    mainColor = mainOpaqueColor['main'];
    opaqueColor = mainOpaqueColor['opaque'];
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        RefreshIndicator(
          color: mainColor,
          onRefresh: () => Future.sync(() => _pagingController.refresh()),
          child: Extend(
            child: PagedMasonryGridView<int, Specie>(
              key: PageStorageKey<int>(widget.type),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 100.0),
              pagingController: _pagingController,
              gridDelegateBuilder: (int childCount) {
                return SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: buildMultiGrids(width));
              },
              builderDelegate: PagedChildBuilderDelegate<Specie>(
                newPageProgressIndicatorBuilder: (_) =>
                    const SkeletonConatiner(height: 320.0),
                firstPageErrorIndicatorBuilder: (context) => MessageException(
                  onPressed: () =>
                      Future.sync(() => _pagingController.refresh()),
                  lottie: 'assets/lotties/error_data.json',
                ),
                noItemsFoundIndicatorBuilder: (context) => MessageException(
                  onPressed: () =>
                      Future.sync(() => _pagingController.refresh()),
                  text: 'Parece que no hay especies aquí',
                  lottie: 'assets/lotties/without_data.json',
                ),
                newPageErrorIndicatorBuilder: (context) => CustomGridCard(
                  onTap: () => Future.sync(
                      () => _pagingController.retryLastFailedRequest()),
                  title: 'Algo salió mal, inténtalo de nuevo',
                  image: Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 16.0),
                    child: Lottie.asset('assets/lotties/error_data.json'),
                  ),
                ),
                firstPageProgressIndicatorBuilder: (_) => const GridLoading(),
                animateTransitions: true,
                transitionDuration: const Duration(milliseconds: 400),
                itemBuilder: (context, item, index) => CustomGridCard(
                  onTap: () => context.pushNamed(
                    Routes.specieDetails,
                    pathParameters: {'id': item.id.toString()},
                  ),
                  principalColor: mainColor,
                  backgroundColor: opaqueColor,
                  image: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 48.0),
                        color: Colors.white,
                        child: CustomImageContainer(
                          imageUrl: item.images.first,
                          mainColor: mainColor,
                          heightImageInAnother: 160.0,
                        ),
                      ),
                      if (item.statusImage != null ||
                          item.statusImage!.isNotEmpty)
                        Positioned(
                          left: 8.0,
                          bottom: 8.0,
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: [
                              for (var statusImage in item.statusImage!)
                                CustomImageContainer(
                                  borderRadius: BorderRadius.zero,
                                  imageUrl: statusImage,
                                  mainColor: mainColor,
                                  heightImage: 40.0,
                                  width: 40.0,
                                  progressIndicatorBuilder: (_, __, ___) =>
                                      const SizedBox(),
                                ),
                            ],
                          ),
                        ),
                      Positioned(
                        top: 8.0,
                        right: 8.0,
                        child: _FavoriteAction(
                          context: context,
                          mainColor: mainColor,
                          specie: item,
                        ),
                      ),
                    ],
                  ),
                  title: item.name,
                  subtitle: item.scientificName,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 16.0,
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _customFilterChip(
                  context: context,
                  backgroundColor: mainColor,
                  orderValue: asc,
                  selected: asc,
                  label: asc ? 'A-Z' : 'Z-A',
                  icon: asc ? Icons.arrow_upward_rounded : Icons.arrow_downward,
                  tooltip: asc ? 'Ordenar de A-Z' : 'Ordenar de Z-A',
                  onSelected: (value) => setState(() {
                    asc = value;
                    _pagingController.refresh();
                  }),
                ),
                _customFilterChip(
                  context: context,
                  backgroundColor: mainColor,
                  orderValue: orderByName,
                  selected: orderByName,
                  label: orderByName ? 'Nombre común' : 'Nombre científico',
                  icon: orderByName
                      ? Icons.text_fields_rounded
                      : Icons.science_rounded,
                  tooltip: orderByName
                      ? 'Ordenar por nombre científico'
                      : 'Ordenar por nombre común',
                  onSelected: (value) => setState(() {
                    orderByName = value;
                    _pagingController.refresh();
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

FilterChip _customFilterChip({
  required BuildContext context,
  required Color backgroundColor,
  required bool orderValue,
  required Function(bool) onSelected,
  required bool selected,
  required String label,
  required IconData icon,
  required String tooltip,
}) {
  final textTheme = Theme.of(context).textTheme;
  return FilterChip(
    side: BorderSide.none,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
      side: BorderSide.none,
    ),
    showCheckmark: false,
    selectedColor:
        orderValue ? backgroundColor.withOpacity(0.6) : backgroundColor,
    tooltip: tooltip,
    avatar: Icon(
      icon,
      color: Colors.white,
    ),
    backgroundColor: backgroundColor,
    label:
        Text(label, style: textTheme.labelLarge?.copyWith(color: Colors.white)),
    selected: orderValue,
    onSelected: onSelected,
  );
}

class _FavoriteAction extends StatefulWidget {
  final BuildContext context;
  final Color mainColor;
  final Specie specie;
  const _FavoriteAction({
    required this.context,
    required this.mainColor,
    required this.specie,
  });

  @override
  State<_FavoriteAction> createState() => _FavoriteActionState();
}

class _FavoriteActionState extends State<_FavoriteAction> {
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
    return Wrap(
      spacing: 8.0,
      children: [
        StreamBuilder<bool>(
          stream: isFavoriteStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }
            final isFavorite = snapshot.data ?? false;

            return CustomIconButton(
              tooltip:
                  isFavorite ? 'Eliminar en favoritos' : 'Guardar de favoritos',
              icon: isFavorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_outline_rounded,
              iconColor: isFavorite ? Colors.white : widget.mainColor,
              backgroundColor: isFavorite ? widget.mainColor : null,
              onPressed: () async {
                if (firebaseInstance.currentUser == null ||
                    !firebaseInstance.currentUser!.emailVerified) {
                  context.pushNamed(Routes.signIn);
                } else {
                  if (isFavorite) {
                    specieRepository.deleteSpecieFavorite(
                        userId: firebaseInstance.currentUser!.uid,
                        idSpecie: widget.specie.id);
                  } else {
                    final specie = await specieRepository
                        .getSpecieId(widget.specie.id.toString());
                    specieRepository.saveSpecieFavorite(
                      userId: firebaseInstance.currentUser!.uid,
                      specie: specie,
                    );
                  }
                }
              },
            );
          },
        ),
      ],
    );
  }
}
