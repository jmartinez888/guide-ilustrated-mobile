// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_for_search_iiap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaxonomyForSearchIiapImpl _$$TaxonomyForSearchIiapImplFromJson(
        Map<String, dynamic> json) =>
    _$TaxonomyForSearchIiapImpl(
      id: json['id_taxonomia'] as int,
      name: json['vc_nombre'] as String?,
      image: json['vc_imagen'] as String?,
      state: json['ch_estado'] as String?,
    );

Map<String, dynamic> _$$TaxonomyForSearchIiapImplToJson(
        _$TaxonomyForSearchIiapImpl instance) =>
    <String, dynamic>{
      'id_taxonomia': instance.id,
      'vc_nombre': instance.name,
      'vc_imagen': instance.image,
      'ch_estado': instance.state,
    };
