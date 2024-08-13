import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/entities/community/community.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/functions/build_multi_grids.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/pageStorage/page_storage_bucket.dart';
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
import 'package:species/src/presentation/global/colors.dart';

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
    
    // Configuración de colores según el tema actual
    final bool isDarkMode = colorScheme.brightness == Brightness.dark;
    final Color iconColor = isDarkMode ? CustomColors.white : CustomColors.black;
    final Color backgroundColor = isDarkMode ? CustomColors.darkSurface : CustomColors.white;

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: Text(texts.community.title),
        actions: [
          CustomIconButton(
            tooltip: texts.general.search,
            icon: Icons.search_rounded,
            iconColor: iconColor,
            onPressed: () {
              context.pushNamed(Routes.communitySearch);
            },
            backgroundColor: backgroundColor,
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: Extend(
        child: RefreshIndicator(
          onRefresh: () =>
              Future.sync(() => controllerRead.pagingController.refresh()),
          child: PageStorage(
            bucket: PersistenScrollPosition.bucketGlobal,
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
                firstPageErrorIndicatorBuilder: (context) => _errorIndicator(
                  onPressed: controllerRead.pagingController.refresh,
                ),
                noItemsFoundIndicatorBuilder: (context) => _errorIndicator(
                  onPressed: controllerRead.pagingController.refresh,
                  text: texts.community.withoutCommunities,
                  lottie: 'assets/lotties/without_data.json',
                ),
                newPageErrorIndicatorBuilder: (context) => CustomGridCard(
                  onTap: controllerRead.pagingController.retryLastFailedRequest,
                  title: texts.general.error404Again,
                  image: Padding(
                    padding: PaddingConfig.allWithoutBottomL,
                    child: Lottie.asset('assets/lotties/error_data.json'),
                  ),
                ),
                firstPageProgressIndicatorBuilder: (_) =>
                    GridLoading(padding: PaddingConfig.allL),
                itemBuilder: (context, community, index) {
                  return CustomGridCard(
                    onTap: () => context.pushNamed(
                      Routes.communityDetails,
                      pathParameters: {'id': community.id.toString()},
                    ),
                    mainColor: colorScheme.primary,
                    opaqueColor: colorScheme.primaryContainer,
                    image: CustomImageContainer(
                      mainColor: colorScheme.primary,
                      imageUrl: community.images != null &&
                              community.images!.isNotEmpty
                          ? community.images!.first
                          : null,
                      heightImage: 232.0,
                      fitImage: true,
                    ),
                    title: community.name,
                    subtitle: community.description != null &&
                            community.description!.isNotEmpty &&
                            !community.description!.startsWith('NA') &&
                            !community.description!.startsWith('-') &&
                            !community.description!.startsWith('N/A')
                        ? community.description!.replaceAll('\t', '')
                        : texts.general.nameNotAvailable,
                    maxLines: 2,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _errorIndicator({
    String? text,
    String? lottie,
    required void Function() onPressed,
  }) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        MessageException(
          padding: PaddingConfig.all,
          text: text,
          onPressed: onPressed,
          lottie: lottie ?? 'assets/lotties/error_data.json',
        ),
      ],
    );
  }
}
