// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kingdom_iiap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KingdomIiapImpl _$$KingdomIiapImplFromJson(Map<String, dynamic> json) =>
    _$KingdomIiapImpl(
      id: (json['id_reino'] as num).toInt(),
      name: json['vc_nombre'] as String?,
    );

Map<String, dynamic> _$$KingdomIiapImplToJson(_$KingdomIiapImpl instance) =>
    <String, dynamic>{
      'id_reino': instance.id,
      'vc_nombre': instance.name,
    };
