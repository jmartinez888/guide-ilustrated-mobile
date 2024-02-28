/* import 'package:species/src/data/services/remote/specie_api.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:species/src/presentation/global/state_notifier.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/species_details/controller/state/species_details_state.dart';

class SpeciesDetailsController extends StateNotifier<Specie2> {
  final SpecieRepository specieRepository;
  bool loading = true;
  SpeciesDetailsController(
    super.state, {
    required this.specieRepository,
  });

  Future<void> getSpecieById(String id) async {
    final result = await specieRepository.getSpecieById(id);
    if (state.id != null) return;
    result.when(
      (_) {
        loading = false;
      },
      (specie) {
        state = specie;
        loading = false;
      },
    );
  }
} */

import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:species/src/presentation/global/state_notifier.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/species_details/controller/state/species_details_state.dart';

class SpeciesDetailsController extends StateNotifier<SpeciesDetailsState> {
  final SpecieRepository specieRepository;
  SpeciesDetailsController(
    super.state, {
    required this.specieRepository,
  });

  Future<void> getSpecieById(String id) async {
    if(state.mapOfId[id] != null) return;
    state = state.copyWith(
          loading: true,
        );
    final result = await specieRepository.getSpecieById(id);
    result.when(
      (_) {
        state = state.copyWith(
          loading: false,
        );
      },
      (specie) {
        state = state.copyWith(
          loading: false,
          mapOfId: {
            ...state.mapOfId,
            id: specie,
          },
        );
      },
    );
  }

  Future<void> refreshSpecieById(String id) async {
    state = state.copyWith(
      loading: true,
      mapOfId: state.mapOfId..remove(id),
    );

    final result = await specieRepository.getSpecieById(id);
    result.when(
      (_) {
        state = state.copyWith(
          loading: false,
        );
      },
      (specie) {
        state = state.copyWith(
          loading: false,
          mapOfId: {
            ...state.mapOfId,
            id: specie,
          },
        );
      },
    );
  }
}
