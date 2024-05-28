import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/entities/specie_error/specie_error.dart';
import 'package:species/src/domain/failures/firebase_request/firebase_request_failure.dart';
import 'package:species/src/domain/failures/upload_data_firts_time/upload_data_first_time.dart';

class FavoriteApi {
  final firebaseInstance = FirebaseFirestore.instance.collection('users');

  Future<Either<FirebaseRequestFailure, List<SpecieError>>> getSpeciesError({
    required String userId,
  }) async {
    try {
      final querySnapshot =
          await firebaseInstance.doc(userId).collection('favorites').get();

      if (querySnapshot.docs.isEmpty) {
        return Either.left(FirebaseRequestFailure.empty('No se econtraron tus especies favoritas'));
      }

      final speciesErrors = querySnapshot.docs.map((doc) {
        return SpecieError.fromJson(doc.data());
      }).toList();

      return Either.right(speciesErrors);
    } catch (e) {
      if (e is FirebaseException) {
        switch (e.code) {
          case 'unavailable':
            return Either.left(FirebaseRequestFailure.network('Error de conexión al obtener tus especies favoritas'));
          case 'permission-denied':
            return Either.left(FirebaseRequestFailure.denied('Permiso denegado obtener tus especies favoritas'));
          case 'not-found':
            return Either.left(FirebaseRequestFailure.empty('No se encontraron tus especies favoritas'));
          default:
            return Either.left(FirebaseRequestFailure.unknown('Error desconocido al obtener tus especies favoritas'));
        }
      } else if (e is TimeoutException) {
        return Either.left(FirebaseRequestFailure.timeout('Tu solicitud ha tardado mucho'));
      } else {
        return Either.left(FirebaseRequestFailure.unknown('Error desconocido al obtener tus especies favoritas'));
      }
    }
  }

  Future<Either<FirebaseRequestFailure, SpecieError>> getSpecieError({
    required String userId,
    required int id,
  }) async {
    try {
      final response = await firebaseInstance
          .doc(userId)
          .collection('favorites')
          .doc(id.toString())
          .get();
      if (response.exists) {
        final data = response.data();
        final specieError = SpecieError.fromJson(data!);
        return Either.right(specieError);
      } else {
        return Either.left(FirebaseRequestFailure.empty('No se encontró tu especie favorita'));
      }
    } catch (e) {
      if (e is FirebaseException) {
        switch (e.code) {
          case 'unavailable':
            return Either.left(FirebaseRequestFailure.network('Error de conexión al obtener tu especie favorita'));
          case 'permission-denied':
            return Either.left(FirebaseRequestFailure.denied('Permiso denegado obtener tu especie favorita'));
          case 'not-found':
            return Either.left(FirebaseRequestFailure.empty( 'No se encontró tu especie favorita'));
          default:
            return Either.left(FirebaseRequestFailure.unknown('Error desconocido al obtener tu especie favorita'));
        }
      } else if (e is TimeoutException) {
        return Either.left(FirebaseRequestFailure.timeout('Tu solicitud ha tardado mucho'));
      } else {
        return Either.left(FirebaseRequestFailure.unknown('Error desconocido al obtener tu especie favorita'));
      }
    }
  }

  Future<void> deleteSpeciesFavorite({
    required String userId,
    required List<String> speciesid,
  }) async {
    for (final id in speciesid) {
      await deleteSpecieFavorite(userId: userId, idSpecie: int.parse(id));
    }
  }

  Stream<List<Specie>> getFavoritesSpecies(String userId) {
    try {
      final querySnapshot = firebaseInstance
          .doc(userId)
          .collection('favorites')
          .orderBy('name')
          .snapshots();

      return querySnapshot.map((snapshot) {
        final List<Specie> species = [];

        for (var doc in snapshot.docs) {
          final data = doc.data();
          final specie = Specie.fromJson(data);
          species.add(specie);
        }
        return species;
      });
    } catch (e) {
      throw 'Ha ocurrido un error al obtener las especies';
    }
  }

  Stream<List<SpecieError>> getFavoritesSpeciesError(String userId) {
    try {
      final querySnapshot =
          firebaseInstance.doc(userId).collection('favorites').snapshots();

      return querySnapshot.map((snapshot) {
        final List<SpecieError> species = [];

        for (var doc in snapshot.docs) {
          final data = doc.data();
          final specie = SpecieError.fromJson(data);
          species.add(specie);
        }
        return species;
      });
    } catch (e) {
      throw 'Ha ocurrido un error al obtener las especies';
    }
  }

  Future<Either<UploadDataForFirstTimeFailure, List<Specie>>>
      setFavoritesSpecies({
    required List<Specie> species,
    required String userId,
  }) async {
    try {
      for (var specie in species) {
        await saveSpecieFavorite(userId: userId, specie: specie);
      }
      return Either.right(species);
    } catch (e) {
      return Either.left(UploadDataForFirstTimeFailure.unknow());
    }
  }

  Future<void> saveSpecieFavorite({
    required String userId,
    required Specie specie,
  }) async {
    final docUser = firebaseInstance.doc(userId);
    final getUser = await docUser.get();
    final json = specie.toJson();
    await getUser.reference
        .collection('favorites')
        .doc(specie.id.toString())
        .set(json);
  }

  Future<void> deleteSpecieFavorite({
    required String userId,
    required int idSpecie,
  }) async {
    final docUser = firebaseInstance.doc(userId);
    final getUser = await docUser.get();
    getUser.reference.collection('favorites').doc(idSpecie.toString()).delete();
  }

  Stream<bool> isFavorite({
    required String userId,
    required int idSpecie,
  }) {
    return firebaseInstance
        .doc(userId)
        .collection('favorites')
        .doc(idSpecie.toString())
        .snapshots()
        .map((snapshot) => snapshot.exists);
  }
}
