import 'package:species/src/data/models/classes/phylum_iiap/phylum_iiap.dart';
import 'package:species/src/domain/entities/phylum/phylum.dart';

class PhylumMapper {
  Phylum phylumIiapToPhylum(PhylumIiap phylum) {
    return Phylum(
      id: phylum.id,
      name: phylum.name,
    );
  }
}
