import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/global/mixins/form_mixin.dart';
import 'package:species/src/presentation/router/routes.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> with FormMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController(),
      _lastnameController = TextEditingController(),
      _phoneController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _lastnameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();

  bool _hidePassword = true;
  bool validateInInput = false;
  bool enabled = true;

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    _phoneController.dispose();
    _nameFocusNode.dispose();
    _lastnameFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  onPressed: () => context.goNamed(Routes.profile),
                  child: const Text('Cancelar')),
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
              focusNode: _phoneFocusNode,
              onTapOutside: (event) => _phoneFocusNode.unfocus(),
              controller: _phoneController,
              enabled: enabled,
              autovalidateMode:
                  validateInInput ? AutovalidateMode.onUserInteraction : null,
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
                    if (_phoneController.text.isNotEmpty)
                      IconButton(
                        onPressed: () =>
                            setState(() => _phoneController.clear()),
                        tooltip: 'Limpiar',
                        icon: const Icon(Icons.cancel_outlined),
                      ),
                  ],
                ),
              ),
              onChanged: (value) => setState(() {}),
              validator: (value) => repeatPasswordValidator(
                  _phoneController.text, _lastnameController.text),
              inputFormatters: [withoutSpaces],
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              focusNode: _lastnameFocusNode,
              onTapOutside: (event) => _lastnameFocusNode.unfocus(),
              controller: _lastnameController,
              enabled: enabled,
              autovalidateMode:
                  validateInInput ? AutovalidateMode.onUserInteraction : null,
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
                    if (_lastnameController.text.isNotEmpty)
                      IconButton(
                        onPressed: () =>
                            setState(() => _lastnameController.clear()),
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
              focusNode: _nameFocusNode,
              onTapOutside: (event) => _nameFocusNode.unfocus(),
              controller: _nameController,
              enabled: enabled,
              autovalidateMode:
                  validateInInput ? AutovalidateMode.onUserInteraction : null,
              decoration: InputDecoration(
                labelText: 'Correo',
                prefixIcon: const Icon(Icons.email_outlined),
                suffixIcon: _nameController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () =>
                            setState(() => _nameController.clear()),
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
    );
  }
}

void _validateCredentials() {}
