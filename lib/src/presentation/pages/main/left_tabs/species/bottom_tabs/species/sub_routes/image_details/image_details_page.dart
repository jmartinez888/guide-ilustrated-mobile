import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/sections/image_details_section.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/species_details/controller/species_details_controller.dart';

class ImageDetailsPage extends StatefulWidget {
  final String id;

  const ImageDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ImageDetailsPage> createState() => _ImageDetailsPageState();
}

class _ImageDetailsPageState extends State<ImageDetailsPage> {
  SpeciesDetailsController get controllerRead => context.read();

  @override
  void initState() {
    controllerRead.getSpecieById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SpeciesDetailsController controllerWatch = context.watch();
    final state = controllerWatch.state;
    return Scaffold(
      body: SafeArea(
        child: state.loading
            ? const Center(child: CircularProgressIndicator())
            : state.mapOfId[widget.id] == null
                ? Center(
                    child: FilledButton(
                      onPressed: () {
                        controllerRead.getSpecieById(widget.id);
                      },
                      child: const Text('Inténtalo de nuevo'),
                    ),
                  )
                : ImageDetailsSection(
                    specie: state.mapOfId[widget.id]!,
                  ),
      ),
    );
  }
}
