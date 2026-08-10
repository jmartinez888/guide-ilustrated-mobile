// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:lottie/lottie.dart';

/// Overlay de bienvenida reutilizable.
/// Pasa el [message] desde donde lo llames.
Future<void> showMemoryIntroOverlay(
  BuildContext context, {
  required String message,
  String lottieAsset = 'assets/memory/animation/NIO-ANIMACION 2.json',
}) {
  final size = MediaQuery.of(context).size;
  final h = size.height;
  final w = size.width;

  void safeClose() {
    final nav = Navigator.of(context, rootNavigator: true);
    if (nav.canPop()) nav.pop();
  }

  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'memory-intro-overlay',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (_, __, ___) {
      return Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Cierra tocando en cualquier zona vacía
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: safeClose,
              ),
            ),

            // ======= BURBUJA (IZQUIERDA) =======
            Positioned(
              left: w * 0.00,
              top:  h * 0.20,
              child: SizedBox(
                width: w * 0.90, // (mantiene tu ancho actual)
                child: BubbleNormal(
                  text: message,
                  isSender: false,     // izquierda
                  color: Colors.white, // fondo
                  tail: true,
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: h * 0.02, // 2% alto pantalla
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // ======= LOTTIE (DERECHA) =======
            Positioned(
              right:  w * 0.04,
              bottom: h * 0.12,
              width:  w * 0.60, // (mantiene tu tamaño actual)
              height: h * 0.60, // (mantiene tu tamaño actual)
              child: Lottie.asset(
                lottieAsset,
                fit: BoxFit.fill,
              ),
            ),

            // ======= BOTÓN CERRAR (ARRIBA-DERECHA) =======
            Positioned(
              top:   h * 0.03,
              right: w * 0.04,
              child: IconButton(
                icon: const Icon(Icons.cancel),
                color: Colors.white,
                iconSize: h * 0.05, // 5% del alto
                onPressed: safeClose,
                tooltip: 'Cerrar',
              ),
            ),
          ],
        ),
      );
    },
    transitionBuilder: (context, anim, _, child) {
      final curved = CurvedAnimation(parent: anim, curve: Curves.easeOut);
      return FadeTransition(opacity: curved, child: child);
    },
  );
}
