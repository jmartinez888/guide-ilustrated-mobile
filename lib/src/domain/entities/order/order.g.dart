// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderCImpl _$$OrderCImplFromJson(Map<String, dynamic> json) => _$OrderCImpl(
      id: json['id_orden'] as int,
      name: json['vc_nombre'] as String?,
      classId: json['id_clase'] as int?,
      state: json['ch_estado'] as String?,
    );

Map<String, dynamic> _$$OrderCImplToJson(_$OrderCImpl instance) =>
    <String, dynamic>{
      'id_orden': instance.id,
      'vc_nombre': instance.name,
      'id_clase': instance.classId,
      'ch_estado': instance.state,
    };
