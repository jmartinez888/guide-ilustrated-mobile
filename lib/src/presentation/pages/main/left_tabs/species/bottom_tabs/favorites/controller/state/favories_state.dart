import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/entities/specie_helper/specie_helper.dart';

part 'favories_state.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {

  factory FavoritesState({
    @Default('') String searchText,
    @Default(true) bool loading,
    @Default([]) List<Specie> species,
    @Default([]) List<SpecieHelper> speciesHelper,
    @Default('') String errorMesage,
    @Default('') String errorMesageHelper,
  }) = _FavoritesState;
}