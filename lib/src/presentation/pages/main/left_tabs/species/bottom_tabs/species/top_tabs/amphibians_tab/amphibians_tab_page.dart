import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/sections/specie_tab/species_tab_section.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/amphibians_tab/controller/amphibians_tab_controller.dart';

class AmphibiansTabPage extends StatefulWidget {
  const AmphibiansTabPage({super.key});
  @override
  State<AmphibiansTabPage> createState() => _AmphibiansTabPageState();
}

class _AmphibiansTabPageState extends State<AmphibiansTabPage> {
  AmphibiansTabController get controllerRead => context.read();

  @override
  Widget build(BuildContext context) {
    final AmphibiansTabController controllerWatch = context.watch();
    final state = controllerWatch.state;

    return SpeciesTabSection(
      type: 4,
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
