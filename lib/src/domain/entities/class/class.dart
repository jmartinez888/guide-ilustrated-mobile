// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'class.freezed.dart';
part 'class.g.dart';

@freezed
class ClassC with _$ClassC {

  factory ClassC({
    @JsonKey(name: 'id_clase') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'id_filo') int? phylumId,
    @JsonKey(name: 'ch_estado') String? state,
  
  }) = _ClassC;

  factory ClassC.fromJson(Map<String, dynamic> json) => _$ClassCFromJson(json);
}