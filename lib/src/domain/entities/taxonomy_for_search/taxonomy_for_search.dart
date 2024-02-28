// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'taxonomy_for_search.freezed.dart';
part 'taxonomy_for_search.g.dart';

@freezed
class TaxonomyForSearch with _$TaxonomyForSearch {
  factory TaxonomyForSearch({
    @JsonKey(name: 'id_taxonomia') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'vc_imagen') String? image,
    @JsonKey(name: 'ch_estado') String? state,
  }) = _TaxonomyForSearch;

  factory TaxonomyForSearch.fromJson(Map<String, dynamic> json) =>
      _$TaxonomyForSearchFromJson(json);
}
