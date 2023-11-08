abstract class UserRepository {
  Future createUser({
    required String userId,
    required String email,
  });

  Future updateUser({
    required String userId,
    required String name,
    required String lastName,
    // required String profilePicture,
    required String phone,
    required String email,
  });

  Future<Map<String, dynamic>> getUserData(String userId);
}
