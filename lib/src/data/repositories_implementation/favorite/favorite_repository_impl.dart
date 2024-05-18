import 'package:species/src/data/services/remote/favorites_api.dart';
import 'package:species/src/data/services/remote/specie_api.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/entities/specie_error/specie_error.dart';
import 'package:species/src/domain/failures/firebase_request/firebase_request_failure.dart';
import 'package:species/src/domain/repositories/favorite/favorite_repository.dart';
import 'package:species/src/generated/translations.g.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteApi _favoriteApi;
  final SpecieApi _specieApi;

  FavoriteRepositoryImpl({
    required FavoriteApi favoriteApi,
    required SpecieApi specieApi,
  })  : _favoriteApi = favoriteApi,
        _specieApi = specieApi;

  @override
  Stream<List<Specie>> getFavoritesSpecies(String userId) {
    return _favoriteApi.getFavoritesSpecies(userId);
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

  @override
  Future<Either<FirebaseRequestFailure, List<Specie>>>
      restoreUserSpeciesToFavorites(String userId) async {
    final getSpeciesError = await _favoriteApi.getSpeciesError(userId: userId);

    FirebaseRequestFailure? firebaseRequestFailureValue;
    List<SpecieError> userSpeciesError = [];
    List<Specie> specieToUpdate = [];

    getSpeciesError.when(
      (firebaseRequestFailure) {
        firebaseRequestFailure.when(
          network: (message) => firebaseRequestFailureValue =
              FirebaseRequestFailure.network(message),
          unknown: (message) => firebaseRequestFailureValue =
              FirebaseRequestFailure.unknown(message),
          empty: (message) => firebaseRequestFailureValue =
              FirebaseRequestFailure.empty(message),
          denied: (message) => firebaseRequestFailureValue =
              FirebaseRequestFailure.denied(message),
          timeout: (message) => firebaseRequestFailureValue =
              FirebaseRequestFailure.timeout(message),
        );
      },
      (speciesError) => userSpeciesError = [...speciesError],
    );
    if (firebaseRequestFailureValue != null) {
      return Either.left(firebaseRequestFailureValue!);
    }
    firebaseRequestFailureValue = null;

    final getSpeciesData = await _specieApi.getSpeciesData(
        userSpeciesError.map((specie) => specie.id.toString()).toList());

    getSpeciesData.when(
      (httpRequestFailure) {
        httpRequestFailure.when(
          network: () => firebaseRequestFailureValue =
              FirebaseRequestFailure.network(
                  texts.favoriteRepository.getSpeciesNetworkError),
          unknown: () => firebaseRequestFailureValue =
              FirebaseRequestFailure.unknown(
                  texts.favoriteRepository.getSpeciesUnknownError),
          notFound: () => firebaseRequestFailureValue =
              FirebaseRequestFailure.empty(
                  texts.favoriteRepository.getSpeciesEmptyError),
        );
      },
      (speciesToUpdateFinal) => specieToUpdate.addAll(speciesToUpdateFinal),
    );

    if (firebaseRequestFailureValue != null) {
      return Either.left(firebaseRequestFailureValue!);
    }
    firebaseRequestFailureValue = null;

    await _favoriteApi.deleteSpeciesFavorite(
        userId: userId,
        speciesid:
            specieToUpdate.map((specie) => specie.id.toString()).toList());

    final setFavoritesSpecies = await _favoriteApi.setFavoritesSpecies(
      species: specieToUpdate,
      userId: userId,
    );

    setFavoritesSpecies.when(
      (uploadDataForFirstTimeFailure) {
        uploadDataForFirstTimeFailure.when(
          network: () => firebaseRequestFailureValue =
              FirebaseRequestFailure.network(
                  texts.favoriteRepository.updateSpeciesNetworkError),
          unknow: () => firebaseRequestFailureValue =
              FirebaseRequestFailure.network(
                  texts.favoriteRepository.updateSpeciesUnknownError)
        );
      },
      (finalSpecies) => specieToUpdate = [...finalSpecies],
    );

    if (firebaseRequestFailureValue != null) {
      return Either.left(firebaseRequestFailureValue!);
    }
    firebaseRequestFailureValue = null;
    return Either.right(specieToUpdate);
  }
}
