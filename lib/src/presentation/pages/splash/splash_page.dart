import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/repositories/auth/auth_repository.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/router/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AuthRepository get authRepository => context.read();
  SessionController get sessionController => context.read();
  late Timer _timer;
  int time = 5;
  bool _showGif = true;
  bool _showImage = false;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    getUserData();

    // Inicializar el controlador de la animación para el Fade
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // Duración del fade
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    // Mostrar la imagen justo antes de que termine el GIF (1 milisegundo antes)
    Future.delayed(const Duration(milliseconds: 3470), () {
      setState(() {
        _showImage = true;  // Mostrar la imagen justo antes de terminar el GIF
        _fadeController.forward();  // Iniciar la animación de Fade
      });
    });

    // Mostrar el GIF por 4.2 segundos y luego continuar con la transición
    Future.delayed(const Duration(milliseconds: 3480), () {
      setState(() {
        _showGif = false;
      });
    });

    // Cambiar de pantalla después de 5 segundos
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
    _fadeController.dispose();
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
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // Ajustar el tamaño del GIF e imagen en función de la orientación
    final gifHeight = isLandscape
        ? MediaQuery.of(context).size.height * 3.8 // Más grande en horizontal
        : MediaQuery.of(context).size.height * 1.6;
    final gifWidth = isLandscape
        ? MediaQuery.of(context).size.width * 4.0 // Más grande en horizontal
        : MediaQuery.of(context).size.width * 1.8;

    // Ajustar el tamaño de los logos en función de la orientación
    final logoWidth = isLandscape ? num256 * 0.7 : num256;
    final logoHeight = isLandscape ? num64 * 0.7 : num64;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 8.0,
            left: 16.0,
            right: 16.0,
            child: SafeArea(
              child: Extend(
                min: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      texts.general.title,
                      style: textTheme.displayMedium
                          ?.copyWith(color: Colors.white),
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
                        style: textTheme.displaySmall
                            ?.copyWith(color: Colors.white),
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
            child: Stack(
              children: [
                // Mostrar el GIF
                if (_showGif)
                  Image.asset(
                    'assets/gifs/ISOTIPO-amazonia (1).gif',
                    height: gifHeight,
                    width: gifWidth,
                  ),
                // Mostrar la imagen con FadeTransition justo antes de que termine el GIF
                if (_showImage)
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Image.asset(
                      'assets/images/AMAZONÍA-ISOTIPO.png',
                      height: gifHeight,
                      width: gifWidth,
                    ),
                  ),
              ],
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
                    width: logoWidth,  // Ajustado para la orientación
                    height: logoHeight, // Ajustado para la orientación
                  ),
                  _spandImage(
                    'assets/images/logoIIAP.jpg',
                    width: logoHeight,  // Ajustado para la orientación
                    height: logoHeight, // Ajustado para la orientación
                  ),
                  _spandImage(
                    'assets/images/logo_spain.png',
                    width: logoWidth,  // Ajustado para la orientación
                    height: logoHeight, // Ajustado para la orientación
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
