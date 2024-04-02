import 'package:species/src/data/models/classes/taxonomy_for_search_iiap/taxonomy_for_search_iiap.dart';

abstract class TaxonomyRepository {
  Future<List<TaxonomyForSearchIiap>> getTaxonomies();
}
