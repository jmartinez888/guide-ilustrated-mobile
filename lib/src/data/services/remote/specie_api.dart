import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/data/mappers/specie_mapper.dart';
import 'package:species/src/data/models/classes/specie_iiap/specie_iiap.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';

class SpecieApi {
  final String _baseUrl;
  final SpecieMapper _specieMapper;

  SpecieApi({
    required String baseUrl,
    required specieMapper,
  })  : _baseUrl = baseUrl,
        _specieMapper = specieMapper;

  Future<Either<HttpRequestFailure, List<Specie>>> getSpecies({
    required int pageNumber,
    required int type,
    required int numberOfPostsPerRequest,
    required bool orderByName,
    required bool orderAsc,
  }) async {
    String orderByNameValue =
        orderByName ? 'vc_nombre' : 'vc_nombre_cientifico';

    String orderAscValue = orderAsc ? 'ASC' : 'DESC';

    try {
      final response = await get(Uri.parse(
          '$_baseUrl/species/search/type/$type/$pageNumber/$numberOfPostsPerRequest/$orderByNameValue/$orderAscValue'));

      if (response.statusCode == 200) {
        final responseList = jsonDecode(response.body) as Map<String, dynamic>;

        final speciesIiap = getSpecieIiapList(responseList['species']);

        final species = speciesIiap
            .map((specieIiap) => _specieMapper.specieIiapToSpecie(specieIiap))
            .toList();

        return Either.right(species);
      } else {
        return Either.left(HttpRequestFailureNotFound());
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        return Either.left(HttpRequestFailureNetwork());
      }
      return Either.left(HttpRequestFailureUnknown());
    }
  }

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
    String? query,
    String? orderByName = '',
    String? orderType = '',
  }) async {
    try {
      final response = await post(
        Uri.parse('$_baseUrl/species/filter'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "page": pageKey,
          "pageSize": numberOfPostsPerRequest,
          "taxonomyId": taxonomyId,
          "classId": class_,
          "orderId": order,
          "familyId": family,
          "conservationStatus": conservationStatus,
          "hasSound": hasSound,
          "search": query,
          "orderBy": orderByName,
          "orderType": orderType,
        }),
      );

      final responseList = jsonDecode(response.body) as Map<String, dynamic>;

      print('🙈 ${response.body}');
      List<SpecieIiap> postList = getSpecieIiapList(responseList['species']);

      final species = postList
          .map((specie) => _specieMapper.specieIiapToSpecie(specie))
          .toList();

      print('🥺 ${postList}');

      final isLatPage = species.length < numberOfPostsPerRequest;

      if (isLatPage) {
        pagingController.appendLastPage(species);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(species, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  Future<Either<HttpRequestFailure, Specie>> getSpecie(String id) async {
    try {
      final response = await get(Uri.parse('$_baseUrl/species/$id'));

      if (response.statusCode != 200) {
        return Either.left(HttpRequestFailureNotFound());
      }
      final specieIiap = SpecieIiap.fromJson(jsonDecode(response.body));

      final specie = _specieMapper.specieIiapToSpecie(specieIiap);

      return Either.right(specie);
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        return Either.left(HttpRequestFailureNetwork());
      }
      return Either.left(HttpRequestFailureUnknown());
    }
  }
}
