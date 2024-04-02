import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/sections/specie_tab/species_tab_section.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/mammals_tab/controller/mammals_tab_controller.dart';

class MammalsTabPage extends StatefulWidget {
  const MammalsTabPage({super.key});
  @override
  State<MammalsTabPage> createState() => _MammalsTabPageState();
}

class _MammalsTabPageState extends State<MammalsTabPage> {
  MammalsTabController get controllerRead => context.read();
  @override
  Widget build(BuildContext context) {
    final MammalsTabController controllerWatch = context.watch();
    final state = controllerWatch.state;

    return SpeciesTabSection(
      type: 2,
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
