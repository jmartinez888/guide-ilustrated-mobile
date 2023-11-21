import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/data/repositories_implementation/auth_iiap/auth_iiap_repository_impl.dart';
import 'package:species/src/domain/repositories/auth/auth_repository.dart';
import 'package:species/src/presentation/global/mixins/form_mixin.dart';
import 'package:species/src/presentation/global/widgets/alerts/custom_bottom_sheet.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/router/routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with FormMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _repeatPasswordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _repeatPasswordFocusNode = FocusNode();

  final AuthRepository authRepository = AuthIiapRepositoryImpl();

  bool _hidePassword = true;
  bool validateInInput = false;
  bool enabled = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _repeatPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text('Regístrate'),
      ),
      body: Center(
        child: SizedBox(
          width: 768.0,
          child: Form(
            key: _formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              padding: const EdgeInsets.all(16.0),
              children: [
                Center(
                  child: TextButton(
                      onPressed: () => context.goNamed(Routes.signIn),
                      child: const Text('¿Ya tienes una cuenta? Ingresa aquí')),
                ),
                const SizedBox(height: 16.0),
                FilledButton.icon(
                  onPressed: enabled
                      ? () {
                          enabled = false;
                          setState(() {});
                          _validateCredentials();
                        }
                      : null,
                  icon: enabled
                      ? const Icon(Icons.navigate_next_rounded)
                      : const SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(),
                        ),
                  label: const Text('Registrarse'),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  focusNode: _repeatPasswordFocusNode,
                  onTapOutside: (event) => _repeatPasswordFocusNode.unfocus(),
                  controller: _repeatPasswordController,
                  enabled: enabled,
                  autovalidateMode: validateInInput
                      ? AutovalidateMode.onUserInteraction
                      : null,
                  obscureText: _hidePassword,
                  decoration: InputDecoration(
                    labelText: 'Repite tu contraseña',
                    prefixIcon: const Icon(Icons.password_rounded),
                    suffixIcon: Wrap(
                      runSpacing: 8.0,
                      children: [
                        IconButton(
                          onPressed: () =>
                              setState(() => _hidePassword = !_hidePassword),
                          tooltip: 'Mostrar contraseña',
                          icon: Icon(
                            _hidePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                        if (_repeatPasswordController.text.isNotEmpty)
                          IconButton(
                            onPressed: () => setState(
                                () => _repeatPasswordController.clear()),
                            tooltip: 'Limpiar',
                            icon: const Icon(Icons.cancel_outlined),
                          ),
                      ],
                    ),
                  ),
                  onChanged: (value) => setState(() {}),
                  validator: (value) => repeatPasswordValidator(
                      _repeatPasswordController.text, _passwordController.text),
                  inputFormatters: [withoutSpaces],
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  focusNode: _passwordFocusNode,
                  onTapOutside: (event) => _passwordFocusNode.unfocus(),
                  controller: _passwordController,
                  enabled: enabled,
                  autovalidateMode: validateInInput
                      ? AutovalidateMode.onUserInteraction
                      : null,
                  obscureText: _hidePassword,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: const Icon(Icons.password_rounded),
                    suffixIcon: Wrap(
                      runSpacing: 8.0,
                      children: [
                        IconButton(
                          onPressed: () =>
                              setState(() => _hidePassword = !_hidePassword),
                          tooltip: 'Mostrar contraseña',
                          icon: Icon(
                            _hidePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                        if (_passwordController.text.isNotEmpty)
                          IconButton(
                            onPressed: () =>
                                setState(() => _passwordController.clear()),
                            tooltip: 'Limpiar',
                            icon: const Icon(Icons.cancel_outlined),
                          ),
                      ],
                    ),
                  ),
                  onChanged: (value) => setState(() {}),
                  validator: passwordValidator,
                  inputFormatters: [withoutSpaces],
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  focusNode: _emailFocusNode,
                  onTapOutside: (event) => _emailFocusNode.unfocus(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateCredentials() async {
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

      final email = _emailController.text;
      final password = _passwordController.text;

      final userCredential = await authRepository.signUp(
        email: email,
        password: password,
      );

      userCredential.when(
        (left) => customSnackBar(context: context, title: left, large: true),
        (right) async {
          final emailVerification =
              await authRepository.sendVerificationEmail();

          emailVerification.when(
            (left) => customSnackBar(context: context, title: left),
            (right) => showModalBottomSheet(
              context: context,
              builder: (context) => CustomBottomSheet(
                title: 'Te enviamos un correo!',
                body: [Text(right)],
                floatingActionButton: FloatingActionButton(
                  onPressed: () => context.goNamed(Routes.signIn),
                  child: const Icon(Icons.check_rounded),
                ),
              ),
            ),
          );
        },
      );
    }
    enabled = true;
    setState(() {});
  }
}
