// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TypeCImpl _$$TypeCImplFromJson(Map<String, dynamic> json) => _$TypeCImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      primaryColor: json['primary_color'] as String?,
      secondaryColor: json['secondary_color'] as String?,
      image: json['image'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$TypeCImplToJson(_$TypeCImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'primary_color': instance.primaryColor,
      'secondary_color': instance.secondaryColor,
      'image': instance.image,
      'state': instance.state,
    };
