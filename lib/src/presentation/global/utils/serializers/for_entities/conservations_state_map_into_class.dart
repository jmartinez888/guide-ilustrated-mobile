import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/conservation_states/conservation_states.dart';

class ConservationsStatesMapIntoClass
    implements JsonConverter<List<ConservationStates>, List<dynamic>> {
  const ConservationsStatesMapIntoClass();

  @override
  List<ConservationStates> fromJson(List<dynamic> json) =>
      json.map((e) => ConservationStates.fromJson(e)).toList();

  @override
  List<dynamic> toJson(List<ConservationStates> authors) =>
      authors.map((e) => e.toJson()).toList();
}