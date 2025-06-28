// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorImpl _$$AuthorImplFromJson(Map<String, dynamic> json) => _$AuthorImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      lastname: json['lastname'] as String?,
      biography: json['biography'] as String?,
      yearOfBirth: json['year_of_birth'] as String?,
      yearOfDeath: json['year_of_death'] as String?,
      profession: json['profession'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      state: json['state'] as String?,
      species: _$JsonConverterFromJson<List<dynamic>, List<Specie>>(
              json['species'], const SpeciesIntoClassToMap().fromJson) ??
          null,
      search: (json['search'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AuthorImplToJson(_$AuthorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastname': instance.lastname,
      'biography': instance.biography,
      'year_of_birth': instance.yearOfBirth,
      'year_of_death': instance.yearOfDeath,
      'profession': instance.profession,
      'images': instance.images,
      'state': instance.state,
      'species': _$JsonConverterToJson<List<dynamic>, List<Specie>>(
          instance.species, const SpeciesIntoClassToMap().toJson),
      'search': instance.search,
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
