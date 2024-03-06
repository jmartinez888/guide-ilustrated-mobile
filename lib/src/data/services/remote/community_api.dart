import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/community/community.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';

class CommunityApi {
  final String _baseUrl;

  CommunityApi({required String baseUrl}) : _baseUrl = baseUrl;

  Future<Either<HttpRequestFailure, List<Community>>> getIndigenousCommunities({
    required int pageKey,
    required int numberOfPostsPerRequest,
  }) async {
    try {
      final response = await get(Uri.parse(
          '$_baseUrl/indigenous-community/$pageKey/$numberOfPostsPerRequest'));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('🎈 ${response.statusCode}');

        final responseList = jsonDecode(response.body) as Map<String, dynamic>;
        final List<Community> postList =
            getCommunityList(responseList['pueblosIndigenas']);
        return Either.right(postList);
      } else {
        print('🎈 ${response.statusCode} falló');

        return Either.left(HttpRequestFailureNotFound());
      }
    } catch (e) {
        print('🎈 $e');

      if (e is SocketException || e is ClientException) {
        return Either.left(HttpRequestFailureNetwork());
      }
      return Either.left(HttpRequestFailureUnknown());
    }
  }

  Future<void> getIndigenousCommunitiesSearchGeneral(
      {required String query,
      required int pageKey,
      required int numberOfPostsPerRequest,
      required PagingController pagingController}) async {
    try {
      final response = await get(Uri.parse(
          '$_baseUrl/indigenous-community/search/general/$query/$pageKey/$numberOfPostsPerRequest'));
      final responseList = jsonDecode(response.body) as Map<String, dynamic>;
      final List<Community> postList =
          getCommunityList(responseList['pueblosIndigenas']);

      final isLastPage = postList.length < numberOfPostsPerRequest;
      if (isLastPage) {
        pagingController.appendLastPage(postList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(postList, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  Future<Either<HttpRequestFailure, Community>> getIndigenousCommunityId(
      String id) async {
    try {
      final response =
          await get(Uri.parse('$_baseUrl/indigenous-community/$id'));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
        final community = Community.fromJson(responseBody);
        return Either.right(community);
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
}
