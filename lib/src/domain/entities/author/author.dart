import 'package:freezed_annotation/freezed_annotation.dart';

part 'author.freezed.dart';
part 'author.g.dart';

@freezed
class Author with _$Author {

  factory Author({
    @JsonKey(name: 'id_autor')
    required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'ano_nacimiento_autor') String? yearOfBirth,
    @JsonKey(name: 'ano_deceso_autor') String? yearofDeath,
    @JsonKey(name: 'biografia_autor') String? biography,
    @JsonKey(name: 'profesion_autor') String? profession,
    @JsonKey(name: 'imagen_autor') String? image,
    @JsonKey(name: 'estado_autor') String? state,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}