import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/failures/firebase_request/firebase_request_failure.dart';

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

  Stream<bool> isFavorite({
    required String userId,
    required int idSpecie,
  });

  Future<Either<FirebaseRequestFailure, List<Specie>>> restoreUserSpeciesToFavorites(
      String userId);
}
