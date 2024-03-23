import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/phylum_iiap/phylum_iiap.dart';

class PhylumIiapMapIntoClass implements JsonConverter<PhylumIiap, dynamic> {
  const PhylumIiapMapIntoClass();

  @override
  PhylumIiap fromJson(dynamic phylum) => PhylumIiap.fromJson(phylum);

  @override
  Map<String, dynamic> toJson(PhylumIiap phylum) => phylum.toJson();
}