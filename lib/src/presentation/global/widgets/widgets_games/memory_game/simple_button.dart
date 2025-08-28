import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SimpleButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback onPressed;
  final LottieDelegates? lottieDelegates;

  /// 🔹 Coachmark / animación de guía (desactivada por defecto para no romper usos).
  final bool coachmarkEnabled;

  /// Ruta del asset Lottie. Si no envías nada, usa un valor por defecto.
  /// Asegúrate de registrar el asset en pubspec.yaml (ver abajo).
  final String coachmarkAsset;

  /// Escala de la animación respecto a la altura del botón (0.0–1.5 aprox).
  /// 1.0 ≈ alto del botón. Default: 0.9
  final double coachmarkScale;

  /// Desplazamiento horizontal extra desde el borde derecho (en px, relativo).
  /// Se calcula sobre la altura del botón para mantener la respuesta.
  /// Default: 0.06 * altura del botón (ligero padding hacia adentro).
  final double? coachmarkRightInsetFactor;

  /// Alineación vertical de la animación: -1 (arriba) a 1 (abajo). 0 = centrado.
  final double coachmarkVerticalAlign;

  // ignore: prefer_const_constructors_in_immutables
  SimpleButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    required this.onPressed,
    this.lottieDelegates,
    this.coachmarkEnabled = false,
    this.coachmarkAsset = 'assets/memory/animation/touchmeeiiap.json',
    this.coachmarkScale = 0.9,
    this.coachmarkRightInsetFactor,
    this.coachmarkVerticalAlign = 0.0,
  }) : assert(coachmarkScale > 0, 'coachmarkScale debe ser > 0');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    final buttonWidth = screenWidth * 0.7;
    final buttonHeight = screenHeight * 0.05;

    // Inset derecho responsivo en función de la altura del botón.
    final rightInsetPx =
        (coachmarkRightInsetFactor != null && coachmarkRightInsetFactor! >= 0)
            ? (coachmarkRightInsetFactor! * buttonHeight)
            : (0.06 * buttonHeight); // default: ~6% de la altura del botón

    // Tamaño del coachmark basado en la altura del botón.
    final coachmarkSize = buttonHeight * coachmarkScale;

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
            // Capa base: el botón
            Positioned.fill(child: buttonCore),

            // Capa superior: coachmark (opcional y no bloquea toques)
            if (coachmarkEnabled)
              Positioned.fill(
                child: IgnorePointer(
                  child: Align(
                    // Alineado al borde derecho, con ajuste vertical configurable
                    alignment: Alignment(1.0, coachmarkVerticalAlign.clamp(-1.0, 1.0)),
                    child: Padding(
                      // Inset hacia adentro para no cortar la animación
                      padding: EdgeInsets.only(right: rightInsetPx),
                      child: SizedBox(
                        width: coachmarkSize,
                        height: coachmarkSize,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Lottie.asset(
                            coachmarkAsset,
                            repeat: true,
                            animate: true,
                            delegates: lottieDelegates,
                          ),
                        ),
                      ),
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
