import 'package:species/src/data/models/species_iiap/specie_amazonia_iiap.dart';
import 'package:species/src/domain/entities/specie.dart';

class SpecieMapper {
  static Specie speciesIiapToEntity(SpecieAmazoniaIIAP specieIiap) => Specie(
        id: specieIiap.idEspecie,
        name: specieIiap.vcNombre,
        scientificName: specieIiap.vcNombreCientifico,
        year: specieIiap.vcAno ?? '',
        images: (specieIiap.vcImagen != '') ? [specieIiap.vcImagen] : [],
        description: specieIiap.teDescripcion ?? '',
        sound: specieIiap.vcSonido ?? '',
        kingdom: specieIiap.taxonomia != null
            ? specieIiap.taxonomia!.reino.vcNombre
            : '',
        phylum: specieIiap.taxonomia != null
            ? specieIiap.taxonomia!.filo.vcNombre
            : '',
        class_: specieIiap.taxonomia != null
            ? specieIiap.taxonomia!.clase.vcNombre
            : '',
        order: specieIiap.taxonomia != null
            ? specieIiap.taxonomia!.orden.vcNombre
            : '',
        family: specieIiap.taxonomia != null
            ? specieIiap.taxonomia!.familia.vcNombre
            : '',
        type: specieIiap.taxa.vcNombre,
        authors: specieIiap.autores != null
            ? specieIiap.autores!.map((author) => author.vcNombre).toList()
            : [],
        statusImage: specieIiap.estadosConservacion
            .map((status) => status.imagenEstado)
            .toList(),
      );
}
