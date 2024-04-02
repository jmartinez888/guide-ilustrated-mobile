import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:species/src/data/services/remote/account_api.dart';
import 'package:species/src/domain/repositories/account/account_repository.dart';

class AccountRepositoryImpl extends AccountRepository {
  final AccountApi _accountApi;

  final firebaseFirestoreInstance =
      FirebaseFirestore.instance.collection('users');
  final firebaseStorageInstance = FirebaseStorage.instance;

  AccountRepositoryImpl({required AccountApi accountApi})
      : _accountApi = accountApi;

  @override
  Future createUser({
    required String userId,
    required String email,
  }) {
    return _accountApi.createUser(userId: userId, email: email);
  }

  @override
  Future<Map<String, dynamic>> getUserData(String userId) {
    return _accountApi.getUserData(userId);
  }

  @override
  Future<String> uploadProfilePicture(
    String folderName,
    String fileName,
    Uint8List file,
  ) async {
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
    return _accountApi.saveProfile(
      userId: userId,
      name: name,
      lastName: lastName,
      phone: phone,
      email: email,
      profilePicture: profilePicture,
    );
  }

  @override
  Future<String> saveProfileWithoutImage({
    required String userId,
    required String name,
    required String lastName,
    required String phone,
    required String email,
  }) async {
    return _accountApi.saveProfileWithoutImage(
      userId: userId,
      name: name,
      lastName: lastName,
      phone: phone,
      email: email,
    );
  }

  @override
  Future<void> deleteUserAccount(String password) {
    return _accountApi.deleteUserAccount(password);
  }

  @override
  Future<Map<String, dynamic>> getUserInfo() async {
    return _accountApi.getUserInfo();
  }

  @override
  bool acces() {
    return _accountApi.acces();
  }
}
