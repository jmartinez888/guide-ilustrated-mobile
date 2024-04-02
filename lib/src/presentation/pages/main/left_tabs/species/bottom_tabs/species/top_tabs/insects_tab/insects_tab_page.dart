import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/sections/specie_tab/species_tab_section.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/insects_tab/controller/insects_tab_controller.dart';

class InsectsTabPage extends StatefulWidget {
  const InsectsTabPage({super.key});
  @override
  State<InsectsTabPage> createState() => _InsectsTabPageState();
}

class _InsectsTabPageState extends State<InsectsTabPage> {
  InsectsTabController get controllerRead => context.read();

  @override
  Widget build(BuildContext context) {
    final InsectsTabController controllerWatch = context.watch();
    final state = controllerWatch.state;

    return SpeciesTabSection(
      type: 6,
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
