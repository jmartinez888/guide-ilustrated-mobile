import 'package:flutter/material.dart';
import 'package:species/src/data/repositories_implementation/auth_iiap/auth_iiap_repository_impl.dart';
import 'package:species/src/presentation/global/mixins/form_mixin.dart';
import 'package:species/src/presentation/global/widgets/alerts/custom_bottom_sheet.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with FormMixin {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool enabled = true;
  bool validateInInput = false;

  final authRepository = AuthIiapRepositoryImpl();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Olvidó su contraseña')),
      body: Center(
        child: Extend(
          min: true,
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              physics: const BouncingScrollPhysics(),
              reverse: true,
              children: [
                Builder(
                  builder: (context) {
                    return FilledButton.icon(
                      onPressed: enabled
                          ? () => _validateCredentials(
                                _emailController.text,
                                context,
                              )
                          : null,
                      icon: enabled
                          ? const Icon(Icons.send_outlined)
                          : const SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child: CircularProgressIndicator(),
                            ),
                      label: const Text('Enviar'),
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  enabled: enabled,
                  autovalidateMode: validateInInput
                      ? AutovalidateMode.onUserInteraction
                      : null,
                  decoration: InputDecoration(
                    labelText: 'Correo',
                    prefixIcon: const Icon(Icons.email_outlined),
                    suffixIcon: _emailController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () =>
                                setState(() => _emailController.clear()),
                            tooltip: 'Limpiar',
                            icon: const Icon(Icons.cancel_outlined),
                          )
                        : null,
                  ),
                  onChanged: (value) => setState(() {}),
                  validator: emailValidator,
                  inputFormatters: [withoutSpaces],
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Ingrese su email para enviarle un correo donde podrá cambiar su contraseña',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateCredentials(
    String email,
    BuildContext screenContext,
  ) async {
    enabled = false;
    setState(() {});
    if (validateInInput == false) {
      validateInInput = true;
      enabled = true;
      setState(() {});
    } else if (validateInInput) {
      validateInInput = false;
      enabled = true;
      setState(() {});
    }

    if (_formKey.currentState!.validate()) {
      validateInInput = false;
      enabled = false;
      setState(() {});

      final result = await authRepository.resetPassword(email: email);

      result.when(
        (left) => customSnackBar(context: screenContext, title: left),
        (right) => showBottomSheet(
          context: screenContext,
          builder: (screenContext) => CustomBottomSheet(
            title: 'Revisa tu correo!',
            body: [
              Text(right),
            ],
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.maybePop(screenContext),
              child: const Icon(Icons.check_rounded),
            ),
          ),
        ),
      );

      enabled = true;
      setState(() {});
    }
  }
}
