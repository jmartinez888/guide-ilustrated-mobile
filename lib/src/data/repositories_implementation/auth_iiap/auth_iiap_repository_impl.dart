import 'package:firebase_auth/firebase_auth.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/repositories/auth/auth_repository.dart';

class AuthIiapRepositoryImpl extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<String, UserCredential>> signUp(
      {required String email, required String password}) async {
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
      } else if (e.code == 'unusual activity') {
        return Either.left(
            'Hemos bloquedo todas las solicitudes de este dispositivo debido a una actividad inusual, el acceso a esta cuenta ha sido deshabilitado temporalmente debido a demasiados intentos fallidos de iniciar sesión. Por favor, intenta más tarde');
      } else if (e.code == 'network-request-failed') {
        return Either.left(
            'No se pudo conectar con el servidor, por favor, verifica tu conexión a internet e inténtalo de nuevo');
      }
       else {
        return Either.left('Este usuario ya existe, consulta tu correo o toca en el botón "Ingresa aquí"');
      }
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
      return Either.left('El usuario ya está verificado');
    } catch (e) {
      return Either.left('Algo salió mal');
    }
  }
}
