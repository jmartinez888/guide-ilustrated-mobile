// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserCImpl _$$UserCImplFromJson(Map<String, dynamic> json) => _$UserCImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$$UserCImplToJson(_$UserCImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'created': instance.created?.toIso8601String(),
      'profilePicture': instance.profilePicture,
    };
