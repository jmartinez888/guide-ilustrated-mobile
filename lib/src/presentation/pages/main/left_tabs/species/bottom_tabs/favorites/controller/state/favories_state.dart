import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'favories_state.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  factory FavoritesState({
    @Default('') String searchText,
    Timer? searchTimer,
    @Default(false) bool switchSearch,
  }) = _FavoritesState;
}
