import 'dart:async';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/entities/specie_helper/specie_helper.dart';
import 'package:species/src/domain/repositories/favorite/favorite_repository.dart';
import 'package:species/src/presentation/global/state_notifier.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/controller/state/favories_state.dart';

class FavoriteController extends StateNotifier<FavoritesState> {
  final FavoriteRepository _favoriteRepository;
  StreamSubscription<List<Specie>>? _speciesSubscription;
  StreamSubscription<List<SpecieHelper>>? _speciesHelperSubscription;

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
          errorMesage: '',
          errorMesageHelper: '',
        );
      },
      onError: (error) {
        print('${error}');
        state = state.copyWith(
          loading: false,
          errorMesage: error.toString(),
          errorMesageHelper: '',
        );
      },
    );
  }

  void subscribeToSpeciesHelper(String userId) {
    _speciesHelperSubscription?.cancel();
    _speciesHelperSubscription =
        _favoriteRepository.getFavoritesSpeciesHelper(userId).listen(
      (speciesData) {
        state = state.copyWith(
          loading: false,
          speciesHelper: speciesData,
          errorMesageHelper: '',
        );
      },
      onError: (error) {
        state = state.copyWith(
          loading: false,
          errorMesageHelper: error.toString(),
        );
      },
    );
  }

  @override
  void dispose() {
    _speciesSubscription?.cancel();
    _speciesHelperSubscription?.cancel();
    super.dispose();
  }
}
