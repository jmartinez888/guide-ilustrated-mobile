// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'type.freezed.dart';
part 'type.g.dart';

@freezed
class TypeC with _$TypeC {
  factory TypeC({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'primary_color') String? primaryColor,
    @JsonKey(name: 'secondary_color') String? secondaryColor,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'state') String? state,
  }) = _TypeC;

  factory TypeC.fromJson(Map<String, dynamic> json) => _$TypeCFromJson(json);
}
