// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassCImpl _$$ClassCImplFromJson(Map<String, dynamic> json) => _$ClassCImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      idPhylum: (json['id_phylum'] as num?)?.toInt(),
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$ClassCImplToJson(_$ClassCImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'id_phylum': instance.idPhylum,
      'state': instance.state,
    };
