import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/specie/specie.dart';

part 'species_details_state.freezed.dart';

@freezed
class SpeciesDetailsState with _$SpeciesDetailsState {
  factory SpeciesDetailsState({
    @Default({}) Map<String, Specie> mapOfId,
    @Default(false) bool expanded,
    @Default(true) bool loading,
  }) = _SpeciesDetailsState;
}
