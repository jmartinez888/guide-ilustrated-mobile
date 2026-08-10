import 'package:species/src/domain/entities/trivia_category.dart';

abstract class TriviaRepository {
  Future<List<TriviaCategory>> getTriviaCategories();
}
