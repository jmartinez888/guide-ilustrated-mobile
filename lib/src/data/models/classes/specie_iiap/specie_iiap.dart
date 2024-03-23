// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/author_iiap/author_iiap.dart';
import 'package:species/src/data/models/classes/conservation_states_iiap/conservation_states_iiap.dart';
import 'package:species/src/data/models/classes/taxonomy_iiap/taxonomy_iiap.dart';
import 'package:species/src/data/models/classes/type_iiap/type_iiap.dart';
import 'package:species/src/presentation/global/utils/serializers/for_api/authors_iiap_map_into_class.dart';
import 'package:species/src/presentation/global/utils/serializers/for_api/conservations_states_iiap_map_into_class.dart';
import 'package:species/src/presentation/global/utils/serializers/for_api/taxonomy_iiap_map_into_class.dart';
import 'package:species/src/presentation/global/utils/serializers/for_api/type_iiap_map_into_class.dart';

part 'specie_iiap.freezed.dart';
part 'specie_iiap.g.dart';

@freezed
class SpecieIiap with _$SpecieIiap {
  factory SpecieIiap({
    @JsonKey(name: 'id_especie') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'vc_nombre_cientifico') String? scientificName,
    @JsonKey(name: 'vc_nombre_ingles') String? englishName,
    @JsonKey(name: 'vc_ano') String? year,
    @JsonKey(name: 'id_familia') int? idFamily,
    @JsonKey(name: 'vc_imagen') String? image,
   @JsonKey(name: 'taxa')
    @TypeIiapMapIntoClass() @Default(null)
     TypeIiap? type,
    @JsonKey(name: 'vc_sonido') String? sound,
    @JsonKey(name: 'te_descripcion') String? description,
    @ConservationsStatesIiapMapIntoClass()
    @JsonKey(name: 'estados_conservacion')
    List<ConservationStatesIiap>? conservationStates,
    @JsonKey(name: 'autores') @AuthorsIiapmapIntoClass() @Default(null) List<AuthorIiap>? authors,
    @JsonKey(name: 'taxonomia') @TaxonomyIiapMapIntoClass() @Default(null) TaxonomyIiap? taxonomy,
    @JsonKey(name: 'ch_estado') String? state,
  }) = _SpecieIiap;

  factory SpecieIiap.fromJson(Map<String, dynamic> json) => _$SpecieIiapFromJson(json);
}

List<SpecieIiap> getSpecieIiapList(List list) {
  return list.map((e) => SpecieIiap.fromJson(e)).toList();
}

