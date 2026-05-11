// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_iiap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderIiapImpl _$$OrderIiapImplFromJson(Map<String, dynamic> json) =>
    _$OrderIiapImpl(
      id: (json['id_orden'] as num).toInt(),
      name: json['vc_nombre'] as String?,
      idClass: (json['id_clase'] as num?)?.toInt(),
      state: json['ch_estado'] as String?,
    );

Map<String, dynamic> _$$OrderIiapImplToJson(_$OrderIiapImpl instance) =>
    <String, dynamic>{
      'id_orden': instance.id,
      'vc_nombre': instance.name,
      'id_clase': instance.idClass,
      'ch_estado': instance.state,
    };
