import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/widgets/skeleton/skeleton_container.dart';

class FavoritesLoaging extends StatelessWidget {
  const FavoritesLoaging({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 8,
      separatorBuilder: (_, __) => const SizedBox(height: 8.0),
      itemBuilder: (_, __) => const SkeletonConatiner(height: 256.0),
    );
  }
}
