import 'package:firebase_auth/firebase_auth.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/repositories/auth/auth_repository.dart';

class AuthIiapRepositoryImpl extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<String, UserCredential>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final value = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.replaceAll(' ', ''),
        password: password.replaceAll(' ', ''),
      );

      return Either.right(value);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Either.left(
            'El correo del usuario no está registrado, regístrese por favor');
      } else if (e.code == 'wrong-password') {
        return Either.left('Contraseña incorrecta');
      } else if (e.code == 'unusual-activity') {
        return Either.left(
            'Hemos bloqueado todas las solicitudes de este dispositivo debido a una actividad inusual. El acceso a esta cuenta ha sido deshabilitado temporalmente debido a demasiados intentos fallidos de iniciar sesión. Por favor, inténtelo más tarde.');
      } else if (e.code == 'network-request-failed') {
        return Either.left(
            'No se pudo conectar con el servidor, por favor, verifique su conexión a internet e inténtelo de nuevo');
      } else {
        return Either.left('Ocurrió un error inesperado: ${e.code}');
      }
    } catch (e) {
      return Either.left('Error inesperado: $e');
    }
  }

  @override
  Future<Either<String, String>> sendVerificationEmail() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        return Either.right(
            'Se ha enviado a su correo un mensaje de verficiación, toque el mensaje para validar su correo');
      }
      return Either.right('El usuario ya está verificado');
    } catch (e) {
      return Either.left('Algo salió mal');
    }
  }

  @override
  Future<Either<String, UserCredential>> signIn({
    required String email,
    required password,
  }) async {
    try {
      final value = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.replaceAll(' ', ''),
        password: password.replaceAll(' ', ''),
      );
      return Either.right(value);
    } on FirebaseAuthException catch (e) {
      late String text;
      switch (e.code) {
        case 'INVALID_LOGIN_CREDENTIALS':
          text = 'Error al ingresar';
          break;
        case 'user-not-found':
          text = 'Este correo no está registrado';
          break;
        case 'wrong-password':
          text = 'Contraseña incorrecta';
          break;
        case 'unusual activity':
          text =
              'El acceso a esta cuenta ha sido deshabilitado temporalmente debido a demasiados intentos fallidos de iniciar sesión. Por favor, intenta más tarde';

          break;
        case 'network-request-failed':
          text =
              'No se pudo conectar con el servidor. Por favor, verifica tu conexión a internet e inténtalo de nuevo';
          break;
        default:
          text = 'Error inesperado';
          break;
      }
      return Either.left(text);
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<Either<String, String>> resetPassword({required String email}) async {
    try {
      _firebaseAuth.sendPasswordResetEmail(
        email: email.replaceAll(' ', ''),
      );
      return Either.right(
          'Se le ha evnviado un mensaje a su correo electrónico, por favor revíselo y acepte para cambiar su contraseña');
    } on FirebaseAuthException catch (e) {
      late String text;
      switch (e.code) {
        case 'user-not-found':
          text = 'Este correo no está registrado';
          break;
        case 'network-request-failed':
          text =
              'No se pudo conectar con el servidor. Por favor, verifica tu conexión a internet e inténtalo de nuevo';
          break;

        default:
          text = 'Error inesperado';
          break;
      }
      return Either.left(text);
    }
  }
}
