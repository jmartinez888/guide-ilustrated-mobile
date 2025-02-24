import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import necesario para cerrar la app
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/entities/author/author.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/functions/build_multi_grids.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/sections/grid_loading.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/card/custom_grid_card.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/global/widgets/skeleton/skeleton_container.dart';
import 'package:species/src/presentation/pages/main/left_tabs/author/controller/author_controller.dart';
import 'package:species/src/presentation/router/routes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AuthorsPage extends StatefulWidget {
  const AuthorsPage({super.key});

  @override
  State<AuthorsPage> createState() => _AuthorsPageState();
}

class _AuthorsPageState extends State<AuthorsPage> {
  AuthorController get controllerRead => context.read();
  ColorScheme get colorScheme => Theme.of(context).colorScheme;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(texts.authors.title),
          ),
          actions: [
            CustomIconButton(
              tooltip: texts.general.search,
              icon: Icons.search_rounded,
              onPressed: () {
                context.pushNamed(Routes.authorSearch);
              },
            ),
            const SizedBox(width: 8.0),
          ],
        ),
        body: Extend(
          child: RefreshIndicator(
            onRefresh: () =>
                Future.sync(() => controllerRead.pagingController.refresh()),
            child: PagedMasonryGridView<int, Author>(
              padding: PaddingConfig.allL,
              pagingController: controllerRead.pagingController,
              key: const PageStorageKey('a'),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              gridDelegateBuilder: (int childCount) {
                return SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: buildMultiGridsLarge(width),
                );
              },
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              builderDelegate: PagedChildBuilderDelegate<Author>(
                animateTransitions: true,
                transitionDuration: const Duration(milliseconds: 400),
                newPageProgressIndicatorBuilder: (_) =>
                    const SkeletonConatiner(height: 320.0),
                firstPageErrorIndicatorBuilder: (context) => _errorIndicator(
                  onPressed: controllerRead.pagingController.refresh,
                ),
                noItemsFoundIndicatorBuilder: (context) => _errorIndicator(
                  onPressed: controllerRead.pagingController.refresh,
                  text: texts.authors.withoutAuthors,
                  lottie: 'assets/lotties/without_data.json',
                ),
                newPageErrorIndicatorBuilder: (context) => CustomGridCard(
                  onTap: controllerRead.pagingController.retryLastFailedRequest,
                  title: texts.general.error404Again,
                  image: Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                    child: Lottie.asset('assets/lotties/error_data.json'),
                  ),
                ),
                firstPageProgressIndicatorBuilder: (_) =>
                    const GridLoadingLarge(),
                itemBuilder: (context, author, index) {
                  return CustomGridCard(
                    onTap: () => context.pushNamed(
                      Routes.authorDetails,
                      pathParameters: {'id': author.id.toString()},
                    ),
                    mainColor: colorScheme.primary,
                    opaqueColor: colorScheme.primaryContainer,
                    image: CustomImageContainer(
                      mainColor: colorScheme.primary,
                      imageUrl: author.images != null &&
                              author.images!.isNotEmpty &&
                              author.images!.first.isNotEmpty
                          ? author.images!.first
                          : null,
                      heightImage: 232.0,
                    ),
                    title:
                        '${author.name != null && author.name!.isNotEmpty && !author.name!.startsWith('NA') && !author.name!.startsWith('-') && !author.name!.startsWith('N/A') ? author.name! : 'Nombre no disponible'} ${author.lastname != null && author.lastname!.isNotEmpty && !author.lastname!.startsWith('NA') && !author.lastname!.startsWith('-') && !author.lastname!.startsWith('N/A') ? author.lastname! : '| Apellidos no disponible'}',
                    subtitle: author.profession != null &&
                            author.profession!.isNotEmpty &&
                            !author.profession!.startsWith('NA') &&
                            !author.profession!.startsWith('-') &&
                            !author.profession!.startsWith('N/A')
                        ? author.profession!
                        : texts.authors.professionNotAvailable,
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

  Future<bool> _onWillPop(BuildContext context) async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('¿Salir de la app?'),
        content: Text('¿Estás seguro que quieres salir?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // No salir
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(), // Salir de la app
            child: Text('Sí'),
          ),
        ],
      ),
    );
    return shouldPop ?? false;
  }
}
