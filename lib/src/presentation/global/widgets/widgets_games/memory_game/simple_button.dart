import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback onPressed; // 🔹 ahora acepta la acción

  // ignore: prefer_const_constructors_in_immutables
  SimpleButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    required this.onPressed, // 🔹 obligatorio
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onPressed, // 🔹 acción al presionar
      child: Container(
        width: screenWidth * 0.7,
        height: screenHeight * 0.05,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: screenHeight * 0.02,
              color: textColor ?? Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
