import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/data/mappers/specie_mapper.dart';
import 'package:species/src/data/models/classes/specie_iiap/specie_iiap.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';

List<SpecieIiap> _parseSpeciesList(String responseBody) {
  final responseList = jsonDecode(responseBody) as Map<String, dynamic>;
  return getSpecieIiapList(responseList['species']);
}

SpecieIiap _parseSpecie(String responseBody) {
  return SpecieIiap.fromJson(jsonDecode(responseBody));
}

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
        final speciesIiap = await compute(_parseSpeciesList, response.body);

        final species = speciesIiap
            .map((specieIiap) => _specieMapper.specieIiapToSpecie(specieIiap))
            .toList();

        return Either.right(species);
      } else if (response.statusCode == 404) {
        return Either.right([]);
      } else {
        return Either.left(HttpRequestFailure.notFound());
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        return Either.left(HttpRequestFailure.network());
      }
      return Either.left(HttpRequestFailure.unknown());
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

      if (response.statusCode == 404) {
        try { pagingController.appendLastPage([]); } catch (_) {}
        return;
      }

      final postList = await compute(_parseSpeciesList, response.body);

      final species = postList
          .map((specie) => _specieMapper.specieIiapToSpecie(specie))
          .toList();

      final isLatPage = species.length < numberOfPostsPerRequest;

      try {
        if (isLatPage) {
          pagingController.appendLastPage(species);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(species, nextPageKey);
        }
      } catch (_) {
        // PagingController was disposed before we could update it.
        // This happens when the user navigates away during loading.
      }
    } catch (e) {
      try {
        pagingController.error = e;
      } catch (_) {
        // PagingController was disposed, ignore safely.
      }
    }
  }

  Future<Either<HttpRequestFailure, Specie>> getSpecie(String id) async {
    return _getSpecieHelper(id);
  }

  Future<Either<HttpRequestFailure, List<Specie>>> getSpeciesData(
      List<String> ids) async {
    final List<Specie> finalSpecies = [];
    HttpRequestFailure? httpRequestFailureValue;

    for (String id in ids) {
      final getSpecie = await _getSpecieHelper(id);
      getSpecie.when(
        (httpRequestFailure) => httpRequestFailureValue = httpRequestFailure,
        (specie) {
          finalSpecies.add(specie);
        },
      );
    }

    if (httpRequestFailureValue != null) {
      return httpRequestFailureValue!.when(
        network: () => Either.left(HttpRequestFailure.network()),
        unknown: () => Either.left(HttpRequestFailure.unknown()),
        notFound: () => Either.left(HttpRequestFailure.notFound()),
      );
    }

    return Either.right(finalSpecies);
  }

  Future<Either<HttpRequestFailure, Specie>> _getSpecieHelper(String id) async {
    try {
      final response = await get(Uri.parse('$_baseUrl/species/$id'));

      if (response.statusCode != 200) {
        return Either.left(HttpRequestFailure.notFound());
      }
      final specieIiap = await compute(_parseSpecie, response.body);

      final specie = _specieMapper.specieIiapToSpecie(specieIiap);

      return Either.right(specie);
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        return Either.left(HttpRequestFailure.network());
      }
      return Either.left(HttpRequestFailure.unknown());
    }
  }
}
