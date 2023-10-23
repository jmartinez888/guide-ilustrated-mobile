abstract class UserRepository {
  Future createUser({
    required String userId,
    required String email,
  });

}
