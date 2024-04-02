import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remove_diacritic/remove_diacritic.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/entities/specie_error/specie_error.dart';
import 'package:species/src/domain/repositories/favorite/favorite_repository.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/global/functions/build_multi_grids.dart';
import 'package:species/src/presentation/global/functions/get_main_color_by_int.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/card/card_to_specie_grid.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/controller/favorite_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Stream<List<Specie>> _favorites;
  SessionController get sessionController => context.read();
  FavoriteController get favoriteControllerRead => context.read();
  FavoriteRepository get favoriteRepository => context.read();
  late Color mainColor;
  late Color opaqueColor;
  FocusNode searchFocusNode = FocusNode();

  // Añade un TextEditingController y asigna el valor por defecto
  late TextEditingController searchTextController;

  @override
  void initState() {
    _favorites =
        favoriteControllerRead.getFavoritesSpecies(sessionController.state!);

    // Inicializa el TextEditingController con el valor por defecto
    searchTextController =
        TextEditingController(text: favoriteControllerRead.state.searchText);

    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final FavoriteController favoriteControllerWatch = context.watch();
    final searchText = favoriteControllerWatch.state.searchText;
    final switchSearch = favoriteControllerWatch.state.switchSearch;

    return Scaffold(
      body: StreamBuilder<List<Specie>>(
        stream: _favorites,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            if (favoriteControllerRead.state.switchSearch) {
              favoriteControllerRead.removeSwitchSearch();
            }
            if (favoriteControllerRead.state.searchText.isNotEmpty) {
              favoriteControllerRead.removeSearchValue();
            }
            return SpecieErrorSection(userId: sessionController.state!);
          } else {
            var species = snapshot.data!;
            if (species.isEmpty) {
              if (favoriteControllerRead.state.switchSearch) {}
              if (favoriteControllerRead.state.searchText.isNotEmpty) {}
              return const MessageException(
                text:
                    'Empieza a marcar especies como favoritos para verlas aquí',
                buttonText: 'Recuperar las especies',
                lottie: 'assets/lotties/without_data.json',
              );
            }
            if (searchText.isNotEmpty) {
              species = species.where(
                (specie) {
                  if (searchText.isNotEmpty) {}
                  return specie.name != null && specie.scientificName != null;
                },
              ).where(
                (specie) {
                  final normalizedSearch =
                      removeDiacritics(searchText.toLowerCase());
                  final name = specie.name!;
                  final scientificName = specie.scientificName!;

                  return removeDiacritics(name.toLowerCase())
                          .contains(normalizedSearch) ||
                      removeDiacritics(scientificName.toLowerCase())
                          .contains(normalizedSearch);
                },
              ).toList();
            }
            return Column(
              children: [
                AppBar(
                  leading: const SizedBox(),
                  title: switchSearch
                      ? TextField(
                          focusNode: searchFocusNode,
                          controller:
                              searchTextController, // Asigna el TextEditingController
                          onChanged: (value) =>
                              favoriteControllerRead.onSearchTexChanged(value),
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
                        favoriteControllerRead.switchSearch(
                            favoriteControllerRead.state.switchSearch);
                        if (favoriteControllerRead.state.switchSearch) {
                          favoriteControllerRead
                              .onSearchTexChanged(searchTextController.text);
                          searchFocusNode.requestFocus();
                        } else {
                          favoriteControllerRead.removeSearchValue();
                          searchFocusNode.unfocus();
                        }
                      },
                      icon: Icon(
                        switchSearch
                            ? Icons.clear_rounded
                            : Icons.search_rounded,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                  ],
                ),
                Expanded(
                  child: Extend(
                    child: MasonryGridView.builder(
                      physics: const BouncingScrollPhysics(),
                      key: const PageStorageKey('favorites'),
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: buildMultiGrids(width)),
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      itemCount: species.length,
                      itemBuilder: (context, index) {
                        final specie = species[index];
                        final getMainColors =
                            getMainColorByInt(specie.type?.id ?? 0);
                        final mainColor = getMainColors['main'];
                        final opaqueColor = getMainColors['opaque'];

                        return CardToSpeciesGrid(
                          specie: specie,
                          mainColor: mainColor,
                          opaqueColor: opaqueColor,
                          favoriteIcon: CustomIconButton(
                            tooltip: texts.species.deleteFavorite,
                            icon: Icons.favorite_rounded,
                            iconColor: opaqueColor,
                            backgroundColor: mainColor,
                            onPressed: () async {
                              if (sessionController.state != null) {
                                await favoriteRepository.deleteSpecieFavorite(
                                  userId: sessionController.state!,
                                  idSpecie: specie.id,
                                );
                              } else {
                                customSnackBar(
                                  context: context,
                                  title: 'No se pudo realizar esta acción',
                                  error: true,
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class SpecieErrorSection extends StatefulWidget {
  final String userId;
  const SpecieErrorSection({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<SpecieErrorSection> createState() => _SpecieErrorSectionState();
}

class _SpecieErrorSectionState extends State<SpecieErrorSection> {
  late Stream<List<SpecieError>> _favoritesError;
  FavoriteController get userProvider => context.read();
  FavoriteRepository get favoriteRepository => context.read();
  bool interaction = true;

  @override
  void initState() {
    _favoritesError = userProvider.getFavoritesSpeciesError(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SpecieError>>(
      stream: _favoritesError,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final speciesError = snapshot.data!;
          return MessageException(
            text:
                'Hemos hecho cambios importantes, toca en "Recuperar las especies" para actualizar la información',
            buttonText: 'Recuperar las especies',
            icon: Icons.restore_rounded,
            onPressed: interaction
                ? () async {
                    setState(() => interaction = false);
                    final setFavoritesSpecies =
                        await favoriteRepository.setFavoritesSpecies(
                      speciesError: speciesError,
                      userId: widget.userId,
                    );
                    setFavoritesSpecies.when(
                      (httpRequestFailure) {
                        setState(() => interaction = true);
                        final message = httpRequestFailure.when(
                          network: () => 'Error de conexión',
                          unknown: () => 'Error desconocido',
                          notFound: () => 'Error inesperado',
                        );
                        customSnackBar(
                          context: context,
                          title: message,
                          error: true,
                        );
                      },
                      (_) {
                        if (mounted) {
                          setState(() => interaction = true);
                        }
                      },
                    );
                  }
                : null,
            lottie: 'assets/lotties/update.json',
          );
        }
      },
    );
  }
}
