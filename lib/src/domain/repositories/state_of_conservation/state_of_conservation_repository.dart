import 'package:species/src/domain/entities/state_of_conservation/state_of_conservation.dart';

abstract class StateOfConservationRepository {
  Future<List<StateOfConservation>> getStateOfConservations();
}
