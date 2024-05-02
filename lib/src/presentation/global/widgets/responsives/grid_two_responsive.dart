import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridTwoResponsive extends StatelessWidget {
  final Widget? leftChild;
  final Widget? rightChild;

  const GridTwoResponsive({
    Key? key,
    this.leftChild,
    this.rightChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const heightLeft = 368.0;
    const safe = 32.0;
    const infinity = double.infinity;
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final statusBar = MediaQueryData.fromView(View.of(context)).padding.top;
    final maxHeight = size.height - statusBar;
    return StaggeredGrid.count(
      crossAxisCount: size.height > size.width + safe ? 1 : 2,
      children: [
        SizedBox(
          width: infinity,
          height: size.height > size.width + safe ? heightLeft : maxHeight,
          child: leftChild,
        ),
        SizedBox(
          height: size.height > size.width + safe
              ? maxHeight - heightLeft
              : maxHeight,
          width: infinity,
          child: rightChild,
        ),
      ],
    );
  }
}
