import 'package:species/src/presentation/global/state_notifier.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/controller/state/species_tabs_up_state.dart';

class SpeciesTabsUpController extends StateNotifier<SpeciesTabsUpState> {
  SpeciesTabsUpController(super.state);
  void changePosition(int position) {
    print(position);
    state = state.copyWith(position: position);
  }
}
