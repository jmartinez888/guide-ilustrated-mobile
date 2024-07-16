import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/failures/session_request/session_request_failure.dart';

class AuthApi {
  FirebaseAuth get _firebaseAuthInstance => FirebaseAuth.instance;

  Future<Either<SessionRequestFailure, UserCredential>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final value = await _firebaseAuthInstance.createUserWithEmailAndPassword(
        email: email.replaceAll(' ', ''),
        password: password.replaceAll(' ', ''),
      );

      return Either.right(value);
    } on FirebaseAuthException catch (e) {
      late SessionRequestFailure sessionRequestFailure;
      switch (e.code) {
        case 'user-not-found':
          sessionRequestFailure = SessionRequestFailure.notRegistered();
          break;
        case 'wrong-password':
          sessionRequestFailure = SessionRequestFailure.password();
          break;
        case 'unusual-activity':
          sessionRequestFailure = SessionRequestFailure.disable();
          break;
        case 'network-request-failed':
          sessionRequestFailure = SessionRequestFailure.network();
          break;
        default:
          sessionRequestFailure = SessionRequestFailure.unknown();
      }
      return Either.left(sessionRequestFailure);
    }
  }

  Future<Either<SessionRequestFailure, String>> sendVerificationEmail() async {
    try {
      final user = _firebaseAuthInstance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        return Either.right(
            'Se ha enviado a su correo un mensaje de verficiación, toque el mensaje para validar su correo');
      }
      return Either.right('El usuario ya está verificado');
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        return Either.left(SessionRequestFailure.network());
      }
      return Either.left(SessionRequestFailure.unknown());
    }
  }

  Future<Either<SessionRequestFailure, UserCredential>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final value = await _firebaseAuthInstance.signInWithEmailAndPassword(
        email: email.replaceAll(' ', ''),
        password: password.replaceAll(' ', ''),
      );
      return Either.right(value);
    } on FirebaseAuthException catch (e) {
      late SessionRequestFailure sessionRequestFailure;
      switch (e.code) {
        case 'INVALID_LOGIN_CREDENTIALS':
          sessionRequestFailure = SessionRequestFailure.credential();
          break;
        case 'user-not-found':
          sessionRequestFailure = SessionRequestFailure.notRegistered();
          print('Aquì');
          break;
        case 'wrong-password':
          sessionRequestFailure = SessionRequestFailure.password();
          break;
        case 'unusual activity':
          sessionRequestFailure = SessionRequestFailure.disable();
          break;
        case 'network-request-failed':
          sessionRequestFailure = SessionRequestFailure.network();
          break;
        default:
          sessionRequestFailure = SessionRequestFailure.unknown();
          break;
      }
      return Either.left(sessionRequestFailure);
    }
  }

  Future<void> signOut() async {
     _firebaseAuthInstance.signOut();
  }

  Future<Either<SessionRequestFailure, String>> resetPassword(
      {required String email}) async {
    try {
      _firebaseAuthInstance.sendPasswordResetEmail(
        email: email.replaceAll(' ', ''),
      );
      return Either.right(
          'Se le ha evnviado un mensaje a su correo electrónico, por favor revíselo y acepte para cambiar su contraseña');
    } on FirebaseAuthException catch (e) {
      late SessionRequestFailure sessionRequestFailure;
      switch (e.code) {
        case 'user-not-found':
          sessionRequestFailure = SessionRequestFailure.notRegistered();
          break;
        case 'network-request-failed':
          sessionRequestFailure = SessionRequestFailure.network();
          break;
        default:
          sessionRequestFailure = SessionRequestFailure.unknown();
          break;
      }
      return Either.left(sessionRequestFailure);
    }
  }

  User? currentUserFromAuthentication()  {
    final currentUser = _firebaseAuthInstance.currentUser;
    if (currentUser != null) {
      return currentUser;
    }
    return null;
  }
}
