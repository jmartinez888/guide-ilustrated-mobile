import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/data/services/remote/community_api.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/community/community.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';
import 'package:species/src/domain/repositories/community/community_repository.dart';

class CommunityRositoryImpl extends CommunityRository {
  final CommunityApi _communityApi;
  CommunityRositoryImpl({
    required CommunityApi communityApi,
  }) : _communityApi = communityApi;

  @override
  Future<Either<HttpRequestFailure, List<Community>>> getCommunities(
      {required int pageKey, required int numberOfPostsPerRequest}) {
    return _communityApi.getIndigenousCommunities(
        pageKey: pageKey, numberOfPostsPerRequest: numberOfPostsPerRequest);
  }

  @override
  Future<void> getCommunitiesSearch({
    required String query,
    required int pageKey,
    required int numberOfPostsPerRequest,
    required PagingController pagingController,
  }) {
    return _communityApi.getIndigenousCommunitiesSearchGeneral(
      query: query,
      pageKey: pageKey,
      numberOfPostsPerRequest: numberOfPostsPerRequest,
      pagingController: pagingController,
    );
  }

  @override
  Future<Either<HttpRequestFailure, Community>> getCommunity(String id) {
    return _communityApi.getIndigenousCommunityId(id);
  }
}
