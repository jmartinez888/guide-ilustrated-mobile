// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecieImpl _$$SpecieImplFromJson(Map<String, dynamic> json) => _$SpecieImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      scientificName: json['scientific_name'] as String?,
      englishName: json['english_name'] as String?,
      year: json['year'] as String?,
      idFamily: json['id_family'] as int?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      type: json['type'] == null
          ? null
          : const TypeMapIntoClass().fromJson(json['type']),
      sound: json['sound'] as String?,
      description: json['description'] as String?,
      conservationStates:
          _$JsonConverterFromJson<List<dynamic>, List<ConservationStates>>(
              json['conservation_states'],
              const ConservationsStatesMapIntoClass().fromJson),
      authors: _$JsonConverterFromJson<List<dynamic>, List<Author>>(
              json['authors'], const AuthorsIntoClassToMap().fromJson) ??
          null,
      kingdom: json['kingdom'] == null
          ? null
          : const KingdomMapIntoClass().fromJson(json['kingdom']),
      phylum: json['phylum'] == null
          ? null
          : const PhylumMapIntoClass().fromJson(json['phylum']),
      classC: json['class'] == null
          ? null
          : const ClassMapIntoClass().fromJson(json['class']),
      order: json['order'] == null
          ? null
          : const OrderMapIntoClass().fromJson(json['order']),
      family: json['family'] == null
          ? null
          : const FamilyMapIntoClass().fromJson(json['family']),
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$SpecieImplToJson(_$SpecieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'scientific_name': instance.scientificName,
      'english_name': instance.englishName,
      'year': instance.year,
      'id_family': instance.idFamily,
      'images': instance.images,
      'type': _$JsonConverterToJson<dynamic, TypeC>(
          instance.type, const TypeMapIntoClass().toJson),
      'sound': instance.sound,
      'description': instance.description,
      'conservation_states':
          _$JsonConverterToJson<List<dynamic>, List<ConservationStates>>(
              instance.conservationStates,
              const ConservationsStatesMapIntoClass().toJson),
      'authors': _$JsonConverterToJson<List<dynamic>, List<Author>>(
          instance.authors, const AuthorsIntoClassToMap().toJson),
      'kingdom': _$JsonConverterToJson<dynamic, Kingdom>(
          instance.kingdom, const KingdomMapIntoClass().toJson),
      'phylum': _$JsonConverterToJson<dynamic, Phylum>(
          instance.phylum, const PhylumMapIntoClass().toJson),
      'class': _$JsonConverterToJson<dynamic, ClassC>(
          instance.classC, const ClassMapIntoClass().toJson),
      'order': _$JsonConverterToJson<dynamic, OrderC>(
          instance.order, const OrderMapIntoClass().toJson),
      'family': _$JsonConverterToJson<dynamic, Family>(
          instance.family, const FamilyMapIntoClass().toJson),
      'state': instance.state,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
