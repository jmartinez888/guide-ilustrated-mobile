// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecieImpl _$$SpecieImplFromJson(Map<String, dynamic> json) => _$SpecieImpl(
      id: json['id_especie'] as int,
      name: json['vc_nombre'] as String?,
      scientificName: json['vc_nombre_cientifico'] as String?,
      englishName: json['vc_nombre_ingles'] as String?,
      year: json['vc_ano'] as String?,
      familyId: json['id_familia'] as int?,
      image: json['vc_imagen'] as String?,
      type: json['taxa'] == null
          ? null
          : TypeC.fromJson(json['taxa'] as Map<String, dynamic>),
      sound: json['vc_sonido'] as String?,
      description: json['te_descripcion'] as String?,
      stateOfConservations: (json['estados_conservacion'] as List<dynamic>?)
          ?.map((e) => StateOfConservation.fromJson(e as Map<String, dynamic>))
          .toList(),
      authors: (json['autores'] as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxonomy: json['taxonomia'] == null
          ? null
          : Taxonomy.fromJson(json['taxonomia'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SpecieImplToJson(_$SpecieImpl instance) =>
    <String, dynamic>{
      'id_especie': instance.id,
      'vc_nombre': instance.name,
      'vc_nombre_cientifico': instance.scientificName,
      'vc_nombre_ingles': instance.englishName,
      'vc_ano': instance.year,
      'id_familia': instance.familyId,
      'vc_imagen': instance.image,
      'taxa': instance.type,
      'vc_sonido': instance.sound,
      'te_descripcion': instance.description,
      'estados_conservacion': instance.stateOfConservations,
      'autores': instance.authors,
      'taxonomia': instance.taxonomy,
    };
