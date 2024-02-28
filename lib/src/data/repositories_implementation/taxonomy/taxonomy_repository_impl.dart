import 'package:species/src/data/services/remote/taxonomy_api.dart';
import 'package:species/src/domain/entities/taxonomy_for_search/taxonomy_for_search.dart';
import 'package:species/src/domain/repositories/taxonomy/taxonomy_repository.dart';

class TaxonomyRepositoryImpl implements TaxonomyRepository {
  final TaxonomyApi _taxonomyApi;

  TaxonomyRepositoryImpl({required TaxonomyApi taxonomyApi})
      : _taxonomyApi = taxonomyApi;

  @override
  Future<List<TaxonomyForSearch>> getTaxonomies() {
    return _taxonomyApi.getTaxonomies();
  }
}
