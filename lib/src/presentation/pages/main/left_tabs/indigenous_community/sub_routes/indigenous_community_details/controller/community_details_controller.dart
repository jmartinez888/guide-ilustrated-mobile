import 'package:species/src/domain/repositories/community/community_repository.dart';
import 'package:species/src/presentation/global/state_notifier.dart';
import 'package:species/src/presentation/pages/main/left_tabs/indigenous_community/sub_routes/indigenous_community_details/controller/state/community_details_state.dart';

class CommunityDetailsController extends StateNotifier<CommunityDetailsState> {
  final CommunityRository _communityRepository;
  CommunityDetailsController(
    super.state, {
    required CommunityRository communityRepository,
  }) : _communityRepository = communityRepository;

  Future<void> getCommunity(String id) async {
    if (state.mapOfId[id] != null) return;
    state = state.copyWith(
      loading: true,
    );
    final result = await _communityRepository.getCommunity(id);
    result.when(
      (_) {
        state = state.copyWith(
          loading: false,
        );
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

  Future<void> refreshCommunity(String id) async {
    state = state.copyWith(
      loading: true,
      mapOfId: state.mapOfId..remove(id),
    );

    final result = await _communityRepository.getCommunity(id);
    result.when(
      (_) {
        state = state.copyWith(
          loading: false,
        );
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
