import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/specie/specie.dart';

class SpeciesIntoClassToMap implements JsonConverter<List<Specie>, List<dynamic>> {
  const SpeciesIntoClassToMap();

  @override
  List<Specie> fromJson(List<dynamic> json) =>
      json.map((e) => Specie.fromJson(e)).toList();

  @override
  List<dynamic> toJson(List<Specie> species) =>
      species.map((e) => e.toJson()).toList();
}