import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:species/src/data/repositories_implementation/community_iiap/community_iiap_repository_impl.dart';
import 'package:species/src/domain/entities/community.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/router/routes.dart';

class IndigenousCommunitySearchPage extends StatefulWidget {
  const IndigenousCommunitySearchPage({super.key});

  @override
  State<IndigenousCommunitySearchPage> createState() =>
      _IndigenousCommunitySearchPageState();
}

class _IndigenousCommunitySearchPageState
    extends State<IndigenousCommunitySearchPage> {
  final int numberOfPostsPerRequest = 16;
  final PagingController<int, Community> _pagingController =
      PagingController(firstPageKey: 1);
  final communityRepository = IndigenousCommunityIiaprepositoryImpl();
  final searchController = TextEditingController();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      communityRepository.getIndigenousCommunitiesSearchGeneral(
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
        title: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide.none,
            ),
            hintText: 'Búscar comunidad indígena',
          ),
          onChanged: (value) => setState(() {
            searchController.text = value;
            _pagingController.refresh();
          }),
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
                child: PagedListView<int, Community>(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Community>(
                    firstPageErrorIndicatorBuilder: (context) {
                      return _errorIndicator(context);
                    },
                    noItemsFoundIndicatorBuilder: (context) {
                      return _errorIndicator(context);
                    },
                    newPageErrorIndicatorBuilder: (context) {
                      return _errorIndicator(context,
                          text: 'Algo salió mal. Inténtalo de nuevo');
                    },
                    animateTransitions: true,
                    transitionDuration: const Duration(milliseconds: 400),
                    itemBuilder: (context, item, index) => ListTile(
                      onTap: () => context.goNamed(
                        Routes.indigenousCommunityDetails,
                        pathParameters: {'id': item.id.toString()},
                      ),
                      leading: CustomImageContainer(
                        imageUrl: item.image.isNotEmpty
                            ? item.image
                            : 'assets/images/indigenous_community.jpg',
                        heightImage: 56.0,
                        width: 56.0,
                        fitImage: true,
                      ),
                      title: Text(item.name),
                      subtitle: Text(item.description, maxLines: 3),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

Column _errorIndicator(BuildContext context, {String? text}) {
  return Column(
    children: [
      Lottie.asset(
        'assets/lotties/without_data.json',
        width: 256.0,
        height: 256.0,
      ),
      const SizedBox(height: 16.0),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Text(
          text ??
              'No se encontraron especies relacionadas a tu búsqueda. Inténtalo de nuevo con otra comunidad indígena.',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
