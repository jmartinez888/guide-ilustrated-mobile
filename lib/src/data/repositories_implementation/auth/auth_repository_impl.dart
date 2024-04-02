import 'package:firebase_auth/firebase_auth.dart';
import 'package:species/src/data/models/failure/user_acces/user_acces_failure.dart';
import 'package:species/src/data/services/remote/auth_api.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/failures/session_request/session_request_failure.dart';
import 'package:species/src/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApi _authApi;

  AuthRepositoryImpl(this._authApi);

  @override
  Future<Either<SessionRequestFailure, UserCredential>> signUp({
    required String email,
    required String password,
  }) {
    return _authApi.signUp(email: email, password: password);
  }

  @override
  Future<Either<SessionRequestFailure, String>> sendVerificationEmail() {
    return _authApi.sendVerificationEmail();
  }

  @override
  Future<Either<SessionRequestFailure, UserCredential>> signIn({
    required String email,
    required String password,
  }) {
    return _authApi.signIn(email: email, password: password);
  }

  @override
  Future<void> signOut() {
    return _authApi.signOut();
  }

  @override
  Future<Either<SessionRequestFailure, String>> resetPassword(
      {required String email}) async {
    return _authApi.resetPassword(email: email);
  }

  @override
  Either<UserAccesFailure, String> isAcces() {
    final currentUserFromAuthentication =
        _authApi.currentUserFromAuthentication();
    if (currentUserFromAuthentication == null) {
      return Either.left(UserAccesFailure.empty());
    } else if (currentUserFromAuthentication.emailVerified) {
      return Either.right(currentUserFromAuthentication.uid);
    } else {
      return Either.left(UserAccesFailure.emailIsNotVerified());
    }
  }
}
