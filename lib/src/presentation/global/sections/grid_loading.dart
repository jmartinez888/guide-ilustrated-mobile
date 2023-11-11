import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:species/src/presentation/global/functions/build_multi_grids.dart';
import 'package:species/src/presentation/global/widgets/skeleton/skeleton_container.dart';


class GridLoading extends StatelessWidget {
  const GridLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MasonryGridView.builder(
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      padding: const EdgeInsets.all(16.0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 16,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: buildMultiGrids(width)),
      itemBuilder: (context, index) =>
          SkeletonConatiner(height: index % 2 == 0 ? 320.0 : 384.0),
    );
  }
}