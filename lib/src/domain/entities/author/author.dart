// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/presentation/global/utils/serializers/for_entities/species_map_into_class.dart';

part 'author.freezed.dart';
part 'author.g.dart';

@freezed
class Author with _$Author {
  factory Author({
    required int id,
    String? name,
    String? lastname,
    String? biography,
    @JsonKey(name: 'year_of_birth') String? yearOfBirth,
    @JsonKey(name: 'year_of_death') String? yearOfDeath,
    String? profession,
    String? image,
    String? state,
    @SpeciesIntoClassToMap() @Default(null) List<Specie>? species,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}
