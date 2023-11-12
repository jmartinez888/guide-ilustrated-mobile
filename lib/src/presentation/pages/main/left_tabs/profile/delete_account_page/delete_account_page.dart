import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:species/src/data/repositories_implementation/auth_iiap/auth_iiap_repository_impl.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/router/routes.dart';

class DeleteAccountPage extends StatefulWidget {
  final String userId;

  const DeleteAccountPage({super.key, required this.userId});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  bool enabled = true;

  // final _getUserInfo = AuthIiapRepositoryImpl().getUserInfo;
  // final _deleteUserAccount = AuthIiapRepositoryImpl().deleteUserAccount;

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
        title: const Text('Eliminar cuenta'),
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

            return _userInfo(name, lastName, email, phone, context);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Padding _userInfo(name, lastName, email, phone, BuildContext context) {
    final title = Theme.of(context).textTheme.titleMedium;
    final conditions = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.bold,
        );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Información de usuario:', style: title),
          const SizedBox(height: 16.0),
          Text('Nombre: $name $lastName'),
          Text('Email: $email'),
          Text('Teléfono: +$phone'),
          const SizedBox(height: 16.0),
          Text(
            'Al borrar tu cuenta, estás de acuerdo con los siguientes términos:',
            style: title,
          ),
          const SizedBox(height: 16.0),
          Text(
            '- Todos tus datos serán borrados permanentemente.',
            style: conditions,
          ),
          Text(
            '- No podrás recuperar tu cuenta ni los datos asociados a ella.',
            style: conditions,
          ),
          const SizedBox(height: 16.0),
          OutlinedButton(
            onPressed: () {
              final currentContext = context;
              _handleConfirmation(currentContext);
            },
            child: const Text('Eliminar cuenta'),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _handleConfirmation(BuildContext currentContext) {
    final colorScheme = Theme.of(context).colorScheme;
    return showDialog(
      context: currentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar'),
          content: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                    '¿Estás seguro de que quieres borrar tu cuenta? Ingrese su contraseña para confirmar:'),
                const SizedBox(height: 8),
                TextFormField(
                  enabled: enabled,
                  focusNode: _passwordFocusNode,
                  onTapOutside: (event) => _passwordFocusNode.unfocus(),
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    hintText: 'Ingrese su contraseña',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            FilledButton(
              onPressed: () => context.pop(),
              child: const Text('Cancelar'),
            ),
            OutlinedButton(
              onPressed: () async {
                final currentContext = context;

                if (_formKey.currentState!.validate()) {
                  setState(() {
                    enabled = false;
                  });

                  final password = _passwordController.text;

                  if (password.isEmpty) {
                    customSnackBar(
                      context: currentContext,
                      title: 'Ingrese su contraseña',
                      backgroundColor: colorScheme.error,
                    );
                    return;
                  } else {
                    try {
                      await deleteUserAccount();
                      context.goNamed(Routes.species);
                      customSnackBar(
                        context: currentContext,
                        title: 'Cuenta eliminada exitosamente',
                      );
                    } catch (e) {
                      customSnackBar(
                        context: currentContext,
                        title: e.toString(),
                        backgroundColor: colorScheme.error,
                      );
                    }
                  }
                }
              },
              child: const Text('Eliminar cuenta'),
            ),
          ],
        );
      },
    );
  }
}
