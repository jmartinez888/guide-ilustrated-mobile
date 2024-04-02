// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'phylum_iiap.freezed.dart';
part 'phylum_iiap.g.dart';

@freezed
class PhylumIiap with _$PhylumIiap {

  factory PhylumIiap({
    @JsonKey(name: 'id_filo') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
  }) = _PhylumIiap;

  factory PhylumIiap.fromJson(Map<String, dynamic> json) => _$PhylumIiapFromJson(json);
}