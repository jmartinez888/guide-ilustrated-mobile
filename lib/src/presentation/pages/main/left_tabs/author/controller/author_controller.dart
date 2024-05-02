import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/domain/entities/author/author.dart';
import 'package:species/src/domain/repositories/author/author_repository.dart';
import 'package:species/src/presentation/global/state_notifier.dart';
import 'package:species/src/presentation/pages/main/left_tabs/author/controller/state/author_state.dart';

class AuthorController extends StateNotifier<AuthorState> {
  final AuthorRepository authorRepository;
  final PagingController<int, Author> pagingController;
  final int numberOfPostsPerRequest = 16;

  AuthorController(
    super.state, {
    required this.authorRepository,
  }) : pagingController = PagingController(firstPageKey: 1) {
    pagingController.addPageRequestListener((pageKey) async {
      try {
        final result = await authorRepository.getAuthors(
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
