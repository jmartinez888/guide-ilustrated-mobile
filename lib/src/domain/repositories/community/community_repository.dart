/* import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/domain/entities/community.dart';

abstract class CommunityRepository {
  Future<void> getIndigenousCommunities({
    required int pageKey,
    required int numberOfPostsPerRequest,
    required PagingController pagingController,
  });

  Future<Community> getIndigenousCommunityId(String id);

  Future<void> getIndigenousCommunitiesSearchGeneral({
    required String query,
    required int pageKey,
    required int numberOfPostsPerRequest,
    required PagingController pagingController,
  });
}
 */