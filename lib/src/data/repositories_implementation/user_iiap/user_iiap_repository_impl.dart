import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/domain/entities/user.dart';
import 'package:species/src/domain/repositories/user/user_repository.dart';

class UserIiapRepositoryImpl extends UserRepository {
  final firebaseInstance = FirebaseFirestore.instance.collection('users');

  @override
  Future createUser({
    required String userId,
    required String email,
  }) async {
    final docUser = firebaseInstance.doc(userId);
    final existingDoc = await docUser.get();

    DateTime now = DateTime.now();
    final created = existingDoc.exists
        ? existingDoc.data()!['created']
        : Timestamp.fromDate(now);

    final user = User(
      id: userId,
      email: email,
      created: created,
    );

    final json = user.toJson();

    await docUser.set(json);
  }

  @override
  Future<void> saveFavorite({
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
}
