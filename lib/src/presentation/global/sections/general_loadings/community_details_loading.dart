import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';
import 'package:species/src/presentation/global/widgets/skeleton/skeleton_container.dart';

class CommunityDetailsLoading extends StatelessWidget {
  const CommunityDetailsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Extend(
      child: GridTwoResponsive(
        leftChild: const SkeletonConatiner(
          height: double.infinity,
        ),
        rightChild: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: PaddingConfig.allL,
          children: [
            _title(),
            Padding(
              padding: PaddingConfig.onlyTop,
              child: const SkeletonConatiner(
                width: double.infinity,
                height: 512.0,
              ),
            ),
            Padding(
              padding: PaddingConfig.onlyTopL,
              child: _title(),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 16.0),
              child: SkeletonConatiner(
                height: 384.0,
                width: 512.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() => const Align(
        alignment: Alignment.centerLeft,
        child: SkeletonConatiner(
          height: 28.0,
          width: 128.0,
        ),
      );
}
