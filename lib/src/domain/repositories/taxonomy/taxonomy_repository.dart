import 'package:species/src/domain/entities/taxonomy_for_search/taxonomy_for_search.dart';

abstract class TaxonomyRepository {
  Future<List<TaxonomyForSearch>> getTaxonomies();
}
