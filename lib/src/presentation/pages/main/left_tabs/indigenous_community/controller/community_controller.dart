import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/domain/entities/community/community.dart';
import 'package:species/src/domain/repositories/community/community_repository.dart';
import 'package:species/src/presentation/global/state_notifier.dart';
import 'package:species/src/presentation/pages/main/left_tabs/indigenous_community/controller/state/community_state.dart';

class CommunityController extends StateNotifier<CommunityState> {
  final CommunityRepository communityRepository;
  final PagingController<int, Community> pagingController;
  final int numberOfPostsPerRequest = 16;

  CommunityController(
    super.state, {
    required this.communityRepository,
  }) : pagingController = PagingController(firstPageKey: 1) {
    pagingController.addPageRequestListener((pageKey) async {
      try {
        final result = await communityRepository.getCommunities(
          numberOfPostsPerRequest: numberOfPostsPerRequest,
          pageKey: pageKey,
        );
        result.when(
          (e) => pagingController.error = e,
          (list) {
            final isLastPage = list.length < numberOfPostsPerRequest;
            if (isLastPage) {
              pagingController.appendLastPage(list);
            } else {
              final nextPageKey = pageKey + 1;
              pagingController.appendPage(list, nextPageKey);
            }
          },
        );
      } catch (e) {
        pagingController.error = e;
      }
    });
  }
}
