import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:species/src/domain/entities/specie_favorite/specie_favorite.dart';
import 'package:species/src/domain/repositories/favorite/favorite_repository.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/global/functions/build_multi_grids.dart';
import 'package:species/src/presentation/global/functions/get_main_color_by_string.dart';
import 'package:species/src/presentation/global/sections/grid_loading.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/card/custom_grid_card.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/controller/favorite_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/controller/state/favories_state.dart';
import 'package:species/src/presentation/router/routes.dart';
import 'package:species/src/generated/translations.g.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  SessionController get sessionController => context.read();
  FavoriteRepository get favoriteRepository => context.read();
  FavoriteController get favoriteController => context.read();
  TextEditingController searchController = TextEditingController();
  String searchText = '';
  bool switchSearch = false;
  FocusNode searchFocusNode = FocusNode();
  final firebaseInstance = FirebaseAuth.instance;

  late Stream<List<SpecieFavorite>> getFavoriteSpecies;

  @override
  void initState() {
    favoriteController.subscribeToSpecies(sessionController.state!);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = context.watch();
    final state = controller.state;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: switchSearch
              ? TextField(
                  focusNode: searchFocusNode,
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: texts.favorites.hintText,
                    border: InputBorder.none,
                  ),
                )
              : Text(texts.favorites.title),
        ),
        actions: [
          if (state.species.isNotEmpty)
            IconButton(
              tooltip:
                  switchSearch ? texts.favorites.close : texts.favorites.search,
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
              icon: Icon(
                  switchSearch ? Icons.clear_rounded : Icons.search_rounded),
            ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: _BodyContainer(
        state: state,
        searchText: searchText,
        sessionController: sessionController,
        favoriteRepository: favoriteRepository,
      ),
    );
  }
}

class _BodyContainer extends StatelessWidget {
  final String searchText;
  final FavoritesState state;
  final SessionController sessionController;
  final FavoriteRepository favoriteRepository;
  const _BodyContainer({
    required this.state,
    required this.searchText,
    required this.sessionController,
    required this.favoriteRepository,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    List<SpecieFavorite> species = [];
    if (state.loading) {
      return const GridLoading();
    } else if (state.species.isEmpty) {
      return MessageException(
        text: texts.favorites.exceptionText,
        lottie: 'assets/lotties/without_data.json',
      );
    } else {
      if (searchText.isNotEmpty) {
        species = state.species.where((specie) {
          return specie.name
              .toString()
              .toLowerCase()
              .contains(searchText.toLowerCase());
        }).toList();
      } else {
        species = state.species;
      }
      return MasonryGridView.builder(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
        key: const PageStorageKey('specie_favorite'),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        physics: const BouncingScrollPhysics(),
        itemCount: species.length,
        itemBuilder: (context, index) {
          final specie = state.species[index];
          return CustomGridCard(
            onTap: () => context.pushNamed(
              Routes.specieDetailsFavorite,
              pathParameters: {'id': specie.id.toString()},
            ),
            principalColor: getMainColorByString(specie.type ?? '')['main'],
            backgroundColor: getMainColorByString(specie.type ?? '')['opaque'],
            image: Stack(
              children: [
                if (specie.images != null && specie.images!.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 48.0),
                    color: Colors.white,
                    child: CustomImageContainer(
                      imageUrl: specie.images!.first,
                      mainColor:
                          getMainColorByString(specie.type ?? '')['main'],
                      heightImageInAnother: 160.0,
                    ),
                  ),
                if (specie.vcImagenesEstado != null ||
                    specie.vcImagenesEstado!.isNotEmpty)
                  Positioned(
                    left: 8.0,
                    bottom: 8.0,
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        for (var statusImage in specie.vcImagenesEstado!)
                          CustomImageContainer(
                            borderRadius: BorderRadius.zero,
                            imageUrl: statusImage,
                            mainColor: Colors.teal,
                            heightImage: 40.0,
                            width: 40.0,
                          ),
                      ],
                    ),
                  ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      if (specie.sound != null && specie.sound!.isNotEmpty)
                        CustomIconButton(
                          onPressed: null,
                          iconColor:
                              getMainColorByString(specie.type ?? '')['main'],
                          icon: Icons.music_note_rounded,
                        ),
                      CustomIconButton(
                        tooltip: texts.favorites.deleteFavorite,
                        icon: Icons.favorite_rounded,
                        backgroundColor:
                            getMainColorByString(specie.type ?? '')['main'],
                        iconColor:
                            getMainColorByString(specie.type ?? '')['opaque'],
                        onPressed: () {
                          if (sessionController.state != null) {
                            favoriteRepository.deleteSpecieFavorite(
                              userId: sessionController.state!,
                              idSpecie: specie.id,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            title: specie.name,
            subtitle: specie.scientificName,
          );
        },
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: buildMultiGrids(width),
        ),
      );
    }
  }
}

/* state.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : state.species.isEmpty
              ? Center(
                  child: Text('Sin datos'),
                )
              : MasonryGridView.builder(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
                  key: const PageStorageKey('specie_favorite'),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.species.length,
                  itemBuilder: (context, index) {
                    final specie = state.species[index];
                    return CustomGridCard(
                      onTap: () => context.pushNamed(
                        Routes.specieDetailsFavorite,
                        pathParameters: {'id': specie.id.toString()},
                      ),
                      principalColor:
                          getMainColorByString(specie.type ?? '')['main'],
                      backgroundColor:
                          getMainColorByString(specie.type ?? '')['opaque'],
                      image: Stack(
                        children: [
                          if (specie.images != null &&
                              specie.images!.isNotEmpty)
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 48.0),
                              color: Colors.white,
                              child: CustomImageContainer(
                                imageUrl: specie.images!.first,
                                mainColor: getMainColorByString(
                                    specie.type ?? '')['main'],
                                heightImageInAnother: 160.0,
                              ),
                            ),
                          if (specie.vcImagenesEstado != null ||
                              specie.vcImagenesEstado!.isNotEmpty)
                            Positioned(
                              left: 8.0,
                              bottom: 8.0,
                              child: Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: [
                                  for (var statusImage
                                      in specie.vcImagenesEstado!)
                                    CustomImageContainer(
                                      borderRadius: BorderRadius.zero,
                                      imageUrl: statusImage,
                                      mainColor: Colors.teal,
                                      heightImage: 40.0,
                                      width: 40.0,
                                    ),
                                ],
                              ),
                            ),
                          Positioned(
                            top: 8.0,
                            right: 8.0,
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: [
                                if (specie.sound != null &&
                                    specie.sound!.isNotEmpty)
                                  CustomIconButton(
                                    onPressed: null,
                                    iconColor: getMainColorByString(
                                        specie.type ?? '')['main'],
                                    icon: Icons.music_note_rounded,
                                  ),
                                CustomIconButton(
                                  tooltip: 'Guardar en favoritos',
                                  icon: Icons.favorite_rounded,
                                  backgroundColor: getMainColorByString(
                                      specie.type ?? '')['main'],
                                  iconColor: getMainColorByString(
                                      specie.type ?? '')['opaque'],
                                  onPressed: () {
                                    context.pushNamed(Routes.signIn);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      title: specie.name,
                      subtitle: specie.scientificName,
                    );
                  },
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: buildMultiGrids(width),
                  ),
                ),
   */