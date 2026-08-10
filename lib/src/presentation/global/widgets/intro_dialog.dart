import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/utils/responsive.dart';

Future<void> showIntroDialog(
  BuildContext context, {
  required String title,
  required String message,
  IconData? icon,
}) {
  return showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.3),
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      final responsive = Responsive.of(context);
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: responsive.dp(6), color: Colors.orange),
                  const SizedBox(height: 16),
                ],
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: responsive.dp(2.5),
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: responsive.dp(1.8),
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                    onPressed: () {
                      Navigator.pop(dialogContext);
                    },
                    child: const Text(
                      'Entendido',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
