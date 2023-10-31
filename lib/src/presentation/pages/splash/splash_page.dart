import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:species/src/presentation/router/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => context.goNamed(Routes.species));
  }

  @override
  void dispose() {
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
