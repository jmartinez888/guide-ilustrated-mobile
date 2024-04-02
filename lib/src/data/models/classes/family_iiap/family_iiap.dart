// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_iiap.freezed.dart';
part 'family_iiap.g.dart';

@freezed
class FamilyIiap with _$FamilyIiap {

  factory FamilyIiap({
    @JsonKey(name: 'id_familia') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'id_orden') int? idOrder,
    @JsonKey(name: 'ch_estado') String? state,
  }) = _FamilyIiap;

  factory FamilyIiap.fromJson(Map<String, dynamic> json) => _$FamilyIiapFromJson(json);
}