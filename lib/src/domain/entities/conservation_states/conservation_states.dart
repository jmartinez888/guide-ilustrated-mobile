// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'conservation_states.freezed.dart';
part 'conservation_states.g.dart';

@freezed
class ConservationStates with _$ConservationStates {
  factory ConservationStates({
    required int id,
    String? name,
    String? description,
    @JsonKey(name: 'init_state') String? initState,
    String? institution,
    String? image,
    String? state,
  }) = _ConservationStates;

  factory ConservationStates.fromJson(Map<String, dynamic> json) =>
      _$ConservationStatesFromJson(json);
}
