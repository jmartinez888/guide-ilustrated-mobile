import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/presentation/global/functions/get_main_color_by_string.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/global/widgets/multimedia/custom_audio_bar.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';
import 'package:species/src/presentation/router/routes.dart';

class BodySpecieDetailsSection extends StatelessWidget {
  final Specie? specie;
  const BodySpecieDetailsSection({
    Key? key,
    this.specie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    late Map<String, dynamic> mainOpaqueColor;
    late Color mainColor;
    late Color opaqueColor;

    if (specie != null) {
      mainOpaqueColor = getMainColorByString(specie!.type);
      mainColor = mainOpaqueColor['main'];
      opaqueColor = mainOpaqueColor['opaque'];
    }
    return Scaffold(
      body: Stack(
        children: [
          specie == null
              ? const Center(child: CircularProgressIndicator())
              : GridTwoResponsive(
                  leftChild: Stack(
                    children: [
                      CustomImageContainer(
                        tag: specie!.id,
                        mainColor: mainColor,
                        onTap: () => context.pushNamed(Routes.imageDetails),
                        imageUrl: specie!.images.first,
                        heightImage: size.height > size.width + 32.0
                            ? 384.0
                            : double.infinity,
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
                              iconColor: Colors.white,
                              backgroundColor: mainColor,
                              onPressed: () {},
                            ),
                            CustomIconButton(
                              tooltip: 'Compartir',
                              icon: Icons.share,
                              iconColor: Colors.white,
                              backgroundColor: mainColor,
                              onPressed: () {},
                            ),
                            CustomIconButton(
                              tooltip: 'Favorito',
                              icon: Icons.favorite,
                              iconColor: Colors.white,
                              backgroundColor: mainColor,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  rightChildren: [
                    Text(
                      specie!.name,
                      style: textTheme.titleLarge?.copyWith(
                        color: mainColor,
                      ),
                    ),
                    Text(
                      specie!.scientificName,
                      style: textTheme.titleMedium
                          ?.copyWith(color: colorScheme.onBackground),
                    ),
                    if (specie!.sound.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: CustomAudioBar(
                          audioUrl: specie!.sound,
                          backgroundColor: mainColor,
                          progressBarColor: opaqueColor,
                        ),
                      ),
                    if (specie!.authors.isNotEmpty)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            specie!.authors.join(', '),
                            style: textTheme.titleMedium
                                ?.copyWith(color: colorScheme.onSurfaceVariant),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        '${specie!.kingdom} - ${specie!.phylum} - ${specie!.class_} - ${specie!.order} - ${specie!.family}',
                        style: textTheme.titleMedium
                            ?.copyWith(color: colorScheme.onSurface),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        specie!.description,
                        style: textTheme.bodyMedium
                            ?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    )
                  ],
                ),
          const Positioned(
            left: 56.0,
            top: 8.0,
            child: CustomBackButton(),
          ),
        ],
      ),
    );
  }
}
