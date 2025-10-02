import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SimpleButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback onPressed;

  /// 🔹 Coachmark / animación de guía (desactivada por defecto para no romper usos).
  final bool coachmarkEnabled;

  /// Ruta del asset Lottie.
  final String coachmarkAsset;

  /// 🔹 Nuevo: ancho de la animación respecto al ancho de la pantalla.
  /// Ejemplo: 0.1 → 10% del ancho de pantalla.
  final double coachmarkWidthFactor;

  /// 🔹 Nuevo: alto de la animación respecto al alto de la pantalla.
  /// Ejemplo: 0.05 → 5% del alto de pantalla.
  final double coachmarkHeightFactor;

  /// 🔹 Nuevo: desplazamiento horizontal en porcentaje del ancho de pantalla.
  /// Ejemplo: 0.02 → se mueve 2% del ancho de pantalla a la izquierda/derecha.
  final double coachmarkOffsetX;

  /// 🔹 Nuevo: desplazamiento vertical en porcentaje del alto de pantalla.
  /// Ejemplo: 0.01 → se mueve 1% del alto de pantalla hacia arriba/abajo.
  final double coachmarkOffsetY;

  // ignore: prefer_const_constructors_in_immutables
  SimpleButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    required this.onPressed,
    this.coachmarkEnabled = false,
    this.coachmarkAsset = 'assets/lotties/touchmeeiiap.json',
    this.coachmarkWidthFactor = 0.08,
    this.coachmarkHeightFactor = 0.05,
    this.coachmarkOffsetX = 0.0,
    this.coachmarkOffsetY = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    final buttonWidth = screenWidth * 0.7;
    final buttonHeight = screenHeight * 0.05;

    final buttonCore = Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: screenHeight * 0.02,
            color: textColor ?? Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: buttonWidth,
        height: buttonHeight,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Botón base
            Positioned.fill(child: buttonCore),

            // Animación Lottie controlada con porcentaje de pantalla
            if (coachmarkEnabled)
              Positioned(
                left: (screenWidth * coachmarkOffsetX),
                top: (screenHeight * coachmarkOffsetY),
                child: SizedBox(
                  width: screenWidth * coachmarkWidthFactor,
                  height: screenHeight * coachmarkHeightFactor,
                  child: IgnorePointer(
                    child: Lottie.asset(
                      coachmarkAsset,
                      repeat: true,
                      animate: true,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
