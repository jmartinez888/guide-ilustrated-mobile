import 'package:species/src/presentation/global/state_notifier.dart';
import 'package:species/src/presentation/global/states/lab_position_state.dart';

class LeftTabController extends StateNotifier<TabPositionState> {
  LeftTabController(
    super.state,
  );

  void changeTab(int index) {
    state = state.copyWith(
      position: index,
    );
  }
}
