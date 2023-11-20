import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/data/repositories_implementation/auth_iiap/auth_iiap_repository_impl.dart';
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

  final _getUserInfo = AuthIiapRepositoryImpl().getUserInfo;
  final _deleteUserAccount = AuthIiapRepositoryImpl().deleteUserAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text('Eliminar cuenta'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getUserInfo(),
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
          if (name.isEmpty || lastName.isEmpty)
            const Text('Nombre: No registrado')
          else
            Text('Nombre: $name $lastName'),
          Text('Email: $email'),
          if (phone.isEmpty)
            const Text('Teléfono:  No registrado')
          else
            Text('Teléfono: $phone'),
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
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '¿Estás seguro de que quieres borrar tu cuenta? Ingrese su contraseña para confirmar:',
                    ),
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
                    if (!enabled)
                      const SizedBox(
                          height: 16.0, child: CircularProgressIndicator()),
                  ],
                ),
              );
            },
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
                    setState(() {
                      enabled = true;
                    });
                    return;
                  } else {
                    try {
                      // Mostrar indicador de carga antes de la operación de eliminación
                      setState(() {
                        enabled = false;
                      });

                      // Realizar la operación de eliminación
                      await _deleteUserAccount(password);

                      // Navegar a la pantalla deseada
                      if (mounted) {
                        context.goNamed(Routes.species);
                      }

                      // Mostrar mensaje de éxito
                      if (mounted) {
                        customSnackBar(
                          context: currentContext,
                          title: 'Cuenta eliminada exitosamente',
                        );
                      }
                    } catch (e) {
                      _passwordController.clear();
                      // Mostrar mensaje de error en caso de fallo
                      if (mounted) {
                        customSnackBar(
                          context: currentContext,
                          title: e.toString(),
                          backgroundColor: colorScheme.error,
                        );
                      }
                    } finally {
                      _passwordController.clear();
                      // Ocultar indicador de carga después de la operación
                      setState(() {
                        enabled = true;
                      });
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
