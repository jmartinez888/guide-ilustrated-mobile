import 'package:species/src/domain/entities/specie_favorite/specie_favorite.dart';

abstract class FavoriteRepository {
  Stream<List<SpecieFavorite>> getFavoritesSpecies(String userId);

  Future<void> saveSpecieFavorite({
    required String userId,
    required SpecieFavorite specie,
  });

  Future<void> deleteSpecieFavorite({
    required String userId,
    required int idSpecie,
  });

  Stream<bool> isFavorite({
      required String userId,
      required int idSpecie,
    });
}
