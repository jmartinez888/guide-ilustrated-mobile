/* import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:species/src/data/repositories_implementation/community_iiap/community_iiap_repository_impl.dart';
import 'package:species/src/domain/entities/community.dart';
import 'package:species/src/presentation/global/functions/build_multi_grids.dart';
import 'package:species/src/presentation/global/sections/grid_loading.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';
import 'package:species/src/presentation/global/widgets/card/custom_grid_card.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/router/routes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class IndigenousCommunityPage extends StatelessWidget {
  const IndigenousCommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text('Comunidades Indígenas'),
          actions: [
            IconButton(
              onPressed: () =>
                  context.pushNamed(Routes.indigenousCommunitySearch),
              icon: const Icon(Icons.search_rounded),
            ),
            const SizedBox(width: 8.0)
          ],
        ),
        const Expanded(child: _IndigenousCommunitySection()),
      ],
    );
  }
}

class _IndigenousCommunitySection extends StatefulWidget {
  const _IndigenousCommunitySection();

  @override
  State<_IndigenousCommunitySection> createState() =>
      _IndigenousCommunitySectionState();
}

class _IndigenousCommunitySectionState
    extends State<_IndigenousCommunitySection> {
  final int numberOfPostsPerRequest = 16;
  final PagingController<int, Community> _pagingController =
      PagingController(firstPageKey: 1);

  final communityRepository = IndigenousCommunityIiaprepositoryImpl();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      communityRepository.getIndigenousCommunities(
        numberOfPostsPerRequest: numberOfPostsPerRequest,
        pageKey: pageKey,
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
    final colorScheme = Theme.of(context).colorScheme;
    return RefreshIndicator(
      onRefresh: () => Future.sync(() => _pagingController.refresh()),
      child: Extend(
        child: PagedMasonryGridView<int, Community>(
          key: const PageStorageKey<String>('Community'),
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
          builderDelegate: PagedChildBuilderDelegate<Community>(
            animateTransitions: true,
            firstPageErrorIndicatorBuilder: (context) => MessageException(
              onPressed: () => Future.sync(() => _pagingController.refresh()),
              lottie: 'assets/lotties/community_error.json',
            ),
            noItemsFoundIndicatorBuilder: (context) => MessageException(
              onPressed: () => Future.sync(() => _pagingController.refresh()),
              text: 'Parece que no hay comunidades aquí',
              lottie: 'assets/lotties/without_data.json',
            ),
            newPageErrorIndicatorBuilder: (context) => CustomGridCard(
              onTap: () =>
                  Future.sync(() => _pagingController.controllerRead.pagingController.retryLastFailedRequest,()),
              title: 'Algo salió mal, inténtalo de nuevo',
              image: Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Lottie.asset('assets/lotties/error_data.json'),
              ),
            ),
            firstPageProgressIndicatorBuilder: (_) => const GridLoading(),
            transitionDuration: const Duration(milliseconds: 400),
            itemBuilder: (context, item, index) => CustomGridCard(
              onTap: () => context.pushNamed(
                Routes.indigenousCommunityDetails,
                pathParameters: {'id': item.id.toString()},
              ),
              backgroundColor: colorScheme.primaryContainer,
              principalColor: colorScheme.primary,
              image: CustomImageContainer(
                imageUrl: item.image.isNotEmpty
                    ? item.image
                    : 'assets/images/indigenous_community.jpg',
              ),
              title: item.name,
              subtitle: item.description,
            ),
          ),
        ),
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/entities/community/community.dart';
import 'package:species/src/presentation/global/functions/build_multi_grids.dart';
import 'package:species/src/presentation/global/sections/grid_loading.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/card/custom_grid_card.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/global/widgets/skeleton/skeleton_container.dart';
import 'package:species/src/presentation/pages/main/left_tabs/indigenous_community/controller/community_controller.dart';
import 'package:species/src/presentation/router/routes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class IndigenousCommunityPage extends StatefulWidget {
  const IndigenousCommunityPage({super.key});

  @override
  State<IndigenousCommunityPage> createState() =>
      _IndigenousCommunityPageState();
}

class _IndigenousCommunityPageState extends State<IndigenousCommunityPage> {
  CommunityController get controllerRead => context.read();
  ColorScheme get colorScheme => Theme.of(context).colorScheme;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 40.0),
          child: Text('Comunidades Indígenas'),
        ),
        actions: [
          CustomIconButton(
            tooltip: 'Buscar',
            icon: Icons.search_rounded,
            onPressed: () {
              context.pushNamed(Routes.indigenousCommunitySearch);
            },
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: Extend(
        child: RefreshIndicator(
          onRefresh: () =>
              Future.sync(() => controllerRead.pagingController.refresh()),
          child: PagedMasonryGridView<int, Community>(
            padding: const EdgeInsets.all(16.0),
            pagingController: controllerRead.pagingController,
            key: const PageStorageKey('c'),
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            gridDelegateBuilder: (int childCount) {
              return SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: buildMultiGridsLarge(width),
              );
            },
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            builderDelegate: PagedChildBuilderDelegate<Community>(
              animateTransitions: true,
              transitionDuration: const Duration(milliseconds: 400),
              newPageProgressIndicatorBuilder: (_) =>
                  const SkeletonConatiner(height: 320.0),
              firstPageErrorIndicatorBuilder: (context) => MessageException(
                onPressed: controllerRead.pagingController.refresh,
                lottie: 'assets/lotties/error_data.json',
              ),
              noItemsFoundIndicatorBuilder: (context) => MessageException(
                onPressed: controllerRead.pagingController.refresh,
                text: 'Parece que no hay especies aquí',
                lottie: 'assets/lotties/without_data.json',
              ),
              newPageErrorIndicatorBuilder: (context) => CustomGridCard(
                onTap: controllerRead.pagingController.retryLastFailedRequest,
                title: 'Algo salió mal, inténtalo de nuevo',
                image: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: Lottie.asset('assets/lotties/error_data.json'),
                ),
              ),
              firstPageProgressIndicatorBuilder: (_) =>
                  const GridLoadingLarge(),
              itemBuilder: (context, specie, index) {
                return CustomGridCard(
                  onTap: () => context.pushNamed(
                    Routes.indigenousCommunityDetails,
                    pathParameters: {'id': specie.id.toString()},
                  ),
                  principalColor: colorScheme.primary,
                  backgroundColor: colorScheme.primaryContainer,
                  image: CustomImageContainer(
                    mainColor: colorScheme.primary,
                    imageUrl: specie.image,
                    heightImage: 232.0,
                    fitImage: true,
                  ),
                  title: specie.name,
                  subtitle: specie.description,
                  fontStyle: FontStyle.italic,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
