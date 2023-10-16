import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';

class BodySpecieDetailsSection extends StatelessWidget {
  const BodySpecieDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          GridTwoResponsive(
            leftChild: Stack(
              children: [
                CustomImageContainer(
                  imageUrl:
                      'https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2022%2F04%2Fsam-raimi-spider-man-4-tobey-maguire-possibility-marvel-studio-info-1.jpg?cbr=1&q=90',
                  heightImage:
                      size.height > size.width + 32.0 ? 384.0 : double.infinity,
                ),
                Positioned(
                  top: 16.0,
                  right: 16.0,
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      CustomIconButton(
                        tooltip: 'Descargar',
                        icon: Icons.download_rounded,
                        onPressed: () {},
                      ),
                      CustomIconButton(
                        tooltip: 'Compartir',
                        icon: Icons.share,
                        onPressed: () {},
                      ),
                      CustomIconButton(
                        tooltip: 'Favorito',
                        icon: Icons.favorite,
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
            rightChildren: [
              Text(
                'title',
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              Text(
                'subtitle',
                style: textTheme.titleMedium
                    ?.copyWith(color: colorScheme.onBackground),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Placeholder(
                  child: SizedBox(
                    height: 64.0,
                    width: double.infinity,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'subtitle',
                    style: textTheme.titleMedium
                        ?.copyWith(color: colorScheme.onSurfaceVariant),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'type',
                  style: textTheme.titleMedium
                      ?.copyWith(color: colorScheme.onSurface),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Descrición',
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
              )
            ],
          ),
          Positioned(
            left: 56.0,
            top: 8.0,
            child: CustomIconButton(
              tooltip: 'Atrás',
              icon: Icons.arrow_back_ios_rounded,
              onPressed: () => Navigator.maybePop(context),
            ),
          ),
        ],
      ),
    );
  }
}
