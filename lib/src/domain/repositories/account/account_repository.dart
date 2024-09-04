import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/user/user.dart';
import 'package:species/src/domain/failures/firebase_request/firebase_request_failure.dart';

class AccountRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<void> createUser({
    required String userId,
    required String email,
  }) async {
    final userRef = _firestore.collection('users').doc(userId);
    await userRef.set({
      'userId': userId,
      'email': email,
    });
  }

  Future<Either<FirebaseRequestFailure, UserC>> getUserData(String userId) async {
    final userRef = _firestore.collection('users').doc(userId);
    final snapshot = await userRef.get();
    return snapshot.exists
        ? Either.right(UserC(
            id: snapshot.data()?['userId'] ?? '',
            email: snapshot.data()?['email'] ?? '',
            name: snapshot.data()?['name'] ?? '',
            lastName: snapshot.data()?['lastName'] ?? '',
            phone: snapshot.data()?['phone'] ?? '',
            profilePicture: snapshot.data()?['profilePicture'] ?? '',
          ))
        : Either.left(FirebaseRequestFailure.empty("User not found"));
  }

  Future<Either<FirebaseRequestFailure, String>> uploadProfilePicture(
  String folderName,
  String fileName,
  Uint8List file,
) async {
  try {
    final ref = _firebaseStorage.ref().child('$folderName/$fileName');
    final uploadTask = ref.putData(file);
    final snapshot = await uploadTask.whenComplete(() {});
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return Either.right(downloadUrl);
  } catch (e) {
    return Either.left(FirebaseRequestFailure.unknown(e.toString()));
  }
}

  Future<Either<FirebaseRequestFailure, void>> saveProfile({
    required String userId,
    required String name,
    required String lastName,
    required String phone,
    required String email,
    required Uint8List profilePicture,
  }) async {
    final imageUrl = await uploadProfilePicture('profilePictures', userId, profilePicture);
    return imageUrl.when(
      (failure) => Either.left(failure),
      (url) async {
        final userRef = _firestore.collection('users').doc(userId);
        await userRef.update({
          'name': name,
          'lastName': lastName,
          'phone': phone,
          'email': email,
          'profilePicture': url,
        });
        return Either.right(null);
      },
    );
  }

  Future<Either<dynamic, void>> saveProfileWithoutImage({
    required String userId,
    required String name,
    required String lastName,
    required String phone,
    required String email,
  }) async {
    final userRef = _firestore.collection('users').doc(userId);
    return await userRef.update({
      'name': name,
      'lastName': lastName,
      'phone': phone,
      'email': email,
    }).then((_) => Either.right(null)).catchError((e) => Either.left(FirebaseRequestFailure.unknown(e.toString())));
  }

  Future<void> deleteUserAccount({
    required String email,
    required String password,
  }) async {
    // Implementa la lógica para eliminar la cuenta del usuario
  }

  Future<Map<String, dynamic>> getUserInfo() async {
    // Implementa la lógica para obtener la información del usuario
    return {};
  }

  bool acces() {
    // Implementa la lógica de acceso
    return true;
  }

  Future<void> getStreamUserData(String userId) async {
    // Implementa la lógica para obtener los datos del usuario en tiempo real
  }

  UserC get userData => throw UnimplementedError();

  Stream<UserC> get onUserDataChanged => throw UnimplementedError();
}
