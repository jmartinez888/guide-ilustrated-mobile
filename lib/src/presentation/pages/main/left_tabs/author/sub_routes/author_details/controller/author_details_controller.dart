import 'package:species/src/domain/repositories/author/author_repository.dart';
import 'package:species/src/presentation/global/state_notifier.dart';
import 'package:species/src/presentation/pages/main/left_tabs/author/sub_routes/author_details/controller/state/author_details_state.dart';

class AuthorDetailsController extends StateNotifier<AuthorDetailsState> {
  final AuthorRepository authorRepository;

  AuthorDetailsController(
    super.state, {
    required this.authorRepository,
  });

  Future<void> getAuthor(String id) async {
    if (state.mapOfId[id] != null) return;
    state = state.copyWith(loading: true);
    final result = await authorRepository.getAuthor(id);
    result.when(
      (_) {
        state = state.copyWith(loading: false);
      },
      (specie) {
        state = state.copyWith(
          loading: false,
          mapOfId: {
            ...state.mapOfId,
            id: specie,
          },
        );
      },
    );
  }

  Future<void> refreshAuthor(String id) async {
    state = state.copyWith(
      loading: true,
      mapOfId: state.mapOfId..remove(id),
    );

    final result = await authorRepository.getAuthor(id);
    result.when(
      (_) {
        state = state.copyWith(loading: false);
      },
      (specie) {
        state = state.copyWith(
          loading: false,
          mapOfId: {
            ...state.mapOfId,
            id: specie,
          },
        );
      },
    );
  }
}
