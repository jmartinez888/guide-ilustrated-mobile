// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conservation_states.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConservationStatesImpl _$$ConservationStatesImplFromJson(
        Map<String, dynamic> json) =>
    _$ConservationStatesImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      description: json['description'] as String?,
      initState: json['init_state'] as String?,
      institution: json['institution'] as String?,
      image: json['image'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$ConservationStatesImplToJson(
        _$ConservationStatesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'init_state': instance.initState,
      'institution': instance.institution,
      'image': instance.image,
      'state': instance.state,
    };
