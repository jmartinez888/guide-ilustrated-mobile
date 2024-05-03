import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/conservation_states_iiap/conservation_states_iiap.dart';

class ConservationsStatesIiapMapIntoClass
    implements JsonConverter<List<ConservationStatesIiap>, List<dynamic>> {
  const ConservationsStatesIiapMapIntoClass();

  @override
  List<ConservationStatesIiap> fromJson(List<dynamic> json) =>
      json.map((e) => ConservationStatesIiap.fromJson(e)).toList();

  @override
  List<dynamic> toJson(List<ConservationStatesIiap> authors) =>
      authors.map((e) => e.toJson()).toList();
}