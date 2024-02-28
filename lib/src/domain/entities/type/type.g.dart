// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TypeCImpl _$$TypeCImplFromJson(Map<String, dynamic> json) => _$TypeCImpl(
      id: json['id_taxa'] as int,
      name: json['vc_nombre'] as String?,
      primaryColor: json['vc_color_primario'] as String?,
      secondaryColor: json['vc_color_secundario'] as String?,
      image: json['vc_imagen'] as String?,
      state: json['estado'] as String?,
    );

Map<String, dynamic> _$$TypeCImplToJson(_$TypeCImpl instance) =>
    <String, dynamic>{
      'id_taxa': instance.id,
      'vc_nombre': instance.name,
      'vc_color_primario': instance.primaryColor,
      'vc_color_secundario': instance.secondaryColor,
      'vc_imagen': instance.image,
      'estado': instance.state,
    };
