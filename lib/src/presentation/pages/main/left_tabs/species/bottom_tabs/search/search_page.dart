import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/data/repositories_implementation/species_iiap/specie_species_iiap_repository_impl.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/router/routes.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final int numberOfPostsPerRequest = 16;
  final PagingController<int, Specie> _pagingController =
      PagingController(firstPageKey: 1);

  final specieRepository = SpecieSpeciesIiapRepositoryImpl();

  String searchTerm = '';

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      specieRepository.filterSpecies(
        numberOfPostsPerRequest: numberOfPostsPerRequest,
        pageKey: pageKey,
        pagingController: _pagingController,
        query: searchTerm,
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
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(left: 32.0),
          child: TextField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Palometa...',
            ),
            onChanged: (value) {
              searchTerm = value;
              _pagingController.refresh();
            },
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => _pagingController.refresh()),
        child: Extend(
          child: PagedListView<int, Specie>(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Specie>(
              newPageProgressIndicatorBuilder: (_) =>
                  const LinearProgressIndicator(),
              animateTransitions: true,
              transitionDuration: const Duration(milliseconds: 400),
              itemBuilder: (context, item, index) {
                if (searchTerm.isNotEmpty &&
                    (item.name
                            .toLowerCase()
                            .contains(searchTerm.toLowerCase()) ||
                        item.scientificName
                            .toLowerCase()
                            .contains(searchTerm.toLowerCase()))) {
                  return searchResulList(item, context);
                } else if (searchTerm.isEmpty) {
                  // Si no hay término de búsqueda, muestra todas las especies
                  return searchResulList(item, context);
                } else {
                  // Si no hay coincidencia con el término de búsqueda, retorna un contenedor vacío
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Container searchResulList(Specie item, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: item.images.first,
          imageBuilder: (context, imageProvider) => Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
          ),
          placeholder: (context, url) => Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.black12,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Text(item.name),
        subtitle:
            Text(item.scientificName, style: TextStyle(color: Colors.grey)),
        trailing: IconButton(
          icon: const Icon(
            Icons.chevron_right,
            color: Colors.black26,
            size: 32.0,
          ),
          onPressed: () => context.pushNamed(
            Routes.specieDetails,
            pathParameters: {'id': item.id.toString()},
          ),
          tooltip: 'Ver detalles',
        ),
      ),
    );
  }
}
