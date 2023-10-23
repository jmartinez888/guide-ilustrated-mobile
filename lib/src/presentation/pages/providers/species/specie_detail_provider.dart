import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/presentation/pages/providers/species/specie_repository_provider.dart';

final specieDetailsProvider =
    StateNotifierProvider<SpecieMapNotifier, Map<String, Specie>>((ref) {
  final fetchRepository = ref.watch(specieRepositoryProvider).getSpecieId;
  return SpecieMapNotifier(getSpecie: fetchRepository);
});

typedef GetSpecieCallBack = Future<Specie> Function(String id);

class SpecieMapNotifier extends StateNotifier<Map<String, Specie>> {
  final GetSpecieCallBack getSpecie;
  SpecieMapNotifier({required this.getSpecie}) : super({});

  Future<void> loadSpecie(String id) async {
    if (state[id] != null) return;
    final specie = await getSpecie(id);

    state = {...state, id: specie};
  }
}
