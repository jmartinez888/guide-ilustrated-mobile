import 'package:species/src/data/models/species_iiap/specie_species_iiap.dart';

class ResponseSpeciesIiap {
  final List<SpecieSpeciesIiap> species;
  final int currentPage;
  final int totalPages;
  final int totalItems;

  ResponseSpeciesIiap({
    required this.species,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
  });

  ResponseSpeciesIiap copyWith({
    final List<SpecieSpeciesIiap>? species,
    final int? currentPage,
    final int? totalPages,
    final int? totalItems,
  }) {
    return ResponseSpeciesIiap(
      species: species ?? this.species,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      totalItems: totalItems ?? this.totalItems,
    );
  }

  factory ResponseSpeciesIiap.fromJson(Map<String, dynamic> json) =>
      ResponseSpeciesIiap(
        species: List<SpecieSpeciesIiap>.from(
            json["species"].map((x) => SpecieSpeciesIiap.fromJson(x))),
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        totalItems: json["totalItems"],
      );

  Map<String, dynamic> toJson() => {
        "species": List<dynamic>.from(species.map((x) => x.toJson())),
        "currentPage": currentPage,
        "totalPages": totalPages,
        "totalItems": totalItems,
      };
}
