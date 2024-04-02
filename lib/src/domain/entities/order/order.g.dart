// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderCImpl _$$OrderCImplFromJson(Map<String, dynamic> json) => _$OrderCImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      idClass: json['id_class'] as int?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$OrderCImplToJson(_$OrderCImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'id_class': instance.idClass,
      'state': instance.state,
    };
