import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/domain/entities/community/community.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/widgets/images/image_generic.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';
import 'package:species/src/presentation/router/routes.dart';
import 'package:latlong2/latlong.dart';

class CommunitySection extends StatefulWidget {
  final Community community;
  const CommunitySection({
    super.key,
    required this.community,
  });

  @override
  State<CommunitySection> createState() => _CommunitySectionState();
}

class _CommunitySectionState extends State<CommunitySection> {
  late Community community;
  late TextStyle titleLarge;
  late TextStyle titleMedium;
  late Color mainColor;
  late Color opaqueColor;
  late TextStyle bodyLarge;

  @override
  void initState() {
    community = widget.community;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    titleLarge = textTheme.titleLarge!;
    titleMedium = textTheme.titleMedium!;
    bodyLarge = textTheme.bodyLarge!;
    mainColor = colorScheme.primary;
    opaqueColor = colorScheme.secondary;
    return Extend(
      child: GridTwoResponsive(
        leftChild: community.images != null && community.images!.isNotEmpty
            ? InkWell(
                borderRadius: BorderRadius.circular(16.0),
                onTap: () => context.pushNamed(
                  Routes.image,
                  pathParameters: {
                    'images': jsonEncode(
                      community.images,
                    ).toString(),
                  },
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ImageGeneric(
                    borderRadius: BorderRadius.circular(16.0),
                    community.images!.first,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              )
            : const Icon(Icons.image_not_supported_rounded),
        rightChild: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: PaddingConfig.allL,
              sliver: SliverList.list(
                children: [
                  Text(
                    community.name != null &&
                            community.name!.isNotEmpty &&
                            !community.name!.startsWith('NA') &&
                            !community.name!.startsWith('-') &&
                            !community.name!.startsWith('N/A')
                        ? community.name!
                        : texts.general.descriptionNotAvailable,
                    style: titleLarge.copyWith(color: mainColor),
                  ),
                  Padding(
                    padding: PaddingConfig.onlyTop,
                    child: Text(
                      community.description != null &&
                            community.description!.isNotEmpty &&
                            !community.description!.startsWith('NA') &&
                            !community.description!.startsWith('-') &&
                            !community.description!.startsWith('N/A')
                        ? community.description!.replaceAll('\t', '')
                        : 'Nombre no disponible',
                      textAlign: TextAlign.start,
                      style: bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
            if (community.latitude != null &&
                community.longitude != null &&
                community.longitude != null &&
                community.latitude != 0.0 &&
                community.longitude != 0.0)
              SliverPadding(
                padding: PaddingConfig.symetrictHorizontalL,
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Ubicación',
                    style: titleLarge.copyWith(color: mainColor),
                  ),
                ),
              ),
            if (community.latitude != null &&
                community.longitude != null &&
                community.longitude != null &&
                community.latitude != 0.0 &&
                community.longitude != 0.0)
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 16.0),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: SizedBox(
                        height: 384.0,
                        width: 512.0,
                        child: FlutterMap(
                          options: MapOptions(
                            initialCenter: LatLng(
                                community.latitude!, community.longitude!),
                            initialZoom: 9.2,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.app',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
