import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';
import 'package:species/src/presentation/global/widgets/skeleton/skeleton_container.dart';

class AuthorDetailsLoading extends StatelessWidget {
  const AuthorDetailsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Extend(
      child: GridTwoResponsive(
        leftChild: const SkeletonConatiner(
          height: double.infinity,
        ),
        rightChild: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: PaddingConfig.allBottomSafeL,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: SkeletonConatiner(
                height: 48.0,
                width: 256.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: SkeletonConatiner(
                  borderRadius: 32.0,
                  height: 40.0,
                  width: 160.0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: SkeletonConatiner(
                height: 320.0,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: PaddingConfig.onlyTopL,
              child: const Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.end,
                children: [
                  SkeletonConatiner(
                    borderRadius: 32.0,
                    height: 40.0,
                    width: 192.0,
                  ),
                  SkeletonConatiner(
                    borderRadius: 32.0,
                    height: 40.0,
                    width: 192.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
