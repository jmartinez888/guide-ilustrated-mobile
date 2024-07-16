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
          : const TimestampSerializer().fromJson(json['created']),
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$$UserCImplToJson(_$UserCImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'created': _$JsonConverterToJson<dynamic, DateTime>(
          instance.created, const TimestampSerializer().toJson),
      'profilePicture': instance.profilePicture,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
