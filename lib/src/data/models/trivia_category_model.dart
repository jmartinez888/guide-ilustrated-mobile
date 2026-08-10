import 'package:species/src/domain/entities/trivia_category.dart';
import 'package:species/src/data/models/trivia_question_model.dart';

class TriviaCategoryModel extends TriviaCategory {
  TriviaCategoryModel({
    required String category,
    required List<TriviaQuestionModel> questions,
  }) : super(
          category: category,
          questions: questions,
        );

  factory TriviaCategoryModel.fromJson(Map<String, dynamic> json) {
    return TriviaCategoryModel(
      category: json['category'],
      questions: (json['questions'] as List)
          .map((q) => TriviaQuestionModel.fromJson(q))
          .toList(),
    );
  }
}
