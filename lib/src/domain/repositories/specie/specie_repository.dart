import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';

abstract class SpecieRepository {
  Future<Either<HttpRequestFailure, List<Specie>>> getSpecies({
    required int pageNumber,
    required int type,
    required int numberOfPostsPerRequest,
    required bool orderByName,
    required bool orderAsc,
  });

  Future<Either<HttpRequestFailure, Specie>> getSpecie(String id);


  Future<void> filterSpecies({
    required PagingController pagingController,
    required int pageKey,
    required int numberOfPostsPerRequest,
    int? taxonomyId,
    int? class_,
    int? order,
    int? family,
    int? conservationStatus,
    int? hasSound,
    String query = '',
    String? orderByName = '',
    String? orderType = '',
  });
}
