// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/specie_iiap/specie_iiap.dart';
import 'package:species/src/presentation/global/utils/serializers/for_api/species_iiap_map_into_class.dart';

part 'author_iiap.freezed.dart';
part 'author_iiap.g.dart';

@freezed
class AuthorIiap with _$AuthorIiap {
  factory AuthorIiap({
    @JsonKey(name: 'id_autor') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'vc_apellido') String? lastname,
    @JsonKey(
      name: 'biografia_autor',
      readValue: readBiographyValue,
    )
    String? biography,
    @JsonKey(
      name: 'ano_nacimiento_autor',
      readValue: readYearOfBirth,
    )
    String? yearOfBirth,
    @JsonKey(
      name: 'ano_deceso_autor',
      readValue: readYearOfDeath,
    )
    String? yearOfDeath,
    @JsonKey(
      name: 'profesion_autor',
      readValue: readProfession,
    )
    String? profession,
    @JsonKey(
      name: 'imagen_autor',
      readValue: readImage,
    )
    String? image,
    @JsonKey(
      name: 'estado_autor',
      readValue: readState,
    )
    String? state,
    @SpeciesIiapIntoClassToMap() @Default(null) List<SpecieIiap>? species,
  }) = _AuthorIiap;

  factory AuthorIiap.fromJson(Map<String, dynamic> json) => _$AuthorIiapFromJson(json);
}

Object? readBiographyValue(Map map, String _) {
  return map['biografia_autor'] ?? map['te_biografia'];
}

Object? readYearOfBirth(Map map, String _) {
  return map['ano_nacimiento_autor'] ?? map['vc_ano_nacimiento'];
}

Object? readYearOfDeath(Map map, String _) {
  return map['ano_deceso_autor'] ?? map['vc_ano_deceso'];
}

Object? readProfession(Map map, String _) {
  return map['profesion_autor'] ?? map['vc_profesion'];
}

Object? readImage(Map map, String _) {
  return map['imagen_autor'] ?? map['vc_imagen'];
}

Object? readState(Map map, String _) {
  return map['estado_autor'] ?? map['ch_estado'];
}


List<AuthorIiap> getAuthorIiapList(List list) {
  return list.map((e) => AuthorIiap.fromJson(e)).toList();
}