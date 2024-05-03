import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/author_iiap/author_iiap.dart';

class AuthorsIiapmapIntoClass implements JsonConverter<List<AuthorIiap>, List<dynamic>> {
  const AuthorsIiapmapIntoClass();

  @override
  List<AuthorIiap> fromJson(List<dynamic> json) =>
      json.map((e) => AuthorIiap.fromJson(e)).toList();

  @override
  List<dynamic> toJson(List<AuthorIiap> authors) =>
      authors.map((e) => e.toJson()).toList();
}