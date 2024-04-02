import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/community/community.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';

abstract class CommunityRository {
  Future<Either<HttpRequestFailure, List<Community>>> getCommunities({
    required int pageKey,
    required int numberOfPostsPerRequest,
  });

  Future<void> getCommunitiesSearch({
    required String query,
    required int pageKey,
    required int numberOfPostsPerRequest,
    required PagingController pagingController,
  });

  Future<Either<HttpRequestFailure, Community>> getCommunity(String id);
}
