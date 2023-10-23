import 'package:species/src/domain/entities/specie.dart';

abstract class UserRepository {
  Future createUser({
    required String userId,
    required String email,
  });

  Future<void> saveFavorite({
    required String userId,
    required Specie specie,
  });
}
