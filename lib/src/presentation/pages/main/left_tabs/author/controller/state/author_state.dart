import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/author/author.dart';

part 'author_state.freezed.dart';

@freezed
class AuthorState with _$AuthorState {
  factory AuthorState({
    @Default([]) List<Author> authors,
  }) = _AuthorState;
}
