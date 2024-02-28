// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaxonomyImpl _$$TaxonomyImplFromJson(Map<String, dynamic> json) =>
    _$TaxonomyImpl(
      kingdom: json['reino'] == null
          ? null
          : Kingdom.fromJson(json['reino'] as Map<String, dynamic>),
      phylum: json['filo'] == null
          ? null
          : Phylum.fromJson(json['filo'] as Map<String, dynamic>),
      classC: json['clase'] == null
          ? null
          : ClassC.fromJson(json['clase'] as Map<String, dynamic>),
      order: json['orden'] == null
          ? null
          : OrderC.fromJson(json['orden'] as Map<String, dynamic>),
      family: json['familia'] == null
          ? null
          : Family.fromJson(json['familia'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaxonomyImplToJson(_$TaxonomyImpl instance) =>
    <String, dynamic>{
      'reino': instance.kingdom,
      'filo': instance.phylum,
      'clase': instance.classC,
      'orden': instance.order,
      'familia': instance.family,
    };
