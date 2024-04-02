// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_iiap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FamilyIiapImpl _$$FamilyIiapImplFromJson(Map<String, dynamic> json) =>
    _$FamilyIiapImpl(
      id: json['id_familia'] as int,
      name: json['vc_nombre'] as String?,
      idOrder: json['id_orden'] as int?,
      state: json['ch_estado'] as String?,
    );

Map<String, dynamic> _$$FamilyIiapImplToJson(_$FamilyIiapImpl instance) =>
    <String, dynamic>{
      'id_familia': instance.id,
      'vc_nombre': instance.name,
      'id_orden': instance.idOrder,
      'ch_estado': instance.state,
    };
