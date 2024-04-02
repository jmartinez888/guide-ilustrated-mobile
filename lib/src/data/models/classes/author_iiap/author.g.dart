// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorImpl _$$AuthorImplFromJson(Map<String, dynamic> json) => _$AuthorImpl(
      id: json['id_autor'] as int,
      name: json['vc_nombre'] as String?,
      lastname: json['vc_apellido'] as String?,
      biography: readBiographyValue(json, 'biografia_autor') as String?,
      yearOfBirth: readYearOfBirth(json, 'ano_nacimiento_autor') as String?,
      yearofDeath: readYearOfDeath(json, 'ano_deceso_autor') as String?,
      profession: readProfession(json, 'profesion_autor') as String?,
      image: readImage(json, 'imagen_autor') as String?,
      state: readState(json, 'estado_autor') as String?,
      species: (json['species'] as List<dynamic>?)
              ?.map((e) => Specie.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
    );

Map<String, dynamic> _$$AuthorImplToJson(_$AuthorImpl instance) =>
    <String, dynamic>{
      'id_autor': instance.id,
      'vc_nombre': instance.name,
      'vc_apellido': instance.lastname,
      'biografia_autor': instance.biography,
      'ano_nacimiento_autor': instance.yearOfBirth,
      'ano_deceso_autor': instance.yearofDeath,
      'profesion_autor': instance.profession,
      'imagen_autor': instance.image,
      'estado_autor': instance.state,
      'species': instance.species,
    };
