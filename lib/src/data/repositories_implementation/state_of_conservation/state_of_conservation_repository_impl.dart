import 'package:species/src/data/services/remote/conservation_states_api.dart';
import 'package:species/src/domain/entities/conservation_states/conservation_states.dart';
import 'package:species/src/domain/repositories/conservation_states/conservation_states_repository.dart';

class ConservationStatesRepositoryImpl implements ConservationStatesRepository {
  final ConservationStatesApi _conservationStatesApi;

  ConservationStatesRepositoryImpl({required ConservationStatesApi conservationStatesApi}) : _conservationStatesApi = conservationStatesApi;

  @override
  Future<List<ConservationStates>> getStateOfConservations() {
    return _conservationStatesApi.getConservationStatus();
  }
  
}