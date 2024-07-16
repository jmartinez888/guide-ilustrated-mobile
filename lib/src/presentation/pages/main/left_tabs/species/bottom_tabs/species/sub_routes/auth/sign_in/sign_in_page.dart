import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:species/src/data/models/failure/user_acces/user_acces_failure.dart';
import 'package:species/src/domain/repositories/account/account_repository.dart';
import 'package:species/src/domain/repositories/auth/auth_repository.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/colors.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/mixins/form_mixin.dart';
import 'package:species/src/presentation/global/widgets/alerts/custom_bottom_sheet.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/router/routes.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with FormMixin {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  bool validateInInput = false;
  bool enabled = true;
  late Timer animationTimer;

  AuthRepository get authRepository => context.read();
  SessionController get sessionController => context.read();
  AccountRepository get accountRepository => context.read();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      animationTimer = Timer(
        const Duration(milliseconds: 300),
        () {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 100),
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
    return PopScope(
      canPop: enabled,
      child: Scaffold(
        body: _mobileView(context),
      ),
    );
  }

  Widget _mobileView(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;
    final isTablet = size.width < 1200 && size.width >= 768;
    // final isDesktop = size.width >= 1200;

    return Stack(
      children: [
        Center(
          child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              const _PortraitAppbar(),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: PaddingConfig.allL,
                  child: Column(
                    children: [
                      const _HeaderLogo(),
                      const SizedBox(height: 16.0),
                      const _TitleApp(),
                      _SubtitleApp(colorScheme: colorScheme),
                      const SizedBox(height: 32.0),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: isMobile
                              ? size.width
                              : isTablet
                                  ? size.width * 0.6
                                  : size.width * 0.4,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _emailTextFormField(),
                              const SizedBox(height: 16.0),
                              _passwordTextFormField(),
                              const SizedBox(height: 16.0),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: enabled
                                      ? () => context
                                          .pushNamed(Routes.forgotPassword)
                                      : null,
                                  child: Text(texts.signIn.forgot_password),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              _loginButton(context),
                              const SizedBox(height: 16.0),
                              _RegisterButton(enabled: enabled),
                              SizedBox(height: size.height * 0.05),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (enabled)
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, top: 8.0),
              child: CustomBackButton(),
            ),
          ),
      ],
    );
  }

  SizedBox _loginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed:
            enabled ? () => _validateCredentials(context: context) : null,
        icon: enabled
            ? const Icon(Icons.navigate_next)
            : const SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(),
              ),
        label: Text(texts.signIn.enter),
      ),
    );
  }

  TextFormField _passwordTextFormField() {
    return TextFormField(
      focusNode: _passwordFocusNode,
      onTapOutside: (event) => _passwordFocusNode.unfocus(),
      enabled: enabled,
      textInputAction: TextInputAction.done,
      controller: _passwordController,
      autovalidateMode:
          validateInInput ? AutovalidateMode.onUserInteraction : null,
      obscureText: _hidePassword,
      decoration: InputDecoration(
        labelText: texts.signIn.password,
        prefixIcon: const Icon(Icons.password_rounded),
        suffixIcon: Wrap(
          runSpacing: 8.0,
          children: [
            IconButton(
              onPressed: () => setState(() => _hidePassword = !_hidePassword),
              tooltip: texts.signIn.view_password,
              icon: Icon(
                _hidePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
            ),
            if (_passwordController.text.isNotEmpty)
              IconButton(
                onPressed: () => setState(() => _passwordController.clear()),
                tooltip: texts.signIn.clear,
                icon: const Icon(Icons.cancel_outlined),
              ),
          ],
        ),
      ),
      onChanged: (value) => setState(() {}),
      validator: passwordValidator,
      inputFormatters: [withoutSpaces],
      keyboardType: TextInputType.visiblePassword,
    );
  }

  TextFormField _emailTextFormField() {
    return TextFormField(
      focusNode: _emailFocusNode,
      onTapOutside: (event) => _emailFocusNode.unfocus(),
      controller: _emailController,
      enabled: enabled,
      textInputAction: TextInputAction.next,
      autovalidateMode:
          validateInInput ? AutovalidateMode.onUserInteraction : null,
      decoration: InputDecoration(
        labelText: texts.signIn.email,
        prefixIcon: const Icon(Icons.email_outlined),
        suffixIcon: _emailController.text.isNotEmpty
            ? IconButton(
                onPressed: () => setState(() => _emailController.clear()),
                tooltip: texts.signIn.clear,
                icon: const Icon(Icons.cancel_outlined),
              )
            : null,
      ),
      onChanged: (value) => setState(() {}),
      validator: emailValidator,
      inputFormatters: [withoutSpaces],
      keyboardType: TextInputType.emailAddress,
    );
  }

  void _validateCredentials({
    required BuildContext context,
  }) async {
    if (!_hidePassword) {
      _hidePassword = true;
    }
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
        (failure) {
          final message = failure.when(
            network: () => texts.userCredentialFailure.network,
            credential: () => texts.userCredentialFailure.credential,
            disable: () => texts.userCredentialFailure.disable,
            notRegistered: () => texts.userCredentialFailure.notRegistered,
            password: () => texts.userCredentialFailure.password,
            unknown: () => texts.userCredentialFailure.unknown,
          );
          customSnackBar(
            context: context,
            title: message,
            error: true,
            large: true,
          );
        },
        (right) async {
          final isAcces = authRepository.isAcces();

          isAcces.when(
            (userAccesFailure) {
              if (userAccesFailure is UserAccesFailureEmpty) {
                customSnackBar(
                  context: context,
                  title: texts.signIn.register_first,
                  error: true,
                );
                context.pushNamed(Routes.signUp);
              }
              if (userAccesFailure is UserAccesFailureEmailIsNotVerified) {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => CustomBottomSheet(
                    title: texts.signIn.verify_email,
                    body: [
                      Text(texts.signIn.verify_email_more),
                    ],
                    floatingActionButton: FloatingActionButton(
                      onPressed: () => Navigator.maybePop(context),
                      child: const Icon(Icons.check_rounded),
                    ),
                  ),
                );
              }
            },
            (uid) {
              if (mounted) {
                accountRepository.createUser(
                  userId: right.user!.uid,
                  email: email,
                );

                sessionController.setUser(uid);
                context.goNamed(Routes.species);
              }
            },
          );
        },
      );
      enabled = true;
      setState(() {});
    }
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? () => context.pushNamed(Routes.signUp) : null,
      child: Text(texts.signIn.new_),
    );
  }
}

class _SubtitleApp extends StatelessWidget {
  const _SubtitleApp({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      texts.signIn.subtitle,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: colorScheme.primary),
    );
  }
}

class _TitleApp extends StatelessWidget {
  const _TitleApp();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;
    return Text(
      texts.signIn.title,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: isMobile ? size.width * 0.1 : size.width * 0.05,
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class _PortraitAppbar extends StatelessWidget {
  const _PortraitAppbar();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      expandedHeight: size.height * 0.2,
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
    );
  }
}

class _HeaderLogo extends StatelessWidget {
  const _HeaderLogo();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Image.asset(
      height: size.height * 0.3,
      width: size.width * 0.8,
      'assets/images/logo.png',
      fit: BoxFit.contain,
    );
  }
}
