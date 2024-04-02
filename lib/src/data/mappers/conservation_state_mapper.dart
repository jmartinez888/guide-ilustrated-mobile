import 'package:species/src/data/models/classes/conservation_states_iiap/conservation_states_iiap.dart';
import 'package:species/src/domain/entities/conservation_states/conservation_states.dart';

class ConservationStateMapper {
  ConservationStates conservationStateIiapToConservationState(
      ConservationStatesIiap conservationStates) {
    return ConservationStates(
      id: conservationStates.id,
      name: conservationStates.name,
      description: conservationStates.description,
      initState: conservationStates.initState,
      institution: conservationStates.institution,
      image: conservationStates.image,
      state: conservationStates.state,
    );
  }
}
