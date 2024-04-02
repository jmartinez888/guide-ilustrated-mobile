// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_iiap.freezed.dart';
part 'class_iiap.g.dart';

@freezed
class ClassIiap with _$ClassIiap {

  factory ClassIiap({
    @JsonKey(name: 'id_clase') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'id_filo') int? idPhylum,
    @JsonKey(name: 'ch_estado') String? state,
  }) = _ClassIiap;

  factory ClassIiap.fromJson(Map<String, dynamic> json) => _$ClassIiapFromJson(json);
}