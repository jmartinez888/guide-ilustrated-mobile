import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/global/colors.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/router/routes.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late Timer animationTimer;
  bool _hidePassword = true;

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
    super.dispose();
    _scrollController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    animationTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
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
                          'Species IIAP',
                          style: textTheme.headlineLarge?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 32.0),
                        TextFormField(
                          controller: _emailController,
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
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _passwordController,
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
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 16.0),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.navigate_next),
                            label: const Text('Ingresar'),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextButton(
                          onPressed: () => context.pushNamed(Routes.signUp),
                          child: const Text('Si eres nuevo regístrate aquí'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: CustomIconButton(
                tooltip: 'Atrás',
                icon: Icons.arrow_back_ios_rounded,
                onPressed: () => Navigator.maybePop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
