import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:remove_diacritic/remove_diacritic.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/repositories/favorite/favorite_repository.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/global/functions/get_main_color_by_int.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';
import 'package:species/src/presentation/global/widgets/card/flexible_card.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/inputs/search_text_field.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/controller/favorite_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/widgets/custom_paginate_firebase.dart';
import 'package:species/src/presentation/router/routes.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  SessionController get sessionController => context.read();
  FavoriteController get favoriteControllerRead => context.read();
  FavoriteRepository get favoriteRepository => context.read();
  FocusNode searchFocusNode = FocusNode();
  bool switchSearch = false;
  bool interaction = true;

  late TextEditingController searchController;
  String searchText = '';
  Timer? _searchTimer;

  @override
  void initState() {
    searchController =
        TextEditingController(text: favoriteControllerRead.state.searchText);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _startSearchTimer() {
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(seconds: 1), () {
      _performSearch();
    });
  }

  void _performSearch() {
    setState(() {
      searchText = removeDiacritics(
        searchController.text
            .trim()
            .replaceAll('ñ', 'N&')
            .replaceAll('Ñ', 'N&')
            .toUpperCase(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: switchSearch
            ? SearchTextField(
                focusNode: searchFocusNode,
                controller: searchController,
                hintText: texts.favorites.hintText,
                onChanged: (value) => _startSearchTimer(),
              )
            : Text(texts.favorites.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                switchSearch = !switchSearch;
                searchFocusNode.requestFocus();

                if (!switchSearch) {
                  searchFocusNode.unfocus();
                  searchController.clear();
                  searchText = '';
                }
              });
            },
            tooltip: switchSearch ? texts.general.close : texts.general.search,
            icon: Icon(
              switchSearch ? Icons.close_rounded : Icons.search_rounded,
            ),
          ),
        ],
      ),
      body: CustomPaginateFirestore(
        key: Key(searchText),
        query: searchText.isNotEmpty
            ? FirebaseFirestore.instance
                .collection('users')
                .doc(sessionController.state)
                .collection('favorites')
                .where(
                  'search',
                  arrayContains: searchText,
                )
                .orderBy(
                  'name',
                  descending: false,
                )
            : FirebaseFirestore.instance
                .collection('users')
                .doc(sessionController.state)
                .collection('favorites')
                .orderBy(
                  'name',
                  descending: false,
                ),
        onError: (_) => _errorWidget(),
        itemBuilder: (context, snapshot, index) {
          final Map<String, dynamic> json =
              snapshot[index].data() as Map<String, dynamic>;
          final specie = Specie.fromJson(json);
          final getMainColors = getMainColorByInt(specie.type?.id ?? 0);
          final mainColor = getMainColors['main'];
          return Extend(
            min: true,
            child: FlexibleCard(
              deleteFavorite: () async {
                if (sessionController.state != null) {
                  await favoriteRepository.deleteSpecieFavorite(
                    userId: sessionController.state!,
                    idSpecie: specie.id,
                  );
                } else {
                  customSnackBar(
                    context: context,
                    title: texts.favorites.canNot,
                    error: true,
                  );
                }
              },
              onTap: () => context.pushNamed(
                Routes.specieDetailsFavorite,
                pathParameters: {
                  'specie': jsonEncode(specie.toJson()),
                },
              ),
              mainColor: mainColor,
              opaqueColor: mainColor.withOpacity(0.125), 
              image: specie.images != null &&
                  specie.images!.isNotEmpty &&
                  specie.images!.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(16.0), // Ajusta el radio según tu necesidad
                  child: Container(
                    width: double.infinity,
                    height: 256.0,
                    color: Colors.white,
                    child: CustomImageContainer(
                      mainColor: mainColor,
                      imageUrl: specie.images!.first,
                      heightImage: 232.0,
                    ),
                  ),
                )
              : Center(
                  child: Padding(
                    padding: PaddingConfig.allL,
                    child: const Icon(Icons.error_rounded),
                  ),
                ),
              title: specie.name,
              subtitle: specie.scientificName,
              description:
                  specie.description != null && specie.description!.isNotEmpty
                      ? specie.description!.replaceAll('\t', '')
                      : null,
              maxLines: 3,
              fontStyle: FontStyle.italic,
            ),
          );
        },
        onErrorWidget: _errorWidget(),
      ),
    );
  }

  Widget _errorWidget() => MessageException(
        text: texts.favorites.error,
        lottie: 'assets/lotties/update.json',
        buttonText: 'Recuperar las especies',
        onPressed: interaction
            ? () async {
                setState(() => interaction = false);
                final setFavoritesSpecies = await favoriteRepository
                    .restoreUserSpeciesToFavorites(sessionController.state!);

                setFavoritesSpecies.when(
                  (firebaseRequestFailure) {
                    final message = firebaseRequestFailure.when(
                      network: (message) => message,
                      unknown: (message) => message,
                      empty: (message) => message,
                      denied: (message) => message,
                      timeout: (message) => message,
                    );
                    setState(() => interaction = true);
                    customSnackBar(
                      context: context,
                      title: message,
                      error: true,
                    );
                  },
                  (_) {
                    if (mounted) {
                      setState(() => interaction = true);
                      customSnackBar(
                        context: context,
                        title: texts.favorites.yeah,
                      );
                    }
                  },
                );
              }
            : null,
      );
}
