// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassCImpl _$$ClassCImplFromJson(Map<String, dynamic> json) => _$ClassCImpl(
      id: json['id_clase'] as int,
      name: json['vc_nombre'] as String?,
      phylumId: json['id_filo'] as int?,
      state: json['ch_estado'] as String?,
    );

Map<String, dynamic> _$$ClassCImplToJson(_$ClassCImpl instance) =>
    <String, dynamic>{
      'id_clase': instance.id,
      'vc_nombre': instance.name,
      'id_filo': instance.phylumId,
      'ch_estado': instance.state,
    };
