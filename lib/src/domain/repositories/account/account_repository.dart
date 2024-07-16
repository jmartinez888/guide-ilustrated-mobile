import 'dart:typed_data';

import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/user/user.dart';
import 'package:species/src/domain/failures/firebase_request/firebase_request_failure.dart';

abstract class AccountRepository {
  Future createUser({
    required String userId,
    required String email,
  });

  Future<Either<FirebaseRequestFailure, UserC>> getUserData(String userId);

  Future<String> uploadProfilePicture(
    String folderName,
    String fileName,
    Uint8List file,
  );

  Future<String> saveProfile({
    required String userId,
    required String name,
    required String lastName,
    required String phone,
    required String email,
    required Uint8List profilePicture,
  });

  Future<String> saveProfileWithoutImage({
    required String userId,
    required String name,
    required String lastName,
    required String phone,
    required String email,
  });

  Future<void> deleteUserAccount({
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> getUserInfo();

  bool acces();
}
