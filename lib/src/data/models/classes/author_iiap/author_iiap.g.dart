// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_iiap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorIiapImpl _$$AuthorIiapImplFromJson(Map<String, dynamic> json) =>
    _$AuthorIiapImpl(
      id: json['id_autor'] as int,
      name: json['vc_nombre'] as String?,
      lastname: json['vc_apellido'] as String?,
      biography: readBiographyValue(json, 'biografia_autor') as String?,
      yearOfBirth: readYearOfBirth(json, 'ano_nacimiento_autor') as String?,
      yearOfDeath: readYearOfDeath(json, 'ano_deceso_autor') as String?,
      profession: readProfession(json, 'profesion_autor') as String?,
      image: readImage(json, 'imagen_autor') as String?,
      state: readState(json, 'estado_autor') as String?,
      species: _$JsonConverterFromJson<List<dynamic>, List<SpecieIiap>>(
              json['species'], const SpeciesIiapIntoClassToMap().fromJson) ??
          null,
    );

Map<String, dynamic> _$$AuthorIiapImplToJson(_$AuthorIiapImpl instance) =>
    <String, dynamic>{
      'id_autor': instance.id,
      'vc_nombre': instance.name,
      'vc_apellido': instance.lastname,
      'biografia_autor': instance.biography,
      'ano_nacimiento_autor': instance.yearOfBirth,
      'ano_deceso_autor': instance.yearOfDeath,
      'profesion_autor': instance.profession,
      'imagen_autor': instance.image,
      'estado_autor': instance.state,
      'species': _$JsonConverterToJson<List<dynamic>, List<SpecieIiap>>(
          instance.species, const SpeciesIiapIntoClassToMap().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
