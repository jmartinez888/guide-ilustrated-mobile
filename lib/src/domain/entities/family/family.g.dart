// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FamilyImpl _$$FamilyImplFromJson(Map<String, dynamic> json) => _$FamilyImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      idOrder: json['id_order'] as int?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$FamilyImplToJson(_$FamilyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'id_order': instance.idOrder,
      'state': instance.state,
    };
