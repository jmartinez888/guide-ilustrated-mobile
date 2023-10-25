import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/data/repositories_implementation/species_iiap/specie_species_iiap_repository_impl.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/presentation/global/widgets/card/custom_expansion_tile.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/router/routes.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final int numberOfPostsPerRequest = 32;
  final PagingController<int, Specie> _pagingController =
      PagingController(firstPageKey: 1);

  final specieRepository = SpecieSpeciesIiapRepositoryImpl();
  final searchController = TextEditingController();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      specieRepository.filterSpecies(
        numberOfPostsPerRequest: numberOfPostsPerRequest,
        pageKey: pageKey,
        pagingController: _pagingController,
        query: searchController.text,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Búsqueda general',
            ),
            onChanged: (value) => setState(() {
              searchController.text = value;
              _pagingController.refresh();
            }),
          ),
          actions: [
            searchController.text.isNotEmpty
                ? IconButton(
                    tooltip: 'Limpiar',
                    onPressed: () => setState(
                          () {
                            searchController.clear();
                            _pagingController.refresh();
                          },
                        ),
                    icon: const Icon(Icons.clear_rounded))
                : IconButton(
                    tooltip: 'Buscar',
                    onPressed: () {},
                    icon: const Icon(Icons.search_rounded)),
            const SizedBox(width: 8.0),
          ],
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () => Future.sync(() => _pagingController.refresh()),
            child: Extend(
              min: true,
              child: PagedListView<int, Specie>(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Specie>(
                  newPageProgressIndicatorBuilder: (_) =>
                      const LinearProgressIndicator(),
                  animateTransitions: true,
                  transitionDuration: const Duration(milliseconds: 400),
                  itemBuilder: (context, item, index) => ListTile(
                    onTap: () => context.pushNamed(
                      Routes.specieDetails,
                      pathParameters: {'id': item.id.toString()},
                    ),
                    leading: CustomImageContainer(
                      tag: '${item.id}zzz',
                      imageUrl: item.images.first,
                      heightImage: 56.0,
                      width: 56.0,
                      fitImage: true,
                    ),
                    title: Text(item.name),
                    subtitle: Text(item.scientificName),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
