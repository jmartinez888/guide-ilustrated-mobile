import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/sections/specie_tab/species_tab_section.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/birds_tab/controller/birds_tab_controller.dart';

class BirdsTabPage extends StatefulWidget {
  const BirdsTabPage({super.key});
  @override
  State<BirdsTabPage> createState() => _BirdsTabPageState();
}

class _BirdsTabPageState extends State<BirdsTabPage> {
  BirdsTabController get controllerRead => context.read();

  @override
  Widget build(BuildContext context) {
    final BirdsTabController controllerWatch = context.watch();
    final state = controllerWatch.state;

    return SpeciesTabSection(
      type: 1,
      state: state,
      pagingController: controllerRead.pagingController,
      onRefresh: () =>
          Future.sync(() => controllerRead.pagingController.refresh()),
      retryLastFailedRequest:
          controllerRead.pagingController.retryLastFailedRequest,
      switchName: controllerRead.orderByName,
      switchScientificName: controllerRead.orderByScientificName,
    );
  }
}
