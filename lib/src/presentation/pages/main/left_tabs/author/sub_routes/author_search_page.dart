import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/entities/author/author.dart';
import 'package:species/src/domain/repositories/author/author_repository.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/global/widgets/inputs/search_text_field.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/router/routes.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';

class AuthorSearchPage extends StatefulWidget {
  const AuthorSearchPage({super.key});

  @override
  State<AuthorSearchPage> createState() => _AuthorSearchPageState();
}

class _AuthorSearchPageState extends State<AuthorSearchPage> {
  AuthorRepository get authorRepository => context.read();
  final int numberOfPostsPerRequest = 16;
  final PagingController<int, Author> _pagingController =
      PagingController(firstPageKey: 1);
  final searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    searchFocusNode.requestFocus();
    _pagingController.addPageRequestListener((pageKey) {
      authorRepository.getAuthorsSearchGeneral(
        query: searchController.text.trim(),
        pageKey: pageKey,
        numberOfPostsPerRequest: numberOfPostsPerRequest,
        pagingController: _pagingController,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: SearchTextField(
          controller: searchController,
          hintText: 'Buscar autor',
          focusNode: searchFocusNode,
          onChanged: (value) => setState(
            () {
              searchController.text = value;
              _pagingController.refresh();
            },
          ),
        ),
        actions: [
          if (searchController.text.isNotEmpty)
            IconButton(
                tooltip: 'Limpiar',
                onPressed: () => setState(
                      () {
                        searchController.clear();
                        _pagingController.refresh();
                      },
                    ),
                icon: const Icon(Icons.clear_rounded)),
          const SizedBox(width: 8.0),
        ],
      ),
      body: searchController.text.isNotEmpty
          ? RefreshIndicator(
              onRefresh: () => Future.sync(() => _pagingController.refresh()),
              child: Extend(
                min: true,
                child: PagedListView<int, Author>(
                  physics: const BouncingScrollPhysics(),
                  padding: PaddingConfig.allL,
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Author>(
                    firstPageErrorIndicatorBuilder: (context) =>
                        _errorIndicator(
                      onPressed: () => _pagingController.refresh(),
                    ),
                    noItemsFoundIndicatorBuilder: (context) => _errorIndicator(
                      onPressed: () => _pagingController.refresh(),
                      text: 'Parece que no hay autores aquí',
                    ),
                    newPageErrorIndicatorBuilder: (context) => ListTile(
                      onTap: () => _pagingController.retryLastFailedRequest(),
                      leading: Lottie.asset(
                        'assets/lotties/error_data.json',
                        width: 56.0,
                        height: 56.0,
                      ),
                      title: const Text(
                          'Algo salió mal, toca aquí para reintentar'),
                      trailing: const Icon(Icons.refresh_rounded),
                    ),
                    animateTransitions: true,
                    transitionDuration: const Duration(milliseconds: 400),
                    itemBuilder: (context, author, index) => ListTile(
                      onTap: () => context.goNamed(
                        Routes.authorDetails,
                        pathParameters: {'id': author.id.toString()},
                      ),
                      leading: author.images != null && author.images!.isNotEmpty && author.images!.first.isNotEmpty
                          ? CustomImageContainer(
                              imageUrl: author.images!.first,
                              heightImage: 56.0,
                              width: 56.0,
                              fitImage: true,
                            )
                          : null,
                      title: Text(author.name ?? 'Sin información'),
                      subtitle: Text(author.lastname ?? 'Sin información',
                          maxLines: 2),
                      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }

  Widget _errorIndicator({
    String? text,
    String? lottie,
    required void Function() onPressed,
  }) {
    return MessageException(
      padding: PaddingConfig.all,
      text: text,
      onPressed: onPressed,
      lottie: lottie ?? 'assets/lotties/error_data.json',
    );
  }
}
