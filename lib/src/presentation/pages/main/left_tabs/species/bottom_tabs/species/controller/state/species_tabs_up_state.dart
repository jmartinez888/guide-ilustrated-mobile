import 'package:freezed_annotation/freezed_annotation.dart';

part 'species_tabs_up_state.freezed.dart';

@freezed
class SpeciesTabsUpState with _$SpeciesTabsUpState {

  factory SpeciesTabsUpState({
    @Default(0) int position,
  }) = _SpeciesPageTabsUpState;

}