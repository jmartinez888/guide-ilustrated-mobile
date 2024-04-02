import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/repositories/auth/auth_repository.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';
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
  int time = 5;

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
        print('🎆$uid');
        sessionController.setUser(uid);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: const Color(0xFFBAD87A),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(32.0),
              color: const Color(0xFF8EB63E),
              width: double.infinity,
              height: double.infinity,
            ),
            GridTwoResponsive(
              leftChild: first(
                  context: context,
                  colorScheme: colorScheme,
                  textTheme: textTheme),
              rightChildren: [second()],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 32.0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 16.0,
          runSpacing: 16.0,
          runAlignment: WrapAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_minam.png',
              width: 256.0,
              height: 64.0,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'assets/images/logoIIAP.jpg',
              width: 64.0,
              height: 64.0,
            ),
            Image.asset(
              'assets/images/logo_spain.png',
              fit: BoxFit.fill,
              width: 256.0,
              height: 64.0,
            ),
          ],
        ),
      ).animate().fade(
            curve: Curves.easeInOutCubic,
            duration: time.seconds,
          ),
    );
  }

  Widget first({
    required BuildContext context,
    required TextTheme textTheme,
    required ColorScheme colorScheme,
  }) =>
      Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 32.0, right: 32.0, top: 32.0),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xFF0086B7),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'AMAZONÍA',
                        style: textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimary,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.625),
                              offset: const Offset(5.0, 5.0),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Guía ilustrada de flora y fauna',
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimary,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.625),
                              offset: const Offset(5.0, 5.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 110.0,
                  child: SvgPicture.asset(
                    'assets/splash/curve.svg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 8.0,
            top: 8.0,
            child: Transform.rotate(
              angle: -0.128,
              child: SvgPicture.asset(
                'assets/splash/icono_hormiga_blanco.svg',
                width: 64.0,
                height: 64.0,
                color: Colors.white.withOpacity(0.5),
              )
                  .animate()
                  .shakeX(
                    duration: time.seconds,
                    hz: 1,
                    amount: 4.0,
                  )
                  .fadeIn(),
            ),
          ),
          Positioned(
            bottom: 64.0,
            child: Transform.rotate(
              angle: -0.128,
              child: SvgPicture.asset(
                'assets/splash/icono_anfibio_blanco.svg',
                width: 56.0,
                height: 56.0,
                color: Colors.white.withOpacity(0.5),
              )
                  .animate()
                  .shakeY(
                    duration: time.seconds,
                    hz: 1.5,
                    amount: 8.0,
                  )
                  .fadeIn(),
            ),
          ),
        ],
      );

  Widget second() => Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 72.0, vertical: 16.0),
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 16.0,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 16.0,
                children: [
                  Transform.rotate(
                    angle: -0.128,
                    child: SvgPicture.asset(
                      'assets/splash/icono_aves_blanco.svg',
                      width: 156.0,
                      height: 156.0,
                      color: Colors.white.withOpacity(0.5),
                    ).animate().fadeIn(duration: time.seconds),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Transform.rotate(
                      angle: -0.256,
                      child: SvgPicture.asset(
                        'assets/splash/icono_mamifero_blanco.svg',
                        width: 92.0,
                        height: 92.0,
                        color: Colors.white.withOpacity(0.5),
                      ).animate(delay: 200.ms).fadeIn(duration: time.seconds),
                    ),
                  ),
                  Transform.rotate(
                    angle: -0.128,
                    child: SvgPicture.asset(
                      'assets/splash/icono_reptil_blanco.svg',
                      width: 128.0,
                      height: 128.0,
                      color: Colors.white.withOpacity(0.5),
                    )
                        .animate(
                          delay: 400.ms,
                        )
                        .fadeIn(duration: time.seconds),
                  ),
                  Transform.rotate(
                    angle: -0.128,
                    child: SvgPicture.asset(
                      'assets/splash/icono_peces_blanco.svg',
                      width: 140.0,
                      height: 140.0,
                      color: Colors.white.withOpacity(0.5),
                    )
                        .animate(delay: 600.ms)
                        .shakeX(
                          duration: time.seconds,
                          hz: 1,
                          amount: 4.0,
                        )
                        .fadeIn(
                          duration: time.seconds,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: -8.0,
            child: SvgPicture.asset(
              'assets/splash/icono_arbol_blanco.svg',
              width: 160.0,
              height: 160.0,
              color: Colors.white.withOpacity(0.5),
            ).animate().fadeIn(duration: time.seconds),
          ),
          Positioned(
            right: -16.0,
            child: Transform.rotate(
              angle: -0.128,
              child: SvgPicture.asset(
                'assets/splash/icono_palmera_blanco.svg',
                width: 160.0,
                height: 160.0,
                color: Colors.white.withOpacity(0.5),
              ).animate().fadeIn(duration: time.seconds),
            ),
          ),
        ],
      );
}
