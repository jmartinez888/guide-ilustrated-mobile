import 'package:species/src/data/services/remote/favorites_api.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/repositories/favorite/favorite_repository.dart';
import 'package:species/src/domain/specie_error_helper/specie_error_helper.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteApi _favoriteApi;

  FavoriteRepositoryImpl({required FavoriteApi favoriteApi})
      : _favoriteApi = favoriteApi;

  @override
  Stream<List<Specie>> getFavoritesSpecies(String userId) {
    return _favoriteApi.getFavoritesSpecies(userId);
  }

  @override
  Stream<List<SpecieErrorHelper>> getFavoritesSpeciesError(String userId) {
    return _favoriteApi.getFavoritesSpeciesError(userId);
  }

  @override
  Future<void> saveSpecieFavorite({
    required String userId,
    required Specie specie,
  }) {
    return _favoriteApi.saveSpecieFavorite(userId: userId, specie: specie);
  }

  @override
  Future<void> deleteSpecieFavorite(
      {required String userId, required int idSpecie}) {
    return _favoriteApi.deleteSpecieFavorite(
        userId: userId, idSpecie: idSpecie);
  }

  @override
  Stream<bool> isFavorite({
    required String userId,
    required int idSpecie,
  }) {
    return _favoriteApi.isFavorite(userId: userId, idSpecie: idSpecie);
  }
}
