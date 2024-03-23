import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/specie_error_helper/specie_error_helper.dart';

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

  Stream<List<SpecieErrorHelper>> getFavoritesSpeciesError(String userId) {
    try {
      final querySnapshot = firebaseInstance
          .doc(userId)
          .collection('favorites')
          .snapshots();

      return querySnapshot.map((snapshot) {
        final List<SpecieErrorHelper> species = [];

        for (var doc in snapshot.docs) {
          final data = doc.data();
          final specie = SpecieErrorHelper.fromJson(data);
          species.add(specie);
        }
        return species;
      });
    } catch (e) {
      throw 'Ha ocurrido un error al obtener las especies';
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

/* FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('favorites')
        .doc(widget.specie.id.toString())
        .snapshots()
        .map((snapshot) => snapshot.exists); */


/* FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('favorites')
        .doc(widget.specie.id.toString())
        .snapshots()
        .map((snapshot) => snapshot.exists); */