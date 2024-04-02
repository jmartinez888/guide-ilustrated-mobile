import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:species/src/presentation/global/sections/specie_tab/state/specie_tab_state.dart';
import 'package:species/src/presentation/global/state_notifier.dart';

class TreesTabController extends StateNotifier<SpecieTabState> {
  final SpecieRepository specieRepository;
  final PagingController<int, Specie> pagingController;
  final int numberOfPostsPerRequest = 16;

  TreesTabController(
    super.state, {
    required this.specieRepository,
  }) : pagingController = PagingController(firstPageKey: 1) {
    pagingController.addPageRequestListener((pageKey) async {
      try {
        final result = await specieRepository.getSpecies(
          numberOfPostsPerRequest: numberOfPostsPerRequest,
          pageNumber: pageKey,
          type: 7,
          orderByName: state.orderByName,
          orderAsc: state.orderAsc,
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
  void orderByName() {
    if (state.orderByName) {
      state = state.copyWith(
        orderAsc: !state.orderAsc,
      );
    } else {
      state = state.copyWith(
        orderByName: true,
        orderAsc: true,
      );
    }
    pagingController.refresh();
  }

  void orderByScientificName() {
    if (!state.orderByName) {
      state = state.copyWith(
        orderAsc: !state.orderAsc,
      );
    } else {
      state = state.copyWith(
        orderByName: false,
        orderAsc: true,
      );
    }
    pagingController.refresh();
  }
}
