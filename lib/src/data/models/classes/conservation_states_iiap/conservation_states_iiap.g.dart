// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conservation_states_iiap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConservationStatesIiapImpl _$$ConservationStatesIiapImplFromJson(
        Map<String, dynamic> json) =>
    _$ConservationStatesIiapImpl(
      id: readIdValue(json, 'id_estado') as int,
      name: json['vc_nombre'] as String?,
      description: json['te_descripcion'] as String?,
      initState: readInitStateValue(json, 'iniciales_estado') as String?,
      institution: readInstitutionValue(json, 'institucion') as String?,
      image: readImageValue(json, 'imagen_estado') as String?,
      state: readStateValue(json, 'estado') as String?,
    );

Map<String, dynamic> _$$ConservationStatesIiapImplToJson(
        _$ConservationStatesIiapImpl instance) =>
    <String, dynamic>{
      'id_estado': instance.id,
      'vc_nombre': instance.name,
      'te_descripcion': instance.description,
      'iniciales_estado': instance.initState,
      'institucion': instance.institution,
      'imagen_estado': instance.image,
      'estado': instance.state,
    };
