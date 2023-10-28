import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:species/src/domain/entities/community.dart';
import 'package:species/src/presentation/pages/providers/indigenous_community/indigenousCommunity_repository_provider.dart';

final indigenousCommunityDetailProvider =
    StateNotifierProvider<CommunityMapNotifier, Map<String, Community>>((ref) {
  final fetchRepository =
      ref.watch(communityRepositoryProvider).getIndigenousCommunityId;
  return CommunityMapNotifier(getIndigenousCommunityId: fetchRepository);
});

typedef GetIndigenousCommunity = Future<Community> Function(String id);

class CommunityMapNotifier extends StateNotifier<Map<String, Community>> {
  final GetIndigenousCommunity getIndigenousCommunityId;
  CommunityMapNotifier({required this.getIndigenousCommunityId}) : super({});

  Future<void> loadCommunity(String id) async {
    if (state[id] != null) return;
    final specie = await getIndigenousCommunityId(id);

    state = {...state, id: specie};
  }
}
