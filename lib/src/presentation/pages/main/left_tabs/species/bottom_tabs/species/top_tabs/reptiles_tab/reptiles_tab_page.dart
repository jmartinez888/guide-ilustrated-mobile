import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/sections/specie_tab/species_tab_section.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/reptiles_tab/controller/reptiles_tab_controller.dart';

class ReptilesTabPage extends StatefulWidget {
  const ReptilesTabPage({super.key});
  @override
  State<ReptilesTabPage> createState() => _ReptilesTabPageState();
}

class _ReptilesTabPageState extends State<ReptilesTabPage> {
  ReptilesTabController get controllerRead => context.read();

  @override
  Widget build(BuildContext context) {
    final ReptilesTabController controllerWatch = context.watch();
    final state = controllerWatch.state;

    return SpeciesTabSection(
      type: 3,
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
