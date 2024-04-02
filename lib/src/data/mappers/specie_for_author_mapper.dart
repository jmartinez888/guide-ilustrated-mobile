import 'package:species/src/data/models/classes/specie_iiap/specie_iiap.dart';
import 'package:species/src/domain/entities/specie/specie.dart';

class SpecieForAuthorMapper {
   Specie specieIiapToSpecie(SpecieIiap specie) {
    return Specie(
      id: specie.id,
      name: specie.name,
      scientificName: specie.scientificName,
      englishName: specie.englishName,
      images: specie.image != null && specie.image!.isNotEmpty
          ? [specie.image!]
          : null,
      state: specie.state,
    );
  }
}
