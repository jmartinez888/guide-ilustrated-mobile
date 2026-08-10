import 'package:flutter/material.dart';

class DottedBackground extends StatelessWidget {
  final Widget child;

  const DottedBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedBackgroundPainter(
        color: Colors.grey.withOpacity(0.3),
        spacing: 20.0,
        radius: 1.0,
      ),
      child: child,
    );
  }
}

class _DottedBackgroundPainter extends CustomPainter {
  final Color color;
  final double spacing;
  final double radius;

  _DottedBackgroundPainter({
    required this.color,
    required this.spacing,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
