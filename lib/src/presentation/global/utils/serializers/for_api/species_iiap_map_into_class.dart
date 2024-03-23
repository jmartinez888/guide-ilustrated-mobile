import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/specie_iiap/specie_iiap.dart';

class SpeciesIiapIntoClassToMap implements JsonConverter<List<SpecieIiap>, List<dynamic>> {
  const SpeciesIiapIntoClassToMap();

  @override
  List<SpecieIiap> fromJson(List<dynamic> json) =>
      json.map((e) => SpecieIiap.fromJson(e)).toList();

  @override
  List<dynamic> toJson(List<SpecieIiap> species) =>
      species.map((e) => e.toJson()).toList();
}
