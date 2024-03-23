// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'taxonomy_for_search_iiap.freezed.dart';
part 'taxonomy_for_search_iiap.g.dart';

@freezed
class TaxonomyForSearchIiap with _$TaxonomyForSearchIiap {
  factory TaxonomyForSearchIiap({
    @JsonKey(name: 'id_taxonomia') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'vc_imagen') String? image,
    @JsonKey(name: 'ch_estado') String? state,
  }) = _TaxonomyForSearchIiap;

  factory TaxonomyForSearchIiap.fromJson(Map<String, dynamic> json) =>
      _$TaxonomyForSearchIiapFromJson(json);
}
