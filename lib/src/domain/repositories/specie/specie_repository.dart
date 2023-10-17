import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

abstract class SpecieRepository {
  Future<void> getSpecies({
    required int pageKey,
    required int type,
    required int numberOfPostsPerRequest,
    required PagingController pagingController,
  });
}
