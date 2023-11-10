import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/router/routes.dart';

class DeleteAccountPage extends StatefulWidget {
  final String userId;

  const DeleteAccountPage({super.key, required this.userId});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  Future<Map<String, dynamic>> getUserData() async {
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

  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  Future<void> _reauthenticateAndDelete() async {
    try {
      final user = firebaseAuth.currentUser;

      // Aquí puedes verificar otros proveedores de autenticación si los tienes
      // if (user?.providerData.any((provider) => provider.providerId == 'otro_proveedor') ?? false) {
      // Lógica para reautenticar con otro proveedor si es necesario
      // }

      // Puedes reautenticar al usuario aquí si es necesario
      // await user?.reauthenticateWithCredential(credential);

      // Elimina la cuenta del usuario después de la reautenticación
      await user?.delete();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Error al borrar la cuenta');
    } catch (e) {
      throw Exception('Error al borrar la cuenta $e');
    }
  }

  Future<void> deleteUserAccount() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Elimina los datos relacionados con el usuario en Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .delete();

        // Borra la cuenta del usuario solo si la reautenticación es exitosa
        await _reauthenticateAndDelete();
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Error al borrar la cuenta');
    } catch (e) {
      throw Exception('Error al borrar la cuenta $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text('Borrar cuenta'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.5,
                child: const Center(child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final userData = snapshot.data;
            final name = userData!['name'] ?? '';
            final lastName = userData['lastName'] ?? '';
            final email = userData['email'] ?? '';
            final phone = userData['phone'] ?? '';

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Información de usuario',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Nombre: $name $lastName'),
                  Text('Email: $email'),
                  Text('Teléfono: $phone'),
                  const SizedBox(height: 16),
                  const Text(
                    'Al borrar tu cuenta, estás de acuerdo con los siguientes términos:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                      '- Todos tus datos serán borrados permanentemente.'),
                  const Text(
                      '- No podrás recuperar tu cuenta ni los datos asociados a ella.'),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirmar'),
                            content: const Text(
                                '¿Estás seguro de que quieres borrar tu cuenta?'),
                            actions: [
                              TextButton(
                                onPressed: () => context.pop(),
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  deleteUserAccount();
                                  context.goNamed(Routes.species);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Cuenta borrada exitosamente'),
                                    ),
                                  );
                                },
                                child: const Text('Borrar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Borrar cuenta'),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
