// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class OrderC with _$OrderC {
  factory OrderC({
    required int id,
    String? name,
    @JsonKey(name: 'id_class') int? idClass,
    String? state,
  }) = _OrderC;

  factory OrderC.fromJson(Map<String, dynamic> json) => _$OrderCFromJson(json);
}
