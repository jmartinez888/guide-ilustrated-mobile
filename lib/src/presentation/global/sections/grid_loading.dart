// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
    final int crossAxisCount =
        littleGrid ? buildMultiGrids(width) : buildMultiGridsLarge(width);

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      child: _buildManualMasonry(crossAxisCount),
    );
  }

  Widget _buildManualMasonry(int crossAxisCount) {
    List<List<Widget>> columns = List.generate(crossAxisCount, (_) => []);

    for (int i = 0; i < 16; i++) {
      columns[i % crossAxisCount].add(
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: SkeletonConatiner(height: i % 2 == 0 ? 320.0 : 384.0),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < crossAxisCount; i++) ...[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: columns[i],
            ),
          ),
          if (i < crossAxisCount - 1) const SizedBox(width: 8.0),
        ],
      ],
    );
  }
}

class GridLoadingLarge extends StatelessWidget {
  const GridLoadingLarge({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final int crossAxisCount = buildMultiGridsLarge(width);

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      child: _buildManualMasonryLarge(crossAxisCount),
    );
  }

  Widget _buildManualMasonryLarge(int crossAxisCount) {
    List<List<Widget>> columns = List.generate(crossAxisCount, (_) => []);

    for (int i = 0; i < 16; i++) {
      columns[i % crossAxisCount].add(
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: SkeletonConatiner(height: i % 2 == 0 ? 320.0 : 384.0),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < crossAxisCount; i++) ...[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: columns[i],
            ),
          ),
          if (i < crossAxisCount - 1) const SizedBox(width: 8.0),
        ],
      ],
    );
  }
}
