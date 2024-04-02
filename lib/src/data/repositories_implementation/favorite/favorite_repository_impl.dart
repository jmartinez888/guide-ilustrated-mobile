import 'package:species/src/data/services/remote/favorites_api.dart';
import 'package:species/src/data/services/remote/specie_api.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/entities/specie_error/specie_error.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';
import 'package:species/src/domain/repositories/favorite/favorite_repository.dart';

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
  Stream<List<SpecieError>> getFavoritesSpeciesError(String userId) {
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

  @override
  Future<Either<HttpRequestFailure, List<Specie>>> setFavoritesSpecies({
    required List<SpecieError> speciesError,
    required String userId,
  }) async {
    final List<String> ids = speciesError.map((e) => e.id.toString()).toList();
    final getSpeciesData = await _specieApi.getSpeciesData(ids);
    HttpRequestFailure? httpRequestFailureValue;
    List<Specie> speciesFinal = [];

    getSpeciesData.when(
      (httpRequestFailure) => httpRequestFailureValue = httpRequestFailure,
      (species) => speciesFinal.addAll(species),
    );
    if (httpRequestFailureValue != null) {
      return httpRequestFailureValue!.when(
        network: () => Either.left(HttpRequestFailure.network()),
        unknown: () => Either.left(HttpRequestFailure.unknown()),
        notFound: () => Either.left(HttpRequestFailure.notFound()),
      );
    }
    final setSpecies = await _favoriteApi.setFavoritesSpecies(
      species: speciesFinal,
      userId: userId,
    );

    return setSpecies.when(
      (uploadDataForFirstTimeFailure) {
        return uploadDataForFirstTimeFailure.when(
          network: () => Either.left(HttpRequestFailure.network()),
          unknow: () => Either.left(HttpRequestFailure.unknown()),
        );
      },
      (setSpeciesResult) {
        print('🎀 final ${setSpeciesResult}');
       return Either.right(setSpeciesResult);
      },
    );

    /* final List<Specie> finalSpecies = [];
    final List<String> ids = speciesError.map((e) => e.id.toString()).toList();
    print('🎈 $ids');
    final getSpecies = await _specieApi.getSpeciesData(ids);

    return getSpecies.when(
      (httpRequestFailure) {
        return httpRequestFailure.when(
          network: () => Either.left(HttpRequestFailure.network()),
          unknown: () => Either.left(HttpRequestFailure.unknown()),
          notFound: () => Either.left(HttpRequestFailure.unknown()),
        );
      },
      (specieResult) {
        print('🧨 $specieResult');
        print('🧨 ${specieResult.length}');
        finalSpecies.addAll(specieResult);
        return Either.right(finalSpecies);
      },
    ); */
    /* final getSpecies =
          await _specieApi.getSpeciesData(speciesError[i].id.toString());

      getSpecies.when(
        (httpRequestFailure) {
          return httpRequestFailure.when(
            network: () => Either.left(HttpRequestFailure.network()),
            unknown: () => Either.left(HttpRequestFailure.unknown()),
            notFound: () => Either.left(HttpRequestFailure.notFound()),
          );
        },
        (speciesResult) async {
          finalSpecies.addAll(speciesResult);
        },
      ); */
  }
  /* print('🎈 ${finalSpecies}');
    print('🎈 ${finalSpecies.length}');

    final setFavoritesSpecies = await _favoriteApi.setFavoritesSpecies(
      species: finalSpecies,
      userId: userId,
    );

    return setFavoritesSpecies.when(
      (uploadDataForFirstTimeFailure) {
        print('Error');
        return uploadDataForFirstTimeFailure.when(
          network: () => Either.left(HttpRequestFailure.network()),
          unknow: () => Either.left(HttpRequestFailure.unknown()),
        );
      },
      (speciesSet) {
        print('🎆 Finalizò');
        return Either.right(speciesSet);
      },
    ); */
}
