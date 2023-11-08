import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future updateUser({
    required String userId,
    required String name,
    required String lastName,
    // required String profilePicture,
    required String phone,
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
      name: name,
      lastName: lastName,
      // profilePicture: profilePicture,
      phone: phone,
      created: created,
      email: existingDoc
          .data()!['email'], // Recupera el correo electrónico existente
    );

    final json = user.toJson();

    await docUser.set(json);
  }

  @override
  Future<Map<String, dynamic>> getUserData(String userId) {
    return firebaseInstance.doc(userId).get().then((doc) => doc.data()!);
  }
}
