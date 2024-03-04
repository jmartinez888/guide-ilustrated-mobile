import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:species/src/domain/entities/specie_favorite/specie_favorite.dart';

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

Stream<List<SpecieFavorite>> getFavoritesSpecies(String userId) {
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


  Future<void> saveSpecieFavorite({
    required String userId,
    required SpecieFavorite specie,
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
}
