import 'package:species/src/presentation/global/state_notifier.dart';
import 'package:species/src/presentation/global/states/lab_position_state.dart';

class BottomTabPositionController extends StateNotifier<TabPositionState> {
  BottomTabPositionController(
    super.state,
  );

  void changeTab(int index) {
    state = state.copyWith(
      position: index,
    );
  }
}
