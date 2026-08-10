import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/data/services/analytics_service.dart';
import 'package:species/src/presentation/global/sections/general_loadings/specie_details_loading.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';
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
  SpeciesDetailsController get specieReadController => context.read();
  bool _analyticsLogged = false;

  @override
  void initState() {
    specieReadController.getSpecie(widget.id);
    super.initState();
  }

  void _logViewSpeciesIfNeeded(SpeciesDetailsController controller) {
    if (_analyticsLogged) return;
    final specie = controller.state.mapOfId[widget.id];
    if (specie != null) {
      _analyticsLogged = true;
      context.read<AnalyticsService>().logViewSpecies(
            speciesId: specie.id,
            speciesName: specie.name,
            speciesScientificName: specie.scientificName,
            speciesType: specie.type?.name,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final SpeciesDetailsController specieControllerWatch = context.watch();
    final specieState = specieControllerWatch.state;
    _logViewSpeciesIfNeeded(specieControllerWatch);
    return Stack(
      children: [
        Scaffold(
          body: specieState.loading
              ? const SpecieDetailsLoading()
              : specieState.mapOfId[widget.id] == null
                  ? MessageException(
                      onPressed: () =>
                          specieReadController.getSpecie(widget.id),
                      lottie: 'assets/lotties/error_data.json',
                    )
                  : SpecieDetailSection(
                      specie: specieState.mapOfId[widget.id]!),
        ),
        const Positioned(
          left: 56.0,
          top: 8.0,
          child: CustomBackButton(),
        ),
      ],
    );
  }
}
