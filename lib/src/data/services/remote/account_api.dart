import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:species/src/domain/entities/user/user.dart';

class AccountApi {
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;
  final firebaseStorageInstance = FirebaseStorage.instance;
  final firebaseFirestoreInstance =
      FirebaseFirestore.instance.collection('users');

  Future createUser({
    required String userId,
    required String email,
  }) async {
    final docUser = firebaseFirestoreInstance.doc(userId);
    final existingDoc = await docUser.get();

    DateTime now = DateTime.now();
    final created = existingDoc.exists
        ? existingDoc.data()!['created']
        : Timestamp.fromDate(now);
    final user = UserC(
      id: userId,
      email: email,
      created: created,
    );

    final json = user.toJson();

    await docUser.set(json);
  }

  Future<Map<String, dynamic>> getUserData(String userId) async {
    final docSnapshot = await firebaseFirestoreInstance.doc(userId).get();

    if (docSnapshot.exists) {
      return docSnapshot.data() as Map<String, dynamic>;
    } else {
      return {};
    }
  }

  Future<String> uploadProfilePicture(
    String folderName,
    String fileName,
    Uint8List file,
  ) async {
    Reference ref =
        firebaseStorageInstance.ref().child(folderName).child(fileName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveProfile({
    required String userId,
    required String name,
    required String lastName,
    required String phone,
    required String email,
    required Uint8List profilePicture,
  }) async {
    String response = 'Something went wrong';

    try {
      if (name.isNotEmpty || lastName.isNotEmpty) {
        String imageUrl = await uploadProfilePicture(
          'images/users/$userId/profile',
          userId,
          profilePicture,
        );
        final docUser = firebaseFirestoreInstance.doc(userId);
        final existingDoc = await docUser.get();

        DateTime now = DateTime.now();
        final created = existingDoc.exists
            ? existingDoc.data()!['created']
            : Timestamp.fromDate(now);

        final user = UserC(
          id: userId,
          name: name,
          lastName: lastName,
          profilePicture: imageUrl,
          phone: phone,
          created: created,
          email: existingDoc.data()!['email'],
        );

        final json = user.toJson();

        await docUser.update(json);

        response = 'Profile updated successfully';
      }
    } catch (e) {
      response = e.toString();
    }
    return response;
  }

  Future<String> saveProfileWithoutImage(
      {required String userId,
      required String name,
      required String lastName,
      required String phone,
      required String email}) async {
    String response = 'Something went wrong';

    try {
      if (name.isNotEmpty || lastName.isNotEmpty) {
        final docUser = firebaseFirestoreInstance.doc(userId);
        final existingDoc = await docUser.get();

        DateTime now = DateTime.now();
        final created = existingDoc.exists
            ? existingDoc.data()!['created']
            : Timestamp.fromDate(now);

        final user = UserC(
          id: userId,
          name: name,
          lastName: lastName,
          phone: phone,
          created: created,
          email: existingDoc.data()!['email'],
        );

        final json = user.toJson();

        await docUser.update(json);

        response = 'Profile updated successfully';
      }
    } catch (e) {
      response = e.toString();
    }
    return response;
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

  Future<void> _deleteFavoritesSubfolder(String userId) async {
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

  Future<void> _deleteUserFiles() async {
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
        await _deleteFavoritesSubfolder(user.uid);

        // Eliminar los archivos del usuario en Firebase Storage
        await _deleteUserFiles();

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

  bool acces() {
    if (_firebaseAuth.currentUser != null &&
        _firebaseAuth.currentUser!.emailVerified) {
      return true;
    } else {
      return false;
    }
  }
}
