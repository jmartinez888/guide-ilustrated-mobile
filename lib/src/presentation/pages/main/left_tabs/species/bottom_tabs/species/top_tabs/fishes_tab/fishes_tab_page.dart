import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/sections/specie_tab/species_tab_section.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/fishes_tab/controller/fishes_tab_controller.dart';

class FishesTabPage extends StatefulWidget {
  const FishesTabPage({super.key});
  @override
  State<FishesTabPage> createState() => _FishesTabPageState();
}

class _FishesTabPageState extends State<FishesTabPage> {
  FishesTabController get controllerRead => context.read();

  @override
  Widget build(BuildContext context) {
    final FishesTabController controllerWatch = context.watch();
    final state = controllerWatch.state;

    return SpeciesTabSection(
      type: 5,
      state: state,
      pagingController: controllerWatch.pagingController,
      onRefresh: () =>
          Future.sync(() => controllerRead.pagingController.refresh()),
      retryLastFailedRequest:
          controllerWatch.pagingController.retryLastFailedRequest,
      switchName: controllerRead.orderByName,
      switchScientificName: controllerRead.orderByScientificName,
    );
  }
}
