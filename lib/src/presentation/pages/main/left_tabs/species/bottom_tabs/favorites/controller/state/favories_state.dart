import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/specie/specie.dart';

part 'favories_state.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {

  factory FavoritesState({
    @Default('') String searchText,
    @Default(true) bool loading,
    @Default([]) List<Specie> species,
  }) = _FavoritesState;
}