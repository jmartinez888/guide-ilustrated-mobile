import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/widgets/responsives/max_extend.dart';

class GridTwoResponsive extends StatelessWidget {
  final Widget? leftChild;
  final List<Widget> rightChildren;
  const GridTwoResponsive({
    Key? key,
    this.leftChild,
    this.rightChildren = const <Widget>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaxExtend(
      child: size.height > size.width + 32.0
          ? Column(
              children: [
                SizedBox(child: leftChild),
                Expanded(child: _leftList()),
              ],
            )
          : Row(
              children: [
                Expanded(child: SizedBox(child: leftChild)),
                Expanded(child: _leftList()),
              ],
            ),
    );
  }

  Widget _leftList() => ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
            top: 16.0, right: 16.0, left: 16.0, bottom: 100.0),
        children: rightChildren,
      );
}
