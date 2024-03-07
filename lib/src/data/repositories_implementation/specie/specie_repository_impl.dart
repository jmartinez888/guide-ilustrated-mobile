import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/data/services/remote/specie_api.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';

class SpecieRepositoryImpl implements SpecieRepository {
  final baseUrl = 'https://api.amazonia.iiap.gob.pe/api/v1';
  final firebaseInstance = FirebaseFirestore.instance.collection('users');
  final SpecieApi _specieApi;
  SpecieRepositoryImpl({
    required SpecieApi specieApi,
  }) : _specieApi = specieApi;

  @override
  Future<Either<HttpRequestFailure, List<Specie>>> getSpecies({
    required int pageNumber,
    required int type,
    required int numberOfPostsPerRequest,
    required bool orderByName,
    required bool orderAsc,
  }) {
    return _specieApi.getSpecies(
      pageNumber: pageNumber,
      type: type,
      numberOfPostsPerRequest: numberOfPostsPerRequest,
      orderByName: orderByName,
      orderAsc: orderAsc,
    );
  }

  @override
  Future<Either<HttpRequestFailure, Specie>> getSpecie(String id) {
    return _specieApi.getSpecie(id);
  }

  @override
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
  }) {
    return _specieApi.filterSpecies(
      pagingController: pagingController,
      pageKey: pageKey,
      numberOfPostsPerRequest: numberOfPostsPerRequest,
    );
  }
}
