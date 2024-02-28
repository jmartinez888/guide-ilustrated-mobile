import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/presentation/global/functions/get_main_color_by_int.dart';
import 'package:species/src/presentation/global/sections/specie_tab/state/specie_tab_state.dart';
import 'package:species/src/presentation/global/widgets/card/custom_grid_card.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/router/routes.dart';

class SpeciesTabSection extends StatefulWidget {
  final int type;
  final SpecieTabState state;
  final PagingController<int, Specie> pagingController;
  final Future<void> Function() onRefresh;
  final void Function() retryLastFailedRequest;
  final void Function() switchName;
  final void Function() switchScientificName;

  const SpeciesTabSection({
    super.key,
    required this.type,
    required this.state,
    required this.pagingController,
    required this.onRefresh,
    required this.retryLastFailedRequest,
    required this.switchName,
    required this.switchScientificName,
  });

  @override
  State<SpeciesTabSection> createState() => _SpeciesTabSectionState();
}

class _SpeciesTabSectionState extends State<SpeciesTabSection> {
  late Map<String, dynamic> mainOpaqueColor;
  late Color mainColor;
  late Color opaqueColor;

  @override
  void initState() {
    mainOpaqueColor = getMainColorByInt(widget.type);
    mainColor = mainOpaqueColor['main'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    opaqueColor = mainOpaqueColor['opaque'];
    final orderByName = widget.state.orderByName;
    final orderAsc = widget.state.orderAsc;
    return Stack(
      children: [
        RefreshIndicator(
          color: mainColor,
          onRefresh: widget.onRefresh,
          child: CustomScrollView(
            key: PageStorageKey(widget.type),
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16.0, 56.0, 16.0, 100.0),
                sliver: PagedSliverList<int, Specie>.separated(
                  pagingController: widget.pagingController,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8.0),
                  builderDelegate: PagedChildBuilderDelegate<Specie>(
                    animateTransitions: true,
                    transitionDuration: const Duration(milliseconds: 400),
                    newPageErrorIndicatorBuilder: (context) => CustomGridCard(
                      onTap: widget.retryLastFailedRequest,
                      title: 'Algo salió mal, inténtalo de nuevo',
                      image: Text('Falló'),
                    ),
                    itemBuilder: (context, specie, index) {
                      return CustomGridCard(
                        onTap: () => context.pushNamed(
                          Routes.specieDetails,
                          pathParameters: {'id': specie.id.toString()},
                        ),
                        principalColor: mainColor,
                        backgroundColor: opaqueColor,
                        image: Stack(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 48.0),
                              color: Colors.white,
                              child: CustomImageContainer(
                                mainColor: mainColor,
                                imageUrl: specie.image,
                                heightImage: 232.0,
                              ),
                            ),
                            if (specie.stateOfConservations != null &&
                                specie.stateOfConservations!.isNotEmpty)
                              Positioned(
                                left: 8.0,
                                bottom: 8.0,
                                child: Row(
                                  children: [
                                    for (var statusImage
                                        in specie.stateOfConservations!)
                                      CustomImageContainer(
                                        mainColor: mainColor,
                                        borderRadius: BorderRadius.zero,
                                        imageUrl: statusImage.image,
                                        heightImage: 40.0,
                                        width: 40.0,
                                        progressIndicatorBuilder:
                                            (_, __, ___) => const SizedBox(),
                                      ),
                                  ],
                                ),
                              ),
                            Positioned(
                              top: 8.0,
                              right: 8.0,
                              child: Row(
                                children: [
                                  if (specie.sound != null &&
                                      specie.sound!.isNotEmpty)
                                    const Icon(Icons.music_note_rounded),
                                ],
                              ),
                            ),
                          ],
                        ),
                        title: specie.name,
                        subtitle: specie.scientificName,
                        fontStyle: FontStyle.italic,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 48.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            reverse: true,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            children: [
              ElevatedButton.icon(
                onPressed: widget.switchScientificName,
                icon: !orderByName
                    ? Icon(orderAsc
                        ? Icons.text_rotate_vertical_rounded
                        : Icons.text_rotate_up_rounded)
                    : const SizedBox(),
                label: const Text('Ordenar por nombre científico'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    !orderByName ? mainColor : opaqueColor,
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    !orderByName ? opaqueColor : mainColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton.icon(
                  onPressed: widget.switchName,
                  icon: orderByName
                      ? Icon(orderAsc
                          ? Icons.text_rotate_vertical_rounded
                          : Icons.text_rotate_up_rounded)
                      : const SizedBox(),
                  label: const Text('Ordenar por nombre común'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      orderByName ? mainColor : opaqueColor,
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      orderByName ? opaqueColor : mainColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
