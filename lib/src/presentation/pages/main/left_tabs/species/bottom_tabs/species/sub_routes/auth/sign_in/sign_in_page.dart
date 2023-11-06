import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/data/repositories_implementation/auth_iiap/auth_iiap_repository_impl.dart';
import 'package:species/src/data/repositories_implementation/user_iiap/user_iiap_repository_impl.dart';
import 'package:species/src/presentation/global/colors.dart';
import 'package:species/src/presentation/global/mixins/form_mixin.dart';
import 'package:species/src/presentation/global/widgets/alerts/custom_bottom_sheet.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/router/routes.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with FormMixin {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  bool validateInInput = false;
  bool enabled = true;
  late Timer animationTimer;

  final authRepository = AuthIiapRepositoryImpl();
  final userRepository = UserIiapRepositoryImpl();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      animationTimer = Timer(
        const Duration(milliseconds: 2500),
        () {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 400),
          );
        },
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    animationTimer.cancel();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 768.0,
              child: CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    expandedHeight: 384.0,
                    toolbarHeight: 0.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: ShaderMask(
                        shaderCallback: (Rect bounds) => const LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            CustomColors.background,
                          ],
                        ).createShader(bounds),
                        blendMode: BlendMode.srcATop,
                        child: Image.asset(
                          'assets/images/background.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                bottom: 16.0,
                              ),
                              child: Image.asset(
                                height: 256.0,
                                width: 256.0,
                                'assets/images/logo.png',
                              ),
                            ),
                            Text(
                              'AMAZONÍA',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize: size.width * 0.1,
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Guía ilustrada de flora y fauna',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                color: colorScheme.primary,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: const Offset(0.0, 1.0),
                                    blurRadius: 2.0,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 32.0),
                            TextFormField(
                              focusNode: _emailFocusNode,
                              onTapOutside: (event) =>
                                  _emailFocusNode.unfocus(),
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
                                        onPressed: () => setState(
                                            () => _emailController.clear()),
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
                            TextFormField(
                              focusNode: _passwordFocusNode,
                              onTapOutside: (event) =>
                                  _passwordFocusNode.unfocus(),
                              enabled: enabled,
                              controller: _passwordController,
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
                                      onPressed: () => setState(
                                          () => _hidePassword = !_hidePassword),
                                      tooltip: 'Mostrar contraseña',
                                      icon: Icon(
                                        _hidePassword
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                      ),
                                    ),
                                    if (_passwordController.text.isNotEmpty)
                                      IconButton(
                                        onPressed: () => setState(
                                            () => _passwordController.clear()),
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
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () =>
                                    context.pushNamed(Routes.forgotPassword),
                                child: const Text('¿Olvidaste tu contraseña?'),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton.icon(
                                onPressed: enabled
                                    ? () =>
                                        _validateCredentials(context: context)
                                    : null,
                                icon: enabled
                                    ? const Icon(Icons.navigate_next)
                                    : const SizedBox(
                                        width: 24.0,
                                        height: 24.0,
                                        child: CircularProgressIndicator(),
                                      ),
                                label: const Text('Ingresar'),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            TextButton(
                              onPressed: enabled
                                  ? () => context.pushNamed(Routes.signUp)
                                  : null,
                              child:
                                  const Text('Si eres nuevo regístrate aquí'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, top: 8.0),
              child: CustomBackButton(),
            ),
          ),
        ],
      ),
    );
  }

  void _validateCredentials({
    required BuildContext context,
  }) async {
    final colorScheme = Theme.of(context).colorScheme;
    if (validateInInput == false) {
      validateInInput = true;
      enabled = true;
      setState(() {});
    }
    if (validateInInput) {
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

      final userCredential = await authRepository.signIn(
        email: email,
        password: password,
      );

      userCredential.when(
        (left) => customSnackBar(
          context: context,
          title: left,
          backgroundColor: colorScheme.error,
          large: true,
        ),
        (right) async {
          final user = right.user;
          final id = user?.uid;
          if (id != null) {
            final emailVerification =
                await authRepository.sendVerificationEmail();
            emailVerification.when(
              (left) => customSnackBar(
                context: context,
                title: left,
                backgroundColor: colorScheme.error,
                large: true,
              ),
              (right) {
                if (right == 'El usuario ya está verificado') {
                  userRepository.createUser(
                    userId: id,
                    email: email,
                  );
                  context.goNamed(Routes.species);
                } else {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => CustomBottomSheet(
                      title: 'Primero verifica tu correo electrónico',
                      body: const [
                        Text(
                            'Debes verificar tu correo electrónico para poder ingresar'),
                      ],
                      floatingActionButton: FloatingActionButton(
                        onPressed: () => Navigator.maybePop(context),
                        child: const Icon(Icons.check_rounded),
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      );
      enabled = true;
      setState(() {});
    }
  }
}
