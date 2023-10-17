import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:species/src/data/repositories_implementation/species_iiap/specie_species_iiap_repository_impl.dart';

final specieRepositoryProvider = Provider((ref) => SpecieSpeciesIIapRepositoryImpl());