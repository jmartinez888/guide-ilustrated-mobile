// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_iiap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaxonomyIiapImpl _$$TaxonomyIiapImplFromJson(Map<String, dynamic> json) =>
    _$TaxonomyIiapImpl(
      kingdom: json['reino'] == null
          ? null
          : const KingdomIiapMapIntoClass().fromJson(json['reino']),
      phylum: json['filo'] == null
          ? null
          : const PhylumIiapMapIntoClass().fromJson(json['filo']),
      classC: json['clase'] == null
          ? null
          : const ClassIiapMapIntoClass().fromJson(json['clase']),
      order: json['orden'] == null
          ? null
          : const OrderIiapMapIntoClass().fromJson(json['orden']),
      family: json['familia'] == null
          ? null
          : const FamilyIiapMapIntoClass().fromJson(json['familia']),
    );

Map<String, dynamic> _$$TaxonomyIiapImplToJson(_$TaxonomyIiapImpl instance) =>
    <String, dynamic>{
      'reino': _$JsonConverterToJson<dynamic, KingdomIiap>(
          instance.kingdom, const KingdomIiapMapIntoClass().toJson),
      'filo': _$JsonConverterToJson<dynamic, PhylumIiap>(
          instance.phylum, const PhylumIiapMapIntoClass().toJson),
      'clase': _$JsonConverterToJson<dynamic, ClassIiap>(
          instance.classC, const ClassIiapMapIntoClass().toJson),
      'orden': _$JsonConverterToJson<dynamic, OrderIiap>(
          instance.order, const OrderIiapMapIntoClass().toJson),
      'familia': _$JsonConverterToJson<dynamic, FamilyIiap>(
          instance.family, const FamilyIiapMapIntoClass().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
