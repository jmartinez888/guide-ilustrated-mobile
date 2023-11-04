import 'dart:async';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/global/icons/custom_icons.dart';
=======
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:flutter_animate/flutter_animate.dart';
>>>>>>> e55a984663180c0684213890b5c90a6c37831e29
import 'package:species/src/presentation/router/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
<<<<<<< HEAD
  late Timer _timer;
  int time = 4;

  @override
  void initState() {
    super.initState();
    
    _timer = Timer(Duration(seconds: time), () {
      ejecutarMetodo();
    });
  }

  void ejecutarMetodo() {
    context.goNamed(Routes.species);
=======
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => context.goNamed(Routes.species));
>>>>>>> e55a984663180c0684213890b5c90a6c37831e29
  }

  @override
  void dispose() {
<<<<<<< HEAD
    _timer.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: const Color(0xFFBAD87A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Material(
            color: const Color(0xFF8EB63E),
            child: Stack(
              children: [
                Column(
                  children: [
                    Material(
                      color: const Color(0xFF0086B7),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 64.0, vertical: 16.0),
                        titleTextStyle: textTheme.displayLarge?.copyWith(
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
                        subtitleTextStyle: textTheme.headlineMedium?.copyWith(
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
                        title:
                            const Text('AMAZONÍA', textAlign: TextAlign.center)
                                .animate()
                                .slideY(duration: 1000.ms)
                                .fadeIn(),
                        subtitle: const Text('Guía ilustrada de\nflora y fauna',
                                textAlign: TextAlign.center)
                            .animate(delay: 800.ms)
                            .slideX(duration: 1000.ms)
                            .fadeIn(),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 500.0,
                      child: SvgPicture.asset(
                        'assets/splash/curve.svg',
                        width: double.infinity,
                        fit: BoxFit.fill,
                        color: const Color(0xFF0086B7),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 256.0,
                  left: 8.0,
                  child: Transform.rotate(
                    angle: -0.32,
                    child: const Icon(
                      CustomIcons.bird,
                      size: 128.0,
                      color: Colors.white70,
                    )
                        .animate()
                        .shake(
                          duration: time.seconds,
                          hz: 2,
                        )
                        .fadeIn(),
                  ),
                ),
                Positioned(
                  top: 128.0,
                  right: 64.0,
                  child: Transform.rotate(
                    angle: 0.16,
                    child: const Icon(
                      CustomIcons.mammal,
                      size: 256.0,
                      color: Colors.white70,
                    )
                        .animate()
                        .shakeY(
                          duration: time.seconds,
                          hz: 0.5,
                          amount: 4.0,
                        )
                        .fadeIn(),
                  ),
                ),
                Positioned(
                  top: 320.0,
                  left: 128.0,
                  child: Transform.rotate(
                    angle: -0.25,
                    child: const Icon(
                      CustomIcons.fish,
                      size: 128.0,
                      color: Colors.white70,
                    )
                        .animate()
                        .shake(
                          duration: time.seconds,
                          hz: 2,
                        )
                        .fadeIn(),
                  ),
                ),
                Positioned(
                  top: 352.0,
                  right: 8.0,
                  child: Transform.rotate(
                    angle: 0.1,
                    child: const Icon(
                      CustomIcons.insect,
                      size: 92.0,
                      color: Colors.white70,
                    )
                        .animate()
                        .shake(
                          duration: time.seconds,
                          hz: 2,
                        )
                        .fadeIn(),
                  ),
                ),
                Positioned(
                  top: 448.0,
                  right: 16.0,
                  child: Transform.rotate(
                    angle: 0.1,
                    child: const Icon(
                      CustomIcons.palm,
                      size: 192.0,
                      color: Colors.white70,
                    )
                        .animate()
                        .shake(
                          duration: time.seconds,
                          hz: 2,
                        )
                        .fadeIn(),
                  ),
                ),
                Positioned(
                  top: 432.0,
                  left: 32.0,
                  child: Transform.rotate(
                    angle: -0.128,
                    child: const Icon(
                      CustomIcons.reptile,
                      size: 256.0,
                      color: Colors.white70,
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
                  top: 648.0,
                  left: 64.0,
                  child: Transform.rotate(
                    angle: -0.128,
                    child: const Icon(
                      CustomIcons.tree,
                      size: 128.0,
                      color: Colors.white70,
                    )
                        .animate()
                        .shake(
                          duration: time.seconds,
                          hz: 2,
                        )
                        .fadeIn(),
                  ),
                ),
                Positioned(
                  top: 632.0,
                  right: 32.0,
                  child: Transform.rotate(
                    angle: -0.1,
                    child: const Icon(
                      CustomIcons.amphibian,
                      size: 192.0,
                      color: Colors.white70,
                    )
                        .animate()
                        .shakeY(
                          duration: time.seconds,
                          hz: 1,
                          amount: 32.0,
                        )
                        .fadeIn(),
                  ),
=======
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SvgPicture.asset(
          'assets/svg/splash_background.svg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomImageContainer(
                      imageUrl: 'assets/images/logo.png',
                      heightImage: 256.0,
                      width: 256.0,
                      fitImage: true,
                    ),
                    Text(
                      'Amazonía Guía Ilustrada Flora y Fauna',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Animate(
            effects: const [FadeEffect(), ScaleEffect()],
            child: Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Image.asset(
                'assets/images/logoIIAP.png',
                width: 128.0,
                height: 128.0,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16.0,
          child: Animate(
            effects: const [FadeEffect(), ScaleEffect()],
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Image.asset(
                    'assets/images/logo_minam.png',
                    width: 256.0,
                  ),
                ),
                Image.asset(
                  'assets/images/logo_spain.png',
                  width: 256.0,
>>>>>>> e55a984663180c0684213890b5c90a6c37831e29
                ),
              ],
            ),
          ),
        ),
<<<<<<< HEAD
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
=======
      ],
>>>>>>> e55a984663180c0684213890b5c90a6c37831e29
    );
  }
}
