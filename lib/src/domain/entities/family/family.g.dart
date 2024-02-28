// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FamilyImpl _$$FamilyImplFromJson(Map<String, dynamic> json) => _$FamilyImpl(
      id: json['id_familia'] as int,
      name: json['vc_nombre'] as String?,
      orderId: json['id_orden'] as int?,
      state: json['ch_estado'] as String?,
    );

Map<String, dynamic> _$$FamilyImplToJson(_$FamilyImpl instance) =>
    <String, dynamic>{
      'id_familia': instance.id,
      'vc_nombre': instance.name,
      'id_orden': instance.orderId,
      'ch_estado': instance.state,
    };
