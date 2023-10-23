import 'package:flutter/material.dart';

class Extend extends StatelessWidget {
  final Widget child;
  final bool? min;
  const Extend({
    Key? key,
    required this.child,
    this.min = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(width: min == true ? 720.0 : 1920.0, child: child),
    );
  }
}
