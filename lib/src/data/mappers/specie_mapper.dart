// ignore_for_file: prefer_null_aware_operators

import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/entities/specie_favorite/specie_favorite.dart';

class SpecieMapper {
  static SpecieFavorite specieToSpecieFavorite(Specie specie) {
    return SpecieFavorite(
      id: specie.id,
      name: specie.name,
      scientificName: specie.scientificName,
      description: specie.description,
      images: specie.image != null ? [specie.image!] : null,
      authors: specie.authors != null
          ? specie.authors!
              .where((author) => author.name != null)
              .map((author) => author.name!)
              .toList()
          : null,
      class_: specie.taxonomy != null ? specie.taxonomy!.classC?.name : null,
      family: specie.taxonomy != null ? specie.taxonomy!.family?.name : null,
      kingdom: specie.taxonomy != null ? specie.taxonomy!.kingdom?.name : null,
      order: specie.taxonomy != null ? specie.taxonomy!.order?.name : null,
      phylum: specie.taxonomy != null ? specie.taxonomy!.phylum?.name : null,
      sound: specie.sound,
      type: specie.type?.name,
      year: specie.year,
      vcImagenesEstado: specie.stateOfConservations != null
          ? specie.stateOfConservations!
              .where((state) => state.image != null)
              .map((state) => state.image!)
              .toList()
          : null,
    );
  }
}