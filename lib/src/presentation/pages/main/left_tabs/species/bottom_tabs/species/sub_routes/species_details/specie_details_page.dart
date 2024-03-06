import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/sections/species_details_section.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/species_details/controller/species_details_controller.dart';

class SpecieDetailsPage extends StatefulWidget {
  final String id;

  const SpecieDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<SpecieDetailsPage> createState() => _SpecieDetailsPageState();
}

class _SpecieDetailsPageState extends State<SpecieDetailsPage> {
  SpeciesDetailsController get controllerRead => context.read();

  @override
  void initState() {
    controllerRead.getSpecie(widget.id);
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    final SpeciesDetailsController controllerWatch = context.watch();
    final state = controllerWatch.state;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          state.loading
              ? const Center(child: CircularProgressIndicator())
              : state.mapOfId[widget.id] == null
                  ? Center(
                      child: FilledButton(
                        onPressed: () {
                          controllerRead.getSpecie(widget.id);
                        },
                        child: const Text('Inténtalo de nuevo'),
                      ),
                    )
                  : SpecieDetailsSection(
                      specie: state.mapOfId[widget.id]!,
                    ),
          const Positioned(
            top: 8.0,
            left: 48.0,
            child: SafeArea(
              child: CustomBackButton(),
            ),
          ),
        ],
      ),
    ));
  }
}
