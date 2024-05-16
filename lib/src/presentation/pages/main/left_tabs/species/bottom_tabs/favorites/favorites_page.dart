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
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/inputs/search_text_field.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/controller/favorite_controller.dart';
import 'package:flutterflow_paginate_firestore/paginate_firestore.dart';
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
    print('🧨 ${sessionController.state!}');
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
      body: Column(
        children: [
          AppBar(
            leading: const SizedBox(),
            title: switchSearch
                ? SearchTextField(
                    focusNode: searchFocusNode,
                    controller: searchController,
                    hintText: texts.favorites.hintText,
                    onChanged: (value) {
                      _startSearchTimer();
                    },
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
                icon: Icon(
                  switchSearch ? Icons.close_rounded : Icons.search_rounded,
                ),
              ),
            ],
          ),
          Expanded(
            child: CustomPaginateFirestore(
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
              /* itemBuilderType: PaginateBuilderType.listView,
              itemsPerPage: 16,
              isLive: true,
              separator: const SizedBox(height: 8.0),
              padding: PaddingConfig.allBottomSafeL,
              initialLoader: const Center(child: CircularProgressIndicator()),
              onEmpty: const MessageException(
                text:
                    'Empieza a marcar especies como favoritas para verlas aquí',
                lottie: 'assets/lotties/without_data.json',
              ), */
              onError: (_) => MessageException(
                text:
                    'Hemos hecho cambios importantes, toca en "Recuperar las especies" para actualizar la información',
                lottie: 'assets/lotties/update.json',
                buttonText: 'Recuperar las especies',
                onPressed: interaction
                    ? () async {
                        setState(() => interaction = false);
                        final setFavoritesSpecies = await favoriteRepository
                            .restoreUserSpeciesToFavorites(
                                sessionController.state!);

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
                                title:
                                    'Se han restaurado tus especies favoritas',
                                error: true,
                              );
                            }
                          },
                        );
                      }
                    : null,
              ),
              //bottomLoader: const Center(child: LinearProgressIndicator()),
              itemBuilder: (context, snapshot, index) {
                final Map<String, dynamic> json =
                    snapshot[index].data() as Map<String, dynamic>;
                final specie = Specie.fromJson(json);
                final getMainColors = getMainColorByInt(specie.type?.id ?? 0);
                final mainColor = getMainColors['main'];
                final opaqueColor = getMainColors['opaque'];
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
                          title: 'No se pudo realizar esta acción',
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
                    opaqueColor: opaqueColor,
                    image: specie.images != null &&
                            specie.images!.isNotEmpty &&
                            specie.images!.isNotEmpty
                        ? Container(
                            width: double.infinity,
                            height: 256.0,
                            color: Colors.white,
                            child: CustomImageContainer(
                              mainColor: mainColor,
                              imageUrl: specie.images!.first,
                              heightImage: 232.0,
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
                    description: specie.description != null &&
                            specie.description!.isNotEmpty
                        ? specie.description!.replaceAll('\t', '')
                        : null,
                    maxLines: 3,
                    fontStyle: FontStyle.italic,
                  ),
                );
              },
              onErrorWidget: MessageException(
                text:
                    'Hemos hecho cambios importantes, toca en "Recuperar las especies" para actualizar la información',
                lottie: 'assets/lotties/update.json',
                buttonText: 'Recuperar las especies',
                onPressed: interaction
                    ? () async {
                        setState(() => interaction = false);
                        final setFavoritesSpecies = await favoriteRepository
                            .restoreUserSpeciesToFavorites(
                                sessionController.state!);

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
                                title:
                                    'Se han restaurado tus especies favoritas',
                              );
                            }
                          },
                        );
                      }
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPaginateFirestore extends StatelessWidget {
  final Query query;
  final Widget Function(BuildContext, List<DocumentSnapshot<Object?>>, int)
      itemBuilder;
  final Widget Function(Exception)? onError;
  final Widget onErrorWidget;

  const CustomPaginateFirestore({
    super.key,
    required this.query,
    required this.itemBuilder,
    required this.onError,
    required this.onErrorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return PaginateFirestore(
      query: query,
      itemBuilder: (context, snapshot, index) {
        try {
          return itemBuilder(context, snapshot, index);
        } catch (e) {
          print('Error al crear la instancia de Specie: $e');
          // Aquí puedes mostrar un mensaje de error o tomar otras acciones.
          return onErrorWidget;
        }
      },
      itemBuilderType: PaginateBuilderType.listView,
      itemsPerPage: 16,
      isLive: true,
      separator: const SizedBox(height: 8.0),
      padding: PaddingConfig.allBottomSafeL,
      initialLoader: const Center(child: CircularProgressIndicator()),
      onError: onError,

      // ... otros parámetros de PaginateFirestore ...
    );
  }
}

class FlexibleCard extends StatelessWidget {
  final Widget? image;
  final String? title;
  final String? subtitle;
  final String? description;
  final FontStyle? fontStyle;
  final List<Widget>? actions;
  final Widget? trailing;
  final Color? mainColor;
  final Color? opaqueColor;
  final void Function()? onTap;
  final void Function()? deleteFavorite;
  final int? maxLines;

  const FlexibleCard({
    super.key,
    this.image,
    this.title,
    this.subtitle,
    this.description,
    this.fontStyle,
    this.actions,
    this.trailing,
    this.mainColor,
    this.opaqueColor,
    this.onTap,
    this.deleteFavorite,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const borderRadius = BorderRadius.all(Radius.circular(16.0));

    Widget leftWidget({
      double? width,
    }) =>
        SizedBox(
          width: width ?? 320,
          height: 256.0,
          child: image,
        );

    Widget rightWidget({
      bool extraMarging = false,
    }) =>
        Padding(
          padding: PaddingConfig.allL,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Padding(
                  padding: EdgeInsets.only(right: extraMarging ? 48.0 : 0.0),
                  child: Text(
                    title!,
                    style: textTheme.bodyLarge?.copyWith(
                      color: mainColor ?? colorScheme.onSurface,
                    ),
                    maxLines: maxLines,
                    overflow: maxLines != null ? TextOverflow.ellipsis : null,
                  ),
                ),
              if (subtitle != null)
                Padding(
                  padding: PaddingConfig.onlyTopS,
                  child: Text(
                    subtitle!,
                    style: textTheme.bodyMedium,
                    maxLines: maxLines,
                    overflow: maxLines != null ? TextOverflow.ellipsis : null,
                  ),
                ),
              if (description != null)
                Padding(
                  padding: EdgeInsets.only(right: extraMarging ? 48.0 : 0.0),
                  child: Text(
                    '${description!} ${description!}${description!}${description!}${description!}${description!}${description!}',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontStyle: fontStyle,
                    ),
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              if (actions != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      alignment: WrapAlignment.end,
                      children: actions!,
                    ),
                  ),
                ),
            ],
          ),
        );

    return Material(
      color: opaqueColor ?? colorScheme.onPrimary,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(color: mainColor ?? colorScheme.outline, width: 1.0),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Stack(
          children: [
            width <= 640
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      leftWidget(width: double.infinity),
                      rightWidget(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      leftWidget(),
                      Expanded(
                        child: rightWidget(extraMarging: true),
                      ),
                    ],
                  ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: CustomIconButton(
                icon: Icons.favorite_rounded,
                iconColor: Colors.white,
                backgroundColor: mainColor,
                onPressed: deleteFavorite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/* 
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
 */