// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'type.freezed.dart';
part 'type.g.dart';

@freezed
class TypeC with _$TypeC {

  factory TypeC({
    @JsonKey(name: 'id_taxa') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'vc_color_primario') String? primaryColor,
    @JsonKey(name: 'vc_color_secundario') String? secondaryColor,
    @JsonKey(name: 'vc_imagen') String? image,
    @JsonKey(name: 'estado') String? state,
  }) = _TypeC;

  factory TypeC.fromJson(Map<String, dynamic> json) => _$TypeCFromJson(json);
}