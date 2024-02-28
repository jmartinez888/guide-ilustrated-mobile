// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/author/author.dart';
import 'package:species/src/domain/entities/state_of_conservation/state_of_conservation.dart';
import 'package:species/src/domain/entities/taxonomy/taxonomy.dart';
import 'package:species/src/domain/entities/type/type.dart';

part 'specie.freezed.dart';
part 'specie.g.dart';

@freezed
class Specie with _$Specie {
  factory Specie({
    @JsonKey(name: 'id_especie') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'vc_nombre_cientifico') String? scientificName,
    @JsonKey(name: 'vc_nombre_ingles') String? englishName,
    @JsonKey(name: 'vc_ano') String? year,
    @JsonKey(name: 'id_familia') int? familyId,
    @JsonKey(name: 'vc_imagen') String? image,
    @JsonKey(name: 'taxa') TypeC? type,
    @JsonKey(name: 'vc_sonido') String? sound,
    @JsonKey(name: 'te_descripcion') String? description,
    @JsonKey(name: 'estados_conservacion')
    List<StateOfConservation>? stateOfConservations,
    @JsonKey(name: 'autores') List<Author>? authors,
    @JsonKey(name: 'taxonomia') Taxonomy? taxonomy,
  }) = _Specie;

  factory Specie.fromJson(Map<String, dynamic> json) => _$SpecieFromJson(json);
}

List<Specie> getSpecieList(List list) {
  return list.map((e) => Specie.fromJson(e)).toList();
}
