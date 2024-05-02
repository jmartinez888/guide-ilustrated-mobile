import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/author/author.dart';

part 'author_details_state.freezed.dart';

@freezed
class AuthorDetailsState with _$AuthorDetailsState {

  factory AuthorDetailsState({
    @Default({}) Map<String, Author> mapOfId,
    @Default(true) bool loading,
  }) = _AuthorDetailsState;

}