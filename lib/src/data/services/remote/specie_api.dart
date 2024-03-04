import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';

class SpecieApi {
  final String _baseUrl;

  SpecieApi({required String baseUrl}) : _baseUrl = baseUrl;

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
      print('🎈 llamando');
      final response = await get(Uri.parse(
          '$_baseUrl/species/search/type/$type/$pageNumber/$numberOfPostsPerRequest/$orderByNameValue/$orderAscValue'));

      print('🎈 ${response.statusCode}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseList = jsonDecode(response.body) as Map<String, dynamic>;

        print('🧨 ${responseList}');

        final List<Specie> postList = getSpecieList(responseList['species']);

        print('✨ ${postList}');


        return Either.right(postList);
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
    String query = '',
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

      List<Specie> postList = getSpecieList(responseList['species']);

      final isLatPage = postList.length < numberOfPostsPerRequest;

      if (isLatPage) {
        pagingController.appendLastPage(postList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(postList, nextPageKey);
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
      //final specie = Specie.fromJson(jsonDecode(response.body));
      final specie = Specie.fromJson(jsonDecode(response.body));
      return Either.right(specie);
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        return Either.left(HttpRequestFailureNetwork());
      }
      return Either.left(HttpRequestFailureUnknown());
    }
  }
}
