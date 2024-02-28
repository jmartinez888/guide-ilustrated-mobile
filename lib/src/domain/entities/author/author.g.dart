// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorImpl _$$AuthorImplFromJson(Map<String, dynamic> json) => _$AuthorImpl(
      id: json['id_autor'] as int,
      name: json['vc_nombre'] as String?,
      yearOfBirth: json['ano_nacimiento_autor'] as String?,
      yearofDeath: json['ano_deceso_autor'] as String?,
      biography: json['biografia_autor'] as String?,
      profession: json['profesion_autor'] as String?,
      image: json['imagen_autor'] as String?,
      state: json['estado_autor'] as String?,
    );

Map<String, dynamic> _$$AuthorImplToJson(_$AuthorImpl instance) =>
    <String, dynamic>{
      'id_autor': instance.id,
      'vc_nombre': instance.name,
      'ano_nacimiento_autor': instance.yearOfBirth,
      'ano_deceso_autor': instance.yearofDeath,
      'biografia_autor': instance.biography,
      'profesion_autor': instance.profession,
      'imagen_autor': instance.image,
      'estado_autor': instance.state,
    };
