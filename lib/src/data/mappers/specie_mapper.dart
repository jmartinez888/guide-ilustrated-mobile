import 'package:species/src/data/models/species_iiap/specie_species_iiap.dart';
import 'package:species/src/domain/entities/specie.dart';

class SpecieMapper {
  static Specie speciesIiapToEntity(SpecieSpeciesIiap specieIiap) => Specie(
        id: specieIiap.idEspecie,
        name: specieIiap.vcNombre,
        scientificName: specieIiap.vcNombreCientifico,
        year: specieIiap.vcAno,
        images: (specieIiap.vcImagen != '') ? [specieIiap.vcImagen] : [],
        description: specieIiap.teDescripcion,
        sound: specieIiap.vcSonido,
        kingdom: specieIiap.reino,
        phylum: specieIiap.filo,
        class_: specieIiap.clase,
        order: specieIiap.orden,
        family: specieIiap.familia,
        type: specieIiap.tipo,
        authors:specieIiap.autores,
        statusImage: specieIiap.imagenesEstado,
      );
}
