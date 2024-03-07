// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityImpl _$$CommunityImplFromJson(Map<String, dynamic> json) =>
    _$CommunityImpl(
      id: json['id_pueblo_indigena'] as int,
      name: json['vc_nombre'] as String?,
      description: json['te_descripcion'] as String?,
      longitude: (json['de_longitud'] as num?)?.toDouble(),
      latitude: (json['de_latitud'] as num?)?.toDouble(),
      image: json['vc_image'] as String?,
      state: json['ch_estado'] as String?,
    );

Map<String, dynamic> _$$CommunityImplToJson(_$CommunityImpl instance) =>
    <String, dynamic>{
      'id_pueblo_indigena': instance.id,
      'vc_nombre': instance.name,
      'te_descripcion': instance.description,
      'de_longitud': instance.longitude,
      'de_latitud': instance.latitude,
      'vc_image': instance.image,
      'ch_estado': instance.state,
    };
