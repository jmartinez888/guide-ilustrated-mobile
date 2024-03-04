import 'dart:async';

import 'package:flutter/material.dart';
import 'package:species/src/domain/entities/specie_favorite/specie_favorite.dart';
import 'package:species/src/domain/repositories/favorite/favorite_repository.dart';
import 'package:species/src/presentation/global/state_notifier.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/controller/state/favories_state.dart';

class FavoriteController extends StateNotifier<FavoritesState> {
  final FavoriteRepository _favoriteRepository;
  StreamSubscription<List<SpecieFavorite>>? _speciesSubscription;

  FavoriteController(
    super.state, {
    required FavoriteRepository favoriteRepository,
  }) : _favoriteRepository = favoriteRepository;

  void subscribeToSpecies(String userId) {
    _speciesSubscription?.cancel();
    _speciesSubscription =
        _favoriteRepository.getFavoritesSpecies(userId).listen(
      (speciesData) {
        state = state.copyWith(
          loading: false,
          species: speciesData,
        );
      },
      onError: (error) {
        state = state.copyWith(loading: false);
      },
    );
  }

  @override
  void dispose() {
    print('🎈 Cerrando');
    _speciesSubscription?.cancel();
    super.dispose();
  }
}
