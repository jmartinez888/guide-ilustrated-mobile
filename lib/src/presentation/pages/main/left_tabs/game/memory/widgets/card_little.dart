// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:species/src/presentation/global/utils/responsive.dart';

class CardLittle extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final bool revealed;

  /// Nuevo: controla si se muestra el título (nombre) encima de la imagen.
  /// - Debe ser true solo cuando la carta ya fue emparejada.
  final bool showTitle;

  const CardLittle({
    Key? key,
    this.imagePath,
    this.title,
    required this.revealed,
    this.showTitle = false, // por defecto no muestra el título
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    // Antes era: screenWidth * 0.1 y screenHeight * 0.1
    // Usamos wp/hp para mantener consistencia.
    // Además, en tablet esto podría ser muy pequeño si se mantiene el 10% del ancho (que es grande)
    // pero 10% del alto (que es grande).
    // De momento mantenemos la lógica pero con responsive util.
    final double cardWidth = responsive.wp(10);
    final double cardHeight = responsive.hp(10);

    Widget _buildAssetExpanded() {
      if (imagePath == null) {
        return SizedBox.expand(
          child: Center(
            child: Text(
              'No disponible',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: responsive.dp(1.8),
              ),
            ),
          ),
        );
      }

      if (imagePath!.endsWith(".svg")) {
        return SizedBox.expand(
          child: SvgPicture.asset(
            imagePath!,
            fit: BoxFit.fill,
          ),
        );
      } else if (imagePath!.endsWith(".json")) {
        return SizedBox.expand(
          child: Lottie.asset(
            imagePath!,
            fit: BoxFit.fill,
          ),
        );
      } else {
        return SizedBox.expand(
          child: Image.asset(
            imagePath!,
            fit: BoxFit.fill,
          ),
        );
      }
    }

    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          // Contorno de 3 px negro al contenedor principal
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              // Dorso cuando NO está revelada
              if (!revealed)
                const Positioned.fill(
                  child: _CardBack(),
                )
              else
                // Frente (imagen) cuando está revelada
                Positioned.fill(child: _buildAssetExpanded()),

              // TÍTULO (nombre) SOLO CUANDO EL PAR FUE EMPAREJADO
              // (antes se mostraba siempre que estuviera "revealed")
              if (showTitle)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    // Pegado al borde inferior y con padding mínimo
                    padding: EdgeInsets.symmetric(
                      horizontal: responsive.wp(1),
                      vertical: cardHeight * 0.02,
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            title ?? 'No disponible',
                            style: TextStyle(
                              fontSize: responsive.dp(2.0),
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = Theme.of(context).colorScheme.onSurface,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            title ?? 'No disponible',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: responsive.dp(2.0),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardBack extends StatelessWidget {
  const _CardBack();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/memory/icon/frutaiconcard.webp",
      fit: BoxFit.fill,
    );
  }
}
