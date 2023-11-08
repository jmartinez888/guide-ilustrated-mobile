import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/global/icons/custom_icons.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';
import 'package:species/src/presentation/router/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer _timer;
  int time = 5;

  @override
  void initState() {
    super.initState();
    
    _timer = Timer(Duration(seconds: time), () {
      ejecutarMetodo();
    });
  }

  void ejecutarMetodo() {
    context.goNamed(Routes.species);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFBAD87A),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: const Color(0xFF8EB63E),
              margin: const EdgeInsets.all(32.0),
              child: GridTwoResponsive(
                leftChild: Stack(
                  children: [
                    Column(
                      children: [
                        Material(
                          color: const Color(0xFF0086B7),
                          child: ListTile(
                            contentPadding: const EdgeInsets.fromLTRB(
                                16.0, 16.0, 16.0, 0.0),
                            titleTextStyle: textTheme.headlineLarge?.copyWith(
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
                            subtitleTextStyle: textTheme.titleLarge?.copyWith(
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
                            title: const Text('AMAZONÍA',
                                    textAlign: TextAlign.center)
                                .animate()
                                .slideY(duration: 1000.ms)
                                .fadeIn(),
                            subtitle: const Text(
                                    'Guía ilustrada de flora y fauna',
                                    textAlign: TextAlign.center)
                                .animate(delay: 800.ms)
                                .slideX(duration: 1000.ms)
                                .fadeIn(),
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
                  ],
                ),
                rightChildren: [
                  SvgPicture.asset(
                    'assets/splash/icono_mamifero_blanco.svg',
                    width: 64.0,
                    height: 64.0,
                    color: Colors.white.withOpacity(0.5),
                  ).animate().fadeIn(
                        duration: time.seconds,
                      ),
                  Align(
                   alignment: Alignment.topLeft,

                    child: Padding(
                      padding: const EdgeInsets.only(top: 64.0, left: 80.0),
                      child: SvgPicture.asset(
                        'assets/splash/icono_reptil_blanco.svg',
                        width: 128.0,
                        height: 128.0,
                        color: Colors.white.withOpacity(0.5),
                      ).animate().fadeIn(
                            duration: time.seconds,
                          ),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/splash/icono_peces_blanco.svg',
                    width: 128.0,
                    height: 128.0,
                    color: Colors.white.withOpacity(0.5),
                  ).animate().fadeIn(
                        duration: time.seconds,
                      ),
                ],
              ),
            ),
            Positioned(
              top: 0.0,
              left: -16.0,
              child: Transform.rotate(
                angle: -0.128,
                child: SvgPicture.asset(
                  'assets/splash/icono_hormiga_blanco.svg',
                  width: 96.0,
                  height: 96.0,
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
              top: 128.0,
              left: size.height > size.width + 32.0 ? null : 128.0,
              child: Transform.rotate(
                angle: -0.128,
                child: SvgPicture.asset(
                  'assets/splash/icono_anfibio_blanco.svg',
                  width: 92.0,
                  height: 92.0,
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
              top: 128.0,
              right: size.height > size.width + 32.0 ? 24.0 : null,
              child: Transform.rotate(
                angle: 0.15,
                child: SvgPicture.asset(
                  'assets/splash/icono_aves_blanco.svg',
                  width: 256.0,
                  height: 256.0,
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
              top: 256.0,
              left: -16.0,
              child: Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  'assets/splash/icono_palmera_blanco.svg',
                  width: 256.0,
                  height: 256.0,
                  color: Colors.white.withOpacity(0.5),
                ).animate().fadeIn(
                      duration: time.seconds,
                    ),
              ),
            ),
            Positioned(
              top: 384.0,
              right: -16.0,
              child: Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  'assets/splash/icono_arbol_blanco.svg',
                  width: 256.0,
                  height: 256.0,
                  color: Colors.white.withOpacity(0.5),
                ).animate().fadeIn(
                      duration: time.seconds,
                    ),
              ),
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
}
