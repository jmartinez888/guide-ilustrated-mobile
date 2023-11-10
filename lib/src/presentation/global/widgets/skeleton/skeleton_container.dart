import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkeletonConatiner extends StatelessWidget {
  final double? width;
  final double? height;
  const SkeletonConatiner({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: colorScheme.outline,
      borderRadius: BorderRadius.circular(16.0),
      child: SizedBox(
        width: width,
        height: height,
      ),
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .fadeIn(duration: 1250.milliseconds)
        .fadeOut(delay: 1000.milliseconds, duration: 1250.milliseconds);
  }
}