import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/repositories/auth/auth_repository.dart';
import 'package:species/src/presentation/global/mixins/form_mixin.dart';
import 'package:species/src/presentation/global/widgets/alerts/custom_bottom_sheet.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/router/routes.dart';
import 'package:species/src/generated/translations.g.dart';

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

  AuthRepository get authRepository => context.read();

  final FocusNode _emailFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(texts.forgotPassword.title),
      ),
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
                      label: enabled
                          ? Text(texts.forgotPassword.sendLabel)
                          : Text(texts.forgotPassword.validatingLabel),
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  focusNode: _emailFocusNode,
                  autofillHints: const [AutofillHints.email],
                  controller: _emailController,
                  enabled: enabled,
                  autovalidateMode: validateInInput
                      ? AutovalidateMode.onUserInteraction
                      : null,
                  decoration: InputDecoration(
                    labelText: texts.forgotPassword.email,
                    prefixIcon: const Icon(Icons.email_outlined),
                    suffixIcon: _emailController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () =>
                                setState(() => _emailController.clear()),
                            tooltip: texts.forgotPassword.clear,
                            icon: const Icon(Icons.cancel_outlined),
                          )
                        : null,
                  ),
                  onChanged: (value) => setState(() {}),
                  validator: emailValidator,
                  keyboardType: TextInputType.emailAddress,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                const SizedBox(height: 16.0),
                Text(texts.forgotPassword.message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium),
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
        (failure) {
          final message = failure.when(
            network: () => texts.signUp.network,
            credential: () => texts.signUp.credential,
            disable: () => texts.signUp.disabled,
            notRegistered: () => texts.signUp.notRegistered,
            password: () => texts.signUp.passwordNotMatch,
            unknown: () => texts.signUp.unknown,
          );
          customSnackBar(
            context: screenContext,
            title: message,
            error: true,
          );
        },
        (right) => showBottomSheet(
          context: screenContext,
          builder: (screenContext) => CustomBottomSheet(
            title: texts.forgotPassword.checkYourEmail,
            body: [
              Text(right),
            ],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _emailController.clear();
                final currentRoute = GoRouter.of(context).location;

                if (currentRoute == '/profile/${Routes.forgotPassword}') {
                  Navigator.of(context).pop();
                  context.pop();
                } else {
                  Navigator.of(context).pop();
                  context.pushNamed(Routes.signIn);
                }
              },
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
