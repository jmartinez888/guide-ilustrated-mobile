import 'package:species/src/data/models/species_iiap/specie_species_iiap.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/domain/entities/taxonomy.dart';

class SpecieMapper {
  static Specie speciesIiapToEntity(SpecieSpeciesIiap specieIiap) => Specie(
        Taxonomia(vcNombre: 'vcNombre', estado: 'estado'),
        id: specieIiap.idEspecie,
        name: 'specieIiap.vcNombre',
        scientificName: 'specieIiap.vcNombreCientifico',
        year: 'specieIiap.vcAno',
        images: ['(specieIiap.vcImagen != ' ') ? [specieIiap.vcImagen] : []'],
        description: 'specieIiap.teDescripcion',
        sound: 'specieIiap.vcSonido',
        kingdom: 'specieIiap.taxonomia[0].idReino.toString()',
        phylum: 'specieIiap.taxonomia[0].idFilo.toString()',
        class_: 'specieIiap.taxonomia[0].idClase.toString()',
        order: 'specieIiap.taxonomia[0].idOrden.toString()',
        family: 'specieIiap.taxonomia[0].idFamilia.toString()',
        type: 'specieIiap.taxa.vcNombre',
        authors: ['specieIiap.autores.map((e) => e.vcNombre).toList()'],
        statusImage: [
          'specieIiap.estadosConservacion.map((e) => e.imagenEstado).toList()'
        ],
      );
}
