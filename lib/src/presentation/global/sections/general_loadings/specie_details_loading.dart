import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';
import 'package:species/src/presentation/global/widgets/skeleton/skeleton_container.dart';

class SpecieDetailsLoading extends StatelessWidget {
  const SpecieDetailsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridTwoResponsive(
      leftChild: const SkeletonConatiner(
        height: double.infinity,
      ),
      rightChild: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: PaddingConfig.allBottomSafeL,
        children: const [
          Align(
            alignment: Alignment.centerLeft,
            child: SkeletonConatiner(
              height: 48.0,
              width: 256.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: SkeletonConatiner(
              borderRadius: 64.0,
              height: 66.0,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: SkeletonConatiner(
                borderRadius: 32.0,
                height: 40.0,
                width: 112.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: SkeletonConatiner(
              height: 320.0,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: SkeletonConatiner(
              height: 320.0,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: SkeletonConatiner(
              height: 48.0,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
