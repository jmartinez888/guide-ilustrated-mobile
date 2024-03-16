import 'package:freezed_annotation/freezed_annotation.dart';

part 'lab_position_state.freezed.dart';

@freezed
class TabPositionState with _$TabPositionState {

  factory TabPositionState(
    {
      @Default(0) int position,
    
    }
  ) = _TabPositionState;

}