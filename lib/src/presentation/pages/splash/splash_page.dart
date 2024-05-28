import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/repositories/auth/auth_repository.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/router/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AuthRepository get authRepository => context.read();
  SessionController get sessionController => context.read();
  late Timer _timer;
  //int time = 6;
  int time = 4;

  @override
  void initState() {
    super.initState();

    getUserData();

    _timer = Timer(Duration(seconds: time), () {
      goApp();
    });
  }

  void goApp() {
    context.goNamed(Routes.species);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void getUserData() {
    final isAcces = authRepository.isAcces();
    isAcces.when(
      (_) => null,
      (uid) {
        debugPrint('🎆$uid');
        sessionController.setUser(uid);
      },
    );
  }

  static const double min = 8.0;
  static const double num256 = 256.0;
  static const double num64 = 64.0;
  static const double num1600 = 1600.0;
  static const double num800 = 800.0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 8.0,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    texts.general.title,
                    style: textTheme.displayMedium?.copyWith(color: Colors.white),
                  )
                      .animate(delay: num800.ms)
                      .fadeIn(duration: num1600.ms)
                      .moveY(
                        duration: num1600.ms,
                        curve: Curves.easeInOutBack,
                      ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      texts.general.subtitle,
                      style:
                          textTheme.displaySmall?.copyWith(color: Colors.white),
                    )
                        .animate(delay: num1600.ms)
                        .fadeIn(duration: num1600.ms)
                        .moveX(
                          duration: num1600.ms,
                          curve: Curves.decelerate,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 256.0,
            child: CircleAvatar(
              radius: 640.0,
              backgroundColor: Color(0xFFBAD87A),
            ),
          ).animate().fadeIn(duration: num1600.ms).moveY(
                begin: 768.0,
                duration: num1600.ms,
                curve: Curves.ease,
              ),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 128.0,
            )
                .animate(
                  delay: num800.ms,
                )
                .fadeIn(duration: num800.milliseconds)
                .scale(
                  begin: const Offset(0.0, 0.0),
                  duration: num800.ms,
                  curve: Curves.easeInOut,
                ),
          ),
          Padding(
            padding: PaddingConfig.allL,
            child: SafeArea(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                spacing: min,
                runSpacing: min,
                runAlignment: WrapAlignment.center,
                children: [
                  _spandImage(
                    'assets/images/logo_minam.png',
                    width: num256,
                    height: num64,
                  ),
                  _spandImage(
                    'assets/images/logoIIAP.jpg',
                    width: num64,
                    height: num64,
                  ),
                  _spandImage(
                    'assets/images/logo_spain.png',
                    width: num256,
                    height: num64,
                  ),
                ],
              ),
            ),
          ).animate(delay: num800.ms).fadeIn(duration: num1600.ms).moveY(
                begin: num64,
                duration: num1600.ms,
                curve: Curves.easeInOutBack,
              ),
        ],
      ),
    );
  }

  Widget _spandImage(
    String path, {
    required double width,
    required double height,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.asset(
          path,
          width: width,
          height: height,
          fit: BoxFit.fill,
        ),
      );
}
