import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/entities/specie_error/specie_error.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';

abstract class FavoriteRepository {
  Stream<List<Specie>> getFavoritesSpecies(String userId);

  Stream<List<SpecieError>> getFavoritesSpeciesError(String userId);

  Future<void> saveSpecieFavorite({
    required String userId,
    required Specie specie,
  });

  Future<Either<HttpRequestFailure, List<Specie>>> setFavoritesSpecies({
    required List<SpecieError> speciesError,
    required String userId,
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
