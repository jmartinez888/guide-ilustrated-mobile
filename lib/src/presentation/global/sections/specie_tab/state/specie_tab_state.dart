import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/specie/specie.dart';

part 'specie_tab_state.freezed.dart';

@freezed
class SpecieTabState with _$SpecieTabState {

  factory SpecieTabState({
    @Default([]) List<Specie> species,
    @Default(true) bool orderByName,
    @Default(true) bool orderAsc,
  }) = _SpecieTabState;

}