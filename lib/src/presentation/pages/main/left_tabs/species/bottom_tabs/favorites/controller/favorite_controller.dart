import 'dart:async';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/entities/specie_error/specie_error.dart';
import 'package:species/src/domain/repositories/favorite/favorite_repository.dart';
import 'package:species/src/presentation/global/state_notifier.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/controller/state/favories_state.dart';

class FavoriteController extends StateNotifier<FavoritesState> {
  final FavoriteRepository _favoriteRepository;
  FavoriteController(
    super.state, {
    required FavoriteRepository favoriteRepository,
  }) : _favoriteRepository = favoriteRepository;

  void onSearchTexChanged(String text) {
    state = state.copyWith(searchText: text.trim().toLowerCase());
  }

  void switchSearch(bool value) {
    state = state.copyWith(switchSearch: !value);
  }

  void removeSearchValue() {
    state = state.copyWith(searchText: '');
  }

  void removeSwitchSearch() {
    state = state.copyWith(switchSearch: false);
  }

  Stream<List<Specie>> getFavoritesSpecies(String userId) {
    return _favoriteRepository.getFavoritesSpecies(userId);
  }

  Stream<List<SpecieError>> getFavoritesSpeciesError(String userId) {
    return _favoriteRepository.getFavoritesSpeciesError(userId);
  }
}
