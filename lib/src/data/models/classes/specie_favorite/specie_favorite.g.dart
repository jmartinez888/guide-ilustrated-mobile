// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie_favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecieFavoriteImpl _$$SpecieFavoriteImplFromJson(Map<String, dynamic> json) =>
    _$SpecieFavoriteImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      scientificName: json['scientificName'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      class_: json['class_'] as String?,
      family: json['family'] as String?,
      kingdom: json['kingdom'] as String?,
      order: json['order'] as String?,
      phylum: json['phylum'] as String?,
      sound: json['sound'] as String?,
      type: json['type'] as String?,
      year: json['year'] as String?,
      vcImagenesEstado: (json['vc_imagenes_estado'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$SpecieFavoriteImplToJson(
        _$SpecieFavoriteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'scientificName': instance.scientificName,
      'description': instance.description,
      'images': instance.images,
      'authors': instance.authors,
      'class_': instance.class_,
      'family': instance.family,
      'kingdom': instance.kingdom,
      'order': instance.order,
      'phylum': instance.phylum,
      'sound': instance.sound,
      'type': instance.type,
      'year': instance.year,
      'vc_imagenes_estado': instance.vcImagenesEstado,
    };
