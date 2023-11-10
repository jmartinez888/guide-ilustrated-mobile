import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:species/src/domain/entities/user.dart';
import 'package:species/src/domain/repositories/user/user_repository.dart';

class UserIiapRepositoryImpl extends UserRepository {
  final firebaseFirestoreInstance = FirebaseFirestore.instance.collection('users');
  final firebaseStorageInstance = FirebaseStorage.instance;

  @override
  Future createUser({
    required String userId,
    required String email,
  }) async {
    final docUser = firebaseFirestoreInstance.doc(userId);
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
  Future<Map<String, dynamic>> getUserData(String userId) async {
    final docSnapshot = await firebaseFirestoreInstance.doc(userId).get();

    if (docSnapshot.exists) {
      return docSnapshot.data() as Map<String, dynamic>;
    } else {
      return {};
    }
  }

  Future<String> uploadProfilePicture(
      String folderName, String fileName, Uint8List file) async {
    Reference ref =
        firebaseStorageInstance.ref().child(folderName).child(fileName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  @override
  Future<String> saveProfile({
    required String userId,
    required String name,
    required String lastName,
    required String phone,
    required String email,
    required Uint8List profilePicture,
  }) async {
    String response = 'Something went wrong';

    try {
      if (name.isNotEmpty || lastName.isNotEmpty) {
        String imageUrl = await uploadProfilePicture(
          'images/users/$userId/profile',
          userId,
          profilePicture,
        );
        final docUser = firebaseFirestoreInstance.doc(userId);
        final existingDoc = await docUser.get();

        DateTime now = DateTime.now();
        final created = existingDoc.exists
            ? existingDoc.data()!['created']
            : Timestamp.fromDate(now);

        final user = User(
          id: userId,
          name: name,
          lastName: lastName,
          profilePicture: imageUrl,
          phone: phone,
          created: created,
          email: existingDoc.data()!['email'],
        );

        final json = user.toJson();

        await docUser.update(json);

        response = 'Profile updated successfully';
      }
    } catch (e) {
      response = e.toString();
    }
    return response;
  }

  Future<String> saveProfileWithoutImage(
      {required String userId,
      required String name,
      required String lastName,
      required String phone,
      required String email}) async {
    String response = 'Something went wrong';

    try {
      if (name.isNotEmpty || lastName.isNotEmpty) {
        final docUser = firebaseFirestoreInstance.doc(userId);
        final existingDoc = await docUser.get();

        DateTime now = DateTime.now();
        final created = existingDoc.exists
            ? existingDoc.data()!['created']
            : Timestamp.fromDate(now);

        final user = User(
          id: userId,
          name: name,
          lastName: lastName,
          phone: phone,
          created: created,
          email: existingDoc.data()!['email'],
        );

        final json = user.toJson();

        await docUser.update(json);

        response = 'Profile updated successfully';
      }
    } catch (e) {
      response = e.toString();
    }
    return response;
  }
}
