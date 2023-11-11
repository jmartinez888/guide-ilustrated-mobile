import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';
import 'package:species/src/presentation/global/widgets/skeleton/skeleton_container.dart';

class DetailsLoading extends StatelessWidget {
  const DetailsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GridTwoResponsive(
      leftChild: SkeletonConatiner(
        height: size.height > size.width + 32.0 ? 288 : double.infinity,
        width: double.infinity,
      ),
      rightChildren: const [
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: SkeletonConatiner(
            height: 48.0,
            width: double.infinity,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: SkeletonConatiner(
            height: 64.0,
            width: double.infinity,
            borderRadius: 100.0,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: SkeletonConatiner(
              height: 32.0,
              width: 256.0,
            ),
          ),
        ),
        SkeletonConatiner(
          height: 512.0,
          width: double.infinity,
        ),
      ],
    );
  }
}