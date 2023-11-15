import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/repositories/auth/auth_repository.dart';

class AuthIiapRepositoryImpl extends AuthRepository {
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

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

  Future<Map<String, dynamic>> getUserInfo() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      }
    }
    return {};
  }

  Future<void> deleteUserFiles() async {
    try {
      final user = _firebaseAuth.currentUser;

      if (user != null) {
        // Obtener una referencia al bucket de Firebase Storage
        final storage = FirebaseStorage.instance;
        final storageRef = storage.ref();

        // Especificar la ruta dentro de Storage donde se almacenan los archivos del usuario images/users/$userId/profile
        final userFilesRef =
            storageRef.child('images/users/${user.uid}/profile/${user.uid}');

        // Eliminar la carpeta del usuario
        await userFilesRef.delete();
      } else {
        throw Exception('El usuario no está autenticado.');
      }
    } catch (e) {
      throw Exception('Error al borrar archivos del usuario: $e');
    }
  }

  Future<void> deleteFavoritesSubfolder(String userId) async {
    try {
      // Eliminar la subcarpeta 'favorites' asociada al usuario
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .get();

      List<DocumentSnapshot> documents = snapshot.docs;

      // Eliminar documentos por lotes
      WriteBatch batch = FirebaseFirestore.instance.batch();
      for (var doc in documents) {
        batch.delete(doc.reference);
      }

      await batch.commit();
    } catch (e) {
      throw Exception('Error al borrar la subcarpeta de favoritos: $e');
    }
  }

  Future<void> deleteUserAccount(String password) async {
    try {
      final user = _firebaseAuth.currentUser;

      if (user != null) {
        // Reautenticar al usuario con la contraseña ingresada
        final credential = EmailAuthProvider.credential(
          email: user.email ?? '',
          password: password,
        );

        await user.reauthenticateWithCredential(credential);

        // Eliminar la subcarpeta 'favorites' asociada al usuario
        await deleteFavoritesSubfolder(user.uid);

        // Eliminar los archivos del usuario en Firebase Storage
        await deleteUserFiles();

        // Eliminar los datos relacionados con el usuario en Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .delete();

        // Borra la cuenta del usuario solo si la reautenticación es exitosa
        await user.delete();

        // Cerrar sesión antes de eliminar la cuenta
        await _firebaseAuth.signOut();
      } else {
        throw Exception('El usuario no está autenticado.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw Exception(
            'Credenciales inválidas. Asegúrate de ingresar la contraseña correcta.');
      } else {
        throw Exception('Error al borrar la cuenta: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error al borrar la cuenta: $e');
    }
  }
}
