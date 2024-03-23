import 'package:species/src/domain/entities/conservation_states/conservation_states.dart';

abstract class ConservationStatesRepository {
  Future<List<ConservationStates>> getStateOfConservations();
}
