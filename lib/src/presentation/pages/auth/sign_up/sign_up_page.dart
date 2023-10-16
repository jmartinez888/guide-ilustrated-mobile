import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/router/routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _repeatPasswordController = TextEditingController();

  bool _hidePassword = true;
  bool validateInInput = false;
  bool enabled = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  onPressed: () {},
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
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
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
                  keyboardType: TextInputType.visiblePassword,
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
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
