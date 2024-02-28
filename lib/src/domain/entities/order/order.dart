// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class OrderC with _$OrderC {

  factory OrderC({
    @JsonKey(name: 'id_orden') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'id_clase') int? classId,
    @JsonKey(name: 'ch_estado') String? state,
  }) = _OrderC;

  factory OrderC.fromJson(Map<String, dynamic> json) => _$OrderCFromJson(json);
}