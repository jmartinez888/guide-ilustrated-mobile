import 'package:flutter/material.dart';
import 'package:species/src/domain/entities/community.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';

class IndigenousCommunityDetailsSection extends StatelessWidget {
  final Community community;
  const IndigenousCommunityDetailsSection({
    Key? key,
    required this.community,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return GridTwoResponsive(
      leftChild: CustomImageContainer(
        imageUrl: community.image,
        heightImage: size.height > size.width + 32.0 ? 384.0 : double.infinity,
      ),
      rightChildren: [
        Text(
          community.name,
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.primary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            community.description.replaceAll('\t', ''),
            style: textTheme.bodyMedium
                ?.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        )
      ],
    );
  }
}
