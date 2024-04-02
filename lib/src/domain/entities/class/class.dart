// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'class.freezed.dart';
part 'class.g.dart';

@freezed
class ClassC with _$ClassC {
  factory ClassC({
    required int id,
    String? name,
    @JsonKey(name: 'id_phylum') int? idPhylum,
    String? state,
  }) = _ClassC;

  factory ClassC.fromJson(Map<String, dynamic> json) => _$ClassCFromJson(json);
}
