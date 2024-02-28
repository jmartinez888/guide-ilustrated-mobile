import 'package:species/src/data/services/remote/state_of_conservation_api.dart';
import 'package:species/src/domain/entities/state_of_conservation/state_of_conservation.dart';
import 'package:species/src/domain/repositories/state_of_conservation/state_of_conservation_repository.dart';

class StateOfConservationRepositoryImpl implements StateOfConservationRepository {
  final StateOfConservationApi _stateOfConservationApi;

  StateOfConservationRepositoryImpl({required StateOfConservationApi stateOfConservationApi}) : _stateOfConservationApi = stateOfConservationApi;

  @override
  Future<List<StateOfConservation>> getStateOfConservations() {
    return _stateOfConservationApi.getConservationStatus();
  }
  
}