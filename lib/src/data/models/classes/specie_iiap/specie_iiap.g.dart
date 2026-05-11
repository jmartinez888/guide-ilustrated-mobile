// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie_iiap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecieIiapImpl _$$SpecieIiapImplFromJson(Map<String, dynamic> json) =>
    _$SpecieIiapImpl(
      id: (json['id_especie'] as num).toInt(),
      name: json['vc_nombre'] as String?,
      scientificName: json['vc_nombre_cientifico'] as String?,
      englishName: json['vc_nombre_ingles'] as String?,
      year: json['vc_ano'] as String?,
      idFamily: (json['id_familia'] as num?)?.toInt(),
      image: json['vc_imagen'] as String?,
      type: json['taxa'] == null
          ? null
          : const TypeIiapMapIntoClass().fromJson(json['taxa']),
      sound: json['vc_sonido'] as String?,
      description: json['te_descripcion'] as String?,
      conservationStates:
          _$JsonConverterFromJson<List<dynamic>, List<ConservationStatesIiap>>(
              json['estados_conservacion'],
              const ConservationsStatesIiapMapIntoClass().fromJson),
      authors: _$JsonConverterFromJson<List<dynamic>, List<AuthorIiap>>(
              json['autores'], const AuthorsIiapmapIntoClass().fromJson) ??
          null,
      taxonomy: json['taxonomia'] == null
          ? null
          : const TaxonomyIiapMapIntoClass().fromJson(json['taxonomia']),
      state: json['ch_estado'] as String?,
    );

Map<String, dynamic> _$$SpecieIiapImplToJson(_$SpecieIiapImpl instance) =>
    <String, dynamic>{
      'id_especie': instance.id,
      'vc_nombre': instance.name,
      'vc_nombre_cientifico': instance.scientificName,
      'vc_nombre_ingles': instance.englishName,
      'vc_ano': instance.year,
      'id_familia': instance.idFamily,
      'vc_imagen': instance.image,
      'taxa': _$JsonConverterToJson<dynamic, TypeIiap>(
          instance.type, const TypeIiapMapIntoClass().toJson),
      'vc_sonido': instance.sound,
      'te_descripcion': instance.description,
      'estados_conservacion':
          _$JsonConverterToJson<List<dynamic>, List<ConservationStatesIiap>>(
              instance.conservationStates,
              const ConservationsStatesIiapMapIntoClass().toJson),
      'autores': _$JsonConverterToJson<List<dynamic>, List<AuthorIiap>>(
          instance.authors, const AuthorsIiapmapIntoClass().toJson),
      'taxonomia': _$JsonConverterToJson<dynamic, TaxonomyIiap>(
          instance.taxonomy, const TaxonomyIiapMapIntoClass().toJson),
      'ch_estado': instance.state,
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
