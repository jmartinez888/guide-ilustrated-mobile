import 'package:flutter/material.dart';

class GridTwoResponsive extends StatelessWidget {
  final Widget? leftChild;
  final List<Widget> rightChildren;

  const GridTwoResponsive({
    Key? key,
    this.leftChild,
    this.rightChildren = const <Widget>[],
  }) : super(key: key);

  final String left = 'left';
  final String right = 'right';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return size.height > size.width + 32.0
        ? Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 320.0,
                key: Key(left),
                child: leftChild,
              ),
              Expanded(
                key: Key(right),
                child: _leftList(),
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                key: Key(left),
                child: SizedBox(child: leftChild),
              ),
              Expanded(
                key: Key(right),
                child: _leftList(),
              ),
            ],
          );
  }

  Widget _leftList() => ListView(
        key: const PageStorageKey('list'),
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
            top: 16.0, right: 16.0, left: 16.0, bottom: 100.0),
        children: rightChildren,
      );
}
