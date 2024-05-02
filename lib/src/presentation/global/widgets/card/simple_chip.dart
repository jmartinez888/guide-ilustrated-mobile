import 'package:flutter/material.dart';

class SimpleChip extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  const SimpleChip({
    super.key,
    required this.label,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    return Material(
      color: backgroundColor ?? primaryColor,
      borderRadius: BorderRadius.circular(32.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(
          label,
          style: bodyLarge?.copyWith(
            color: textColor ?? Colors.white ,
          ),
        ),
      ),
    );
  }
}
