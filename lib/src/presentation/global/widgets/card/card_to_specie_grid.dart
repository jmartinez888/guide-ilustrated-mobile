
import 'package:flutter/material.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/card/custom_grid_card.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';

class CardToSpeciesGrid extends StatelessWidget {
  final void Function()? onTap;
  final Specie specie;
  final Color mainColor;
  final Color opaqueColor;
  final Widget favoriteIcon;
  const CardToSpeciesGrid({
    Key? key,
    this.onTap,
    required this.specie,
    required this.mainColor,
    required this.opaqueColor,
    required this.favoriteIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGridCard(
      maxLines: 2,
      onTap: onTap,
      mainColor: mainColor,
      opaqueColor: opaqueColor, 
      image: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            color: Colors.white,
            child: CustomImageContainer(
              mainColor: mainColor,
              imageUrl: specie.images != null && specie.images!.isNotEmpty
                  ? specie.images!.first
                  : null,
              heightImage: 232.0,
            ),
          ),
          if (specie.conservationStates != null &&
              specie.conservationStates!.isNotEmpty)
            Positioned(
              left: 8.0,
              bottom: 8.0,
              child: Row(
                children: [
                  for (var statusImage in specie.conservationStates!)
                    CustomImageContainer(
                      mainColor: mainColor,
                      borderRadius: BorderRadius.zero,
                      imageUrl: statusImage.image,
                      heightImage: 40.0,
                      width: 40.0,
                      progressIndicatorBuilder: (_, __, ___) =>
                          const SizedBox(),
                    ),
                ],
              ),
            ),
          Positioned(
            top: 8.0,
            right: 8.0,
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                if (specie.sound != null && specie.sound!.isNotEmpty)
                  CustomIconButton(
                    onPressed: null,
                    iconColor: mainColor,
                    icon: Icons.volume_up_rounded,
                  ),
                SizedBox(child: favoriteIcon)
              ],
            ),
          ),
        ],
      ),
      title: specie.name,
      subtitle: specie.scientificName,
      fontStyle: FontStyle.italic,
    );
  }
}
