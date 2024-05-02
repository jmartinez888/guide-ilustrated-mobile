// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:species/src/presentation/global/functions/build_multi_grids.dart';
import 'package:species/src/presentation/global/widgets/skeleton/skeleton_container.dart';

class GridLoading extends StatelessWidget {
  final EdgeInsets padding;
  final bool littleGrid;
  const GridLoading({
    Key? key,
    required this.padding,
    this.littleGrid = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MasonryGridView.builder(
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      padding: padding,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 16,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: littleGrid
              ? buildMultiGrids(width)
              : buildMultiGridsLarge(width)),
      itemBuilder: (context, index) =>
          SkeletonConatiner(height: index % 2 == 0 ? 320.0 : 384.0),
    );
  }
}

class GridLoadingLarge extends StatelessWidget {
  const GridLoadingLarge({super.key});

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
          crossAxisCount: buildMultiGridsLarge(width)),
      itemBuilder: (context, index) =>
          SkeletonConatiner(height: index % 2 == 0 ? 320.0 : 384.0),
    );
  }
}
