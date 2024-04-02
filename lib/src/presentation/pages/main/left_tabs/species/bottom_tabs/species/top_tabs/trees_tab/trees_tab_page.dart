import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/sections/specie_tab/species_tab_section.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/trees_tab/controller/trees_tab_controller.dart';

class TreesTabPage extends StatefulWidget {
  const TreesTabPage({super.key});
  @override
  State<TreesTabPage> createState() => _TreesTabPageState();
}

class _TreesTabPageState extends State<TreesTabPage> {
  TreesTabController get controllerRead => context.read();

  @override
  Widget build(BuildContext context) {
    final TreesTabController controllerWatch = context.watch();
    final state = controllerWatch.state;

    return SpeciesTabSection(
      type: 7,
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
