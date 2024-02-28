// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_for_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaxonomyForSearchImpl _$$TaxonomyForSearchImplFromJson(
        Map<String, dynamic> json) =>
    _$TaxonomyForSearchImpl(
      id: json['id_taxonomia'] as int,
      name: json['vc_nombre'] as String?,
      image: json['vc_imagen'] as String?,
      state: json['ch_estado'] as String?,
    );

Map<String, dynamic> _$$TaxonomyForSearchImplToJson(
        _$TaxonomyForSearchImpl instance) =>
    <String, dynamic>{
      'id_taxonomia': instance.id,
      'vc_nombre': instance.name,
      'vc_imagen': instance.image,
      'ch_estado': instance.state,
    };
