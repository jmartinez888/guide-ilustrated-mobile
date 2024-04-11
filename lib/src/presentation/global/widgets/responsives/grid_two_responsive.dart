import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridTwoResponsive extends StatelessWidget {
  final Widget? leftChild;
  final Widget? rightChild;
  final bool neverScroll;

  const GridTwoResponsive({
    Key? key,
    this.leftChild,
    this.rightChild,
    this.neverScroll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    final statusBar = MediaQueryData.fromView(View.of(context)).padding.top;
    final maxHeight = size.height - statusBar;
    return StaggeredGrid.count(
      crossAxisCount: size.height > size.width + 32.0 ? 1 : 2,
      children: [
        SizedBox(
          width: double.infinity,
          height: size.height > size.width + 32.0 ? 320.0 : maxHeight,
          child: leftChild,
        ),
        SizedBox(
          height:
              size.height > size.width + 32.0 ? maxHeight - 320.0 : maxHeight,
          width: double.infinity,
          child: rightChild,
        ),
      ],
    );
  }
}
