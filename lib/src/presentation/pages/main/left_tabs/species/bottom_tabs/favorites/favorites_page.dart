import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/data/repositories_implementation/species_iiap/specie_species_iiap_repository_impl.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:species/src/presentation/global/functions/build_multi_grids.dart';
import 'package:species/src/presentation/global/widgets/card/custom_grid_card.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/router/routes.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  TextEditingController searchController = TextEditingController();
  List<Specie> customers = [];
  String searchText = '';
  final specieRepository = SpecieSpeciesIiapRepositoryImpl();
  bool switchSearch = false;
  FocusNode searchFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40.0,
        leading: const SizedBox(),
        title: switchSearch
            ? TextField(
                focusNode: searchFocusNode,
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Busca tu favorito',
                  border: InputBorder.none,
                ),
              )
            : const Text('Favoritos'),
        actions: [
          IconButton(
            tooltip: switchSearch ? 'Cerrar' : 'Buscar',
            onPressed: () {
              setState(() {
                switchSearch = !switchSearch;
                if (switchSearch) {
                  searchFocusNode.requestFocus();
                } else {
                  searchFocusNode.unfocus();
                  searchController.clear();
                  searchText = '';
                }
              });
            },
            icon:
                Icon(switchSearch ? Icons.clear_rounded : Icons.search_rounded),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: StreamBuilder(
        stream: specieRepository.getFavoriteSpecies(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          var species = snapshot.data!;

          if (species.isEmpty) {
            return const Center(
                child: Text('Aún no guardas como favorito a ninguna especie'));
          }

          if (searchText.isNotEmpty) {
            species = species.where((specie) {
              return specie.name
                  .toString()
                  .toLowerCase()
                  .contains(searchText.toLowerCase());
            }).toList();
          }

          return MasonryGridView.builder(
            itemCount: species.length,
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
            physics: const BouncingScrollPhysics(),
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: buildMultiGrids(width)),
            itemBuilder: (context, index) {
              final specie = species[index];
              return CustomGridCard(
                onTap: () => context.pushNamed(
                  Routes.specieDetailsFavorite,
                  pathParameters: {'specie': jsonEncode(specie.toJson())},
                ),
                image: CustomImageContainer(
                  tag: specie.id,
                  imageUrl: specie.images.first,
                ),
                title: specie.name,
                subtitle: specie.scientificName,
              );
            },
          );
        },
      ),
    );
  }
}
