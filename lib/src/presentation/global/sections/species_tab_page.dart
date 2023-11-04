import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:share_plus/share_plus.dart';
import 'package:species/src/data/repositories_implementation/species_iiap/specie_species_iiap_repository_impl.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:species/src/presentation/global/functions/build_multi_grids.dart';
import 'package:species/src/presentation/global/functions/get_main_color_by_int.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/card/custom_grid_card.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
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
  final int numberOfPostsPerRequest = 32;
  final PagingController<int, Specie> _pagingController =
      PagingController(firstPageKey: 1);

  final SpecieRepository specieRepository = SpecieSpeciesIiapRepositoryImpl();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      specieRepository.getSpecies(
        numberOfPostsPerRequest: numberOfPostsPerRequest,
        pageKey: pageKey,
        type: widget.type,
        pagingController: _pagingController,
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
    return RefreshIndicator(
      onRefresh: () => Future.sync(() => _pagingController.refresh()),
      child: Extend(
        child: PagedMasonryGridView<int, Specie>(
          key: PageStorageKey<int>(widget.type),
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
          pagingController: _pagingController,
          gridDelegateBuilder: (int childCount) {
            return SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: buildMultiGrids(width));
          },
          builderDelegate: PagedChildBuilderDelegate<Specie>(
            newPageProgressIndicatorBuilder: (_) =>
                LinearProgressIndicator(color: mainColor),
            firstPageProgressIndicatorBuilder: (_) =>
                CircularProgressIndicator(color: mainColor),
            animateTransitions: true,
            transitionDuration: const Duration(milliseconds: 400),
            itemBuilder: (context, item, index) => CustomGridCard(
              onTap: () => context.pushNamed(
                Routes.specieDetails,
                pathParameters: {'id': item.id.toString()},
              ),
              principalColor: mainColor,
              backgroundColor: opaqueColor,
              image: CustomImageContainer(
                imageUrl: item.images.first,
                mainColor: mainColor,
              ),
              title: item.name,
              subtitle: item.scientificName,
              actions: [
                _FavoriteAction(
                  context: context,
                  mainColor: mainColor,
                  specie: item,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
        CustomIconButton(
          tooltip: 'Compartir',
          icon: Icons.share,
          iconColor: Colors.white,
          backgroundColor: widget.mainColor,
          onPressed: () => Share.share(
              '¡Comparte la belleza de la Amazonía! Comparte esta valiosa información sobre ${widget.specie.name}, https://amazonia.iiap.gob.pe/species/details/${widget.specie.id}'),
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
              tooltip:
                  isFavorite ? 'Eliminar en favoritos' : 'Guardar de favoritos',
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
    );
  }
}
