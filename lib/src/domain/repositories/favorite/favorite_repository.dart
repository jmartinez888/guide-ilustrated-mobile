import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/specie_error_helper/specie_error_helper.dart';

abstract class FavoriteRepository {
  Stream<List<Specie>> getFavoritesSpecies(String userId);

  Stream<List<SpecieErrorHelper>> getFavoritesSpeciesError(String userId);

  Future<void> saveSpecieFavorite({
    required String userId,
    required Specie specie,
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
