import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/author/author.dart';

class AuthorsIntoClassToMap implements JsonConverter<List<Author>, List<dynamic>> {
  const AuthorsIntoClassToMap();

  @override
  List<Author> fromJson(List<dynamic> json) =>
      json.map((e) => Author.fromJson(e)).toList();

  @override
  List<dynamic> toJson(List<Author> authors) =>
      authors.map((e) => e.toJson()).toList();
}
