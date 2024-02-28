import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/sections/specie_tab/species_tab_section.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/palms_tab/controller/palms_tab_controller.dart';

class PalmsTabPage extends StatefulWidget {
  const PalmsTabPage({super.key});
  @override
  State<PalmsTabPage> createState() => _PalmsTabPageState();
}

class _PalmsTabPageState extends State<PalmsTabPage> {
  PalmsTabController get controllerRead => context.read();

  @override
  Widget build(BuildContext context) {
    final PalmsTabController controllerWatch = context.watch();
    final state = controllerWatch.state;

    return SpeciesTabSection(
      type: 8,
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
