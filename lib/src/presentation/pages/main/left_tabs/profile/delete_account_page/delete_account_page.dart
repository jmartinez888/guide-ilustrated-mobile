import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/repositories/account/account_repository.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/router/routes.dart';
import 'package:species/src/generated/translations.g.dart';

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

  AccountRepository get accountRepository => context.read();

  late Future<Map<String, dynamic>> _getUserInfo;

  @override
  void initState() {
    _getUserInfo = accountRepository.getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(texts.deleteAccount.title),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getUserInfo,
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
          Text(texts.deleteAccount.userInfo, style: title),
          const SizedBox(height: 16.0),
          if (name.isEmpty || lastName.isEmpty)
            Text(
                '${texts.validator.name.label}: ${texts.deleteAccount.notRegistered}')
          else
            Text('${texts.validator.name.label}: $name $lastName'),
          Text('${texts.deleteAccount.email}: $email'),
          if (phone.isEmpty)
            Text(
                '${texts.deleteAccount.phone}:  ${texts.deleteAccount.notRegistered}')
          else
            Text('${texts.deleteAccount.phone}: $phone'),
          const SizedBox(height: 16.0),
          Text(
            texts.deleteAccount.warning,
            style: title,
          ),
          const SizedBox(height: 16.0),
          Text(
            texts.deleteAccount.firtsTerm,
            style: conditions,
          ),
          Text(
            texts.deleteAccount.secondTerm,
            style: conditions,
          ),
          const SizedBox(height: 16.0),
          OutlinedButton(
            onPressed: () {
              final currentContext = context;
              _handleConfirmation(currentContext);
            },
            child: Text(texts.deleteAccount.title),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _handleConfirmation(BuildContext currentContext) {
    return showDialog(
      context: currentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(texts.deleteAccount.confirm),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      texts.deleteAccount.information,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      enabled: enabled,
                      focusNode: _passwordFocusNode,
                      onTapOutside: (event) => _passwordFocusNode.unfocus(),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: texts.validator.password.label,
                        hintText: texts.validator.password.empty,
                      ),
                    ),
                    if (!enabled)
                      const SizedBox(
                        height: 16.0,
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              );
            },
          ),
          actions: [
            FilledButton(
              onPressed: () => context.pop(),
              child: Text(texts.deleteAccount.cancel),
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
                      title: texts.validator.password.empty,
                      error: true,
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
                      await accountRepository.deleteUserAccount(password);

                      // Navegar a la pantalla deseada
                      if (mounted) {
                        context.goNamed(Routes.species);
                      }

                      // Mostrar mensaje de éxito
                      if (mounted) {
                        customSnackBar(
                          context: currentContext,
                          title: texts.deleteAccount.accountDeleted,
                        );
                      }
                    } catch (e) {
                      _passwordController.clear();
                      // Mostrar mensaje de error en caso de fallo
                      if (mounted) {
                        customSnackBar(
                          context: currentContext,
                          title: e.toString(),
                          error: true,
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
              child: Text(texts.deleteAccount.title),
            ),
          ],
        );
      },
    );
  }
}
