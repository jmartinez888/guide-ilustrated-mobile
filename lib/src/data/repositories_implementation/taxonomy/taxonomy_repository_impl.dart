import 'package:species/src/data/models/classes/taxonomy_for_search_iiap/taxonomy_for_search_iiap.dart';
import 'package:species/src/data/services/remote/taxonomy_api.dart';
import 'package:species/src/domain/repositories/taxonomy/taxonomy_repository.dart';

class TaxonomyRepositoryImpl implements TaxonomyRepository {
  final TaxonomyApi _taxonomyApi;

  TaxonomyRepositoryImpl({required TaxonomyApi taxonomyApi})
      : _taxonomyApi = taxonomyApi;

  @override
  Future<List<TaxonomyForSearchIiap>> getTaxonomies() {
    return _taxonomyApi.getTaxonomies();
  }
}
