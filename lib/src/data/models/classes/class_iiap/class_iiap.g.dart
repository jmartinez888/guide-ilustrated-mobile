// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_iiap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassIiapImpl _$$ClassIiapImplFromJson(Map<String, dynamic> json) =>
    _$ClassIiapImpl(
      id: json['id_clase'] as int,
      name: json['vc_nombre'] as String?,
      idPhylum: json['id_filo'] as int?,
      state: json['ch_estado'] as String?,
    );

Map<String, dynamic> _$$ClassIiapImplToJson(_$ClassIiapImpl instance) =>
    <String, dynamic>{
      'id_clase': instance.id,
      'vc_nombre': instance.name,
      'id_filo': instance.idPhylum,
      'ch_estado': instance.state,
    };
