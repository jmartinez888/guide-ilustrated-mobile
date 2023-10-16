import 'package:flutter/material.dart';

class MaxExtend extends StatelessWidget {
  final Widget child;
  const MaxExtend({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(width: 1920.0, child: child),
    );
  }
}
