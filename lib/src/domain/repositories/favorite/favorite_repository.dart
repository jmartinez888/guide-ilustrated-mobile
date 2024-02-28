import 'package:species/src/domain/entities/specie/specie.dart';

abstract class FavoriteRepository {
  Stream<List<Specie>> getFavoritesSpecies(String userId);

  Future<void> saveSpecieFavorite({
    required String userId,
    required Specie specie,
  });

  Future<void> deleteSpecieFavorite({
    required String userId,
    required int idSpecie,
  });
}
