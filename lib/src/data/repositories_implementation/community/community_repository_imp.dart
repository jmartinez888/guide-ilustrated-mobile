import 'dart:convert';
import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/src/core/paging_controller.dart';
import 'package:species/src/data/mappers/community_mapper.dart';
import 'package:species/src/data/models/indigenous_community_iiap/community_community_iiap.dart';
import 'package:species/src/data/models/indigenous_community_iiap/indigenous_community_iiap_response.dart';
import 'package:species/src/domain/entities/community.dart';
import 'package:species/src/domain/repositories/community/community_repository.dart';

class IndigenousCommunityIiaprepositoryImpl extends CommunityRepository {
  final baseIndigenpusCommunityUrl = 'https://api.amazonia.iiap.gob.pe/api/v1/indigenous-community';

  @override
  Future<void> getIndigenousCommunities({
    required int pageKey,
    required int numberOfPostsPerRequest,
    required PagingController pagingController,
  }) async {
    try {
      final response = await get(Uri.parse(
          '$baseIndigenpusCommunityUrl/$pageKey/$numberOfPostsPerRequest'));
      final responseList =
          IndigenousCommunityIiapResponse.fromJson(jsonDecode(response.body));
      List<Community> postList =
          responseList.pueblosIndigenas.map((communityIiap) {
        return CommunityMapper.comunityIiapToEntity(communityIiap);
      }).toList();

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

  @override
  Future<void> getIndigenousCommunitiesSearchGeneral(
      {required String query,
      required int pageKey,
      required int numberOfPostsPerRequest,
      required PagingController pagingController}) async {
    try {
      final response = await get(Uri.parse(
          '$baseIndigenpusCommunityUrl/search/general/$query/$pageKey/$numberOfPostsPerRequest'));
      final responseList =
          IndigenousCommunityIiapResponse.fromJson(jsonDecode(response.body));
      List<Community> postList =
          responseList.pueblosIndigenas.map((communityIiap) {
        return CommunityMapper.comunityIiapToEntity(communityIiap);
      }).toList();

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

  @override
  Future<Community> getIndigenousCommunityId(String id) async {
    final response = await get(Uri.parse('$baseIndigenpusCommunityUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Comunidad no existe $id');
    }
    final communityDetail =
        CommunityCommunityIiap.fromJson(jsonDecode(response.body));

    final Community community =
        CommunityMapper.comunityIiapToEntity(communityDetail);

    return community;
  }
}