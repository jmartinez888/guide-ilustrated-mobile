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
import 'package:provider/provider.dart';
import 'package:species/src/domain/entities/community/community.dart';
import 'package:species/src/presentation/global/widgets/card/custom_grid_card.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/pages/main/left_tabs/indigenous_community/controller/community_controller.dart';
import 'package:species/src/presentation/router/routes.dart';

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

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () =>
              Future.sync(() => controllerRead.pagingController.refresh()),
          child: CustomScrollView(
            key: const PageStorageKey('c'),
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16.0, 56.0, 16.0, 100.0),
                sliver: PagedSliverList<int, Community>.separated(
                  pagingController: controllerRead.pagingController,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8.0),
                  builderDelegate: PagedChildBuilderDelegate<Community>(
                    animateTransitions: true,
                    transitionDuration: const Duration(milliseconds: 400),
                    newPageErrorIndicatorBuilder: (context) => CustomGridCard(
                      onTap: controllerRead
                          .pagingController.retryLastFailedRequest,
                      title: 'Algo salió mal, inténtalo de nuevo',
                      image: const Text('Falló'),
                    ),
                    itemBuilder: (context, community, index) {
                      return CustomGridCard(
                        principalColor: colorScheme.primary,
                        backgroundColor: colorScheme.primaryContainer,
                         onTap: () => context.pushNamed(
                          Routes.indigenousCommunityDetails,
                          pathParameters: {'id': community.id.toString()},
                        ), 
                        image: Stack(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 48.0),
                              color: Colors.white,
                              child: CustomImageContainer(
                                imageUrl: community.image,
                                heightImage: 232.0,
                              ),
                            ),
                          ],
                        ),
                        title: community.name,
                        subtitle: community.description,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          top: 8.0,
          left: 56.0,
          child: SafeArea(
            child: CustomBackButton(),
          ),
        ),
      ],
    );
  }
}
