import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/data/mappers/community_mapper.dart';
import 'package:species/src/data/models/classes/community_iiap/community_iiap.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/community/community.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';

class CommunityApi {
  final String _baseUrl;
  final CommunityMapper _communityMapper;

  CommunityApi({
    required String baseUrl,
    required CommunityMapper communityMapper,
  })  : _baseUrl = baseUrl,
        _communityMapper = communityMapper;

  Future<Either<HttpRequestFailure, List<Community>>> getIndigenousCommunities({
    required int pageKey,
    required int numberOfPostsPerRequest,
  }) async {
    try {
      final response = await get(Uri.parse(
          '$_baseUrl/indigenous-community/$pageKey/$numberOfPostsPerRequest'));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseList = jsonDecode(response.body) as Map<String, dynamic>;
        final communitiesIiap =
            getCommunityIiapList(responseList['pueblosIndigenas']);
        final communities = communitiesIiap
            .map(
              (community) =>
                  _communityMapper.communityIiapToCommunity(community),
            )
            .toList();
        return Either.right(communities);
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

  Future<void> getIndigenousCommunitiesSearchGeneral(
      {required String query,
      required int pageKey,
      required int numberOfPostsPerRequest,
      required PagingController pagingController}) async {
    try {
      final response = await get(Uri.parse(
          '$_baseUrl/indigenous-community/search/general/$query/$pageKey/$numberOfPostsPerRequest'));
      final responseList = jsonDecode(response.body) as Map<String, dynamic>;
      final communitiesIiap =
          getCommunityIiapList(responseList['pueblosIndigenas']);
      final communities = communitiesIiap
          .map(
            (community) => _communityMapper.communityIiapToCommunity(community),
          )
          .toList();

      final isLastPage = communities.length < numberOfPostsPerRequest;
      if (isLastPage) {
        pagingController.appendLastPage(communities);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(communities, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  Future<Either<HttpRequestFailure, Community>> getIndigenousCommunity(
      String id) async {
    try {
      final response =
          await get(Uri.parse('$_baseUrl/indigenous-community/$id'));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
        final communityIiap = CommunityIiap.fromJson(responseBody);
        final community =
            _communityMapper.communityIiapToCommunity(communityIiap);
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
