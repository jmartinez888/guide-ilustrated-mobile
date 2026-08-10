import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:species/src/domain/entities/trivia_category.dart';
import 'package:species/src/domain/repositories/trivia_repository.dart';
import 'package:species/src/data/models/trivia_category_model.dart';

class LocalTriviaRepositoryImpl implements TriviaRepository {
  @override
  Future<List<TriviaCategory>> getTriviaCategories() async {
    try {
      final jsonString = await rootBundle.loadString('assets/json/trivia_questions.json');
      final List<dynamic> jsonResponse = json.decode(jsonString);
      return jsonResponse.map((data) => TriviaCategoryModel.fromJson(data)).toList();
    } catch (e) {
      throw Exception('Failed to load trivia data: $e');
    }
  }
}
