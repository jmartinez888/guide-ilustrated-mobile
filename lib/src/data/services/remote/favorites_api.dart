import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/entities/specie_error/specie_error.dart';
import 'package:species/src/domain/failures/upload_data_firts_time/upload_data_first_time.dart';

class FavoriteApi {
  final firebaseInstance = FirebaseFirestore.instance.collection('users');

  /* Stream<List<SpecieFavorite>> getFavoritesSpecies(String userId) {
    try {
      final querySnapshot = firebaseInstance
          .doc(userId)
          .collection('favorites')
          .orderBy('name')
          .snapshots();

      return querySnapshot.map((snapshot) {
        final List<SpecieFavorite> species = [];

        for (var doc in snapshot.docs) {
          final data = doc.data();
          final specie = SpecieFavorite.fromJson(data);
          species.add(specie);
        }
        return species;
      });
    } catch (e) {
      throw 'Ha ocurrido un error al obtener las especies';
    }
  }
 */

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

  Future<Either<UploadDataForFirstTimeFailure, List<Specie>>> setFavoritesSpecies({
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


/* Future<void> _saveSpecieFavoriteHelper({
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
  } */