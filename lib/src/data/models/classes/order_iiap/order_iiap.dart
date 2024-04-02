// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_iiap.freezed.dart';
part 'order_iiap.g.dart';

@freezed
class OrderIiap with _$OrderIiap {

  factory OrderIiap({
    @JsonKey(name: 'id_orden') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'id_clase') int? idClass,
    @JsonKey(name: 'ch_estado') String? state,
  }) = _OrderIiap;

  factory OrderIiap.fromJson(Map<String, dynamic> json) => _$OrderIiapFromJson(json);
}