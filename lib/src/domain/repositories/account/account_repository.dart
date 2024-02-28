import 'dart:typed_data';

abstract class AccountRepository {
  Future createUser({
    required String userId,
    required String email,
  });

  Future<Map<String, dynamic>> getUserData(String userId);


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

  Future<void> deleteUserAccount(String password);

  Future<Map<String, dynamic>> getUserInfo();

  bool acces();
}
