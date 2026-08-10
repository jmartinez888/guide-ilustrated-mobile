import 'package:species/src/domain/entities/trivia_question.dart';

class TriviaCategory {
  final String category;
  final List<TriviaQuestion> questions;

  TriviaCategory({
    required this.category,
    required this.questions,
  });
}
