import 'package:species/src/domain/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Either<String, UserCredential>> signUp({
    required String email,
    required String password,
  });

  Future<Either<String, String>> sendVerificationEmail();
}
