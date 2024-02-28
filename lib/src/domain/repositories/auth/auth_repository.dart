import 'package:species/src/domain/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:species/src/domain/failures/session_request/session_request_failure.dart';

abstract class AuthRepository {
  Future<Either<SessionRequestFailure, UserCredential>> signUp({
    required String email,
    required String password,
  });

  Future<Either<SessionRequestFailure, String>> sendVerificationEmail();

  Future<Either<SessionRequestFailure, UserCredential>> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<Either<SessionRequestFailure, String>> resetPassword({required String email});
}
