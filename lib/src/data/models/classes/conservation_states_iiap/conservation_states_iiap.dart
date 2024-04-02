// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'conservation_states_iiap.freezed.dart';
part 'conservation_states_iiap.g.dart';

@freezed
class ConservationStatesIiap with _$ConservationStatesIiap {
  factory ConservationStatesIiap({
    @JsonKey(
      name: 'id_estado',
      readValue: readIdValue,
    )
    required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'te_descripcion') String? description,
    @JsonKey(
      name: 'iniciales_estado',
      readValue: readInitStateValue,
    )
    String? initState,
    @JsonKey(
      name: 'institucion',
      readValue: readInstitutionValue,
    )
    String? institution,
    @JsonKey(
      name: 'imagen_estado',
      readValue: readImageValue,
    )
    String? image,
    @JsonKey(
      name: 'estado',
      readValue: readStateValue,
    )
    String? state,
  }) = _ConservationStatesIiap;

  factory ConservationStatesIiap.fromJson(Map<String, dynamic> json) =>
      _$ConservationStatesIiapFromJson(json);
}

Object? readIdValue(Map map, String _) {
  return map['id_estado'] ?? map['id_est_conservacion'];
}

Object? readInitStateValue(Map map, String _) {
  return map['iniciales_estado'] ?? map['vc_iniciales'];
}

Object? readInstitutionValue(Map map, String _) {
  return map['institucion'] ?? map['vc_institucion'];
}

Object? readImageValue(Map map, String _) {
  return map['imagen_estado'] ?? map['vc_imagen_estado'];
}

Object? readStateValue(Map map, String _) {
  return map['estado'] ?? map['ch_estado'];
}
