import 'package:species/src/domain/entities/trivia_question.dart';

class TriviaQuestionModel extends TriviaQuestion {
  TriviaQuestionModel({
    required String question,
    required String correct,
    required List<String> options,
  }) : super(
          question: question,
          correct: correct,
          options: options,
        );

  factory TriviaQuestionModel.fromJson(Map<String, dynamic> json) {
    return TriviaQuestionModel(
      question: json['question'],
      correct: json['correct'],
      options: List<String>.from(json['options']),
    );
  }
}
