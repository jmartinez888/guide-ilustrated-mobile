// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'family.freezed.dart';
part 'family.g.dart';

@freezed
class Family with _$Family {

  factory Family({
    @JsonKey(name: 'id_familia') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'id_orden') int? orderId,
    @JsonKey(name: 'ch_estado') String? state,
  }) = _Family;

  factory Family.fromJson(Map<String, dynamic> json) => _$FamilyFromJson(json);
}