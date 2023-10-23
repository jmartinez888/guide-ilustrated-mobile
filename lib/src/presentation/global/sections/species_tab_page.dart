import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/data/repositories_implementation/species_iiap/specie_species_iiap_repository_impl.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:species/src/presentation/global/functions/build_multi_grids.dart';
import 'package:species/src/presentation/global/functions/get_main_color_by_int.dart';
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

  final SpecieRepository specieRepository = SpecieSpeciesIIapRepositoryImpl();

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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mainColor = getMainColorByInt(widget.type);
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
              crossAxisCount: buildMultiGrids(width),
            );
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
              image: CustomImageContainer(
                tag: item.id,
                imageUrl: item.images.first,
                mainColor: mainColor,
              ),
              title: item.name,
              subtitle: item.scientificName,
            ),
          ),
        ),
      ),
    );
  }
}
