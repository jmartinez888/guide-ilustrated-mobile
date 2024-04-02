import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:species/src/presentation/global/state_notifier.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/species_details/controller/state/species_details_state.dart';

class SpeciesDetailsController extends StateNotifier<SpeciesDetailsState> {
  final SpecieRepository specieRepository;
  SpeciesDetailsController(
    super.state, {
    required this.specieRepository,
  });

  Future<void> getSpecie(String id) async {
    if(state.mapOfId[id] != null) return;
    state = state.copyWith(
          loading: true,
        );
    final result = await specieRepository.getSpecie(id);
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

  Future<void> refreshSpecie(String id) async {
    state = state.copyWith(
      loading: true,
      mapOfId: state.mapOfId..remove(id),
    );

    final result = await specieRepository.getSpecie(id);
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
