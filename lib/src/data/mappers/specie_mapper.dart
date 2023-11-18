import 'package:species/src/data/models/species_iiap/specie_amazonia_iiap.dart';
import 'package:species/src/domain/entities/specie.dart';

class SpecieMapper {
  static Specie speciesIiapToEntity(SpecieAmazoniaIIAP specieIiap) => Specie(
        id: specieIiap.idEspecie,
        name: specieIiap.vcNombre,
        scientificName: 'dbshdhs' ,
        year: 'ewwew',
        images: ["https://depor.com/resizer/crzkitvd2v51Tsyw_Xc1A4enYVs=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/DAYT2F5NUNB7VPAFKUPHNDXVQA.jpg"],
        description:  '',
        sound:  '',
        kingdom: 'specieIiap.reino',
        phylum: 'specieIiap.filo',
        class_: 'specieIiap.clase',
        order: 'specieIiap.orden',
        family: 'specieIiap.familia',
        type: 'specieIiap.tipo.vcNombre',
        authors: [],
        statusImage: [],
      );
}
