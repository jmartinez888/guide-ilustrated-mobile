import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:species/src/domain/entities/trivia_category.dart';
import 'package:species/src/domain/entities/trivia_question.dart';
import 'package:species/src/domain/repositories/trivia_repository.dart';

class TriviaProvider extends ChangeNotifier {
  final TriviaRepository _repository;
  final AudioPlayer _audioPlayer = AudioPlayer();
  final Random _random = Random();

  List<TriviaCategory> _categories = [];
  bool _isLoading = true;
  bool _isSpinning = false;
  
  // Controller for Fortune Wheel
  final StreamController<int> _selectedController = StreamController<int>.broadcast();

  TriviaProvider({required TriviaRepository repository}) : _repository = repository {
    _loadData();
  }

  List<TriviaCategory> get categories => _categories;
  bool get isLoading => _isLoading;
  bool get isSpinning => _isSpinning;
  Stream<int> get selectedStream => _selectedController.stream;

  Future<void> _loadData() async {
    _isLoading = true;
    notifyListeners();
    try {
      _categories = await _repository.getTriviaCategories();
    } catch (e) {
      debugPrint("Error loading trivia: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void spinWheel(Function(int) onSpinComplete) async {
    if (_isSpinning || _categories.isEmpty) return;

    _isSpinning = true;
    notifyListeners();
    _playSound('sounds/spin.mp3');

    final randomIndex = _random.nextInt(_categories.length);
    _selectedController.add(randomIndex);

    // Wait for the duration of the spin (3 seconds spin time + small delay)
    await Future.delayed(const Duration(seconds: 4));
    
    _isSpinning = false;
    notifyListeners();
    onSpinComplete(randomIndex);
  }

  TriviaQuestion getRandomQuestionForCategory(int categoryIndex) {
    final questions = _categories[categoryIndex].questions;
    return questions[_random.nextInt(questions.length)];
  }

  void playSound(String path) {
    _playSound(path);
  }

  Future<void> _playSound(String path) async {
    try {
      await _audioPlayer.play(AssetSource(path));
    } catch (e) {
      debugPrint("Error playing audio $path: $e");
    }
  }

  @override
  void dispose() {
    _selectedController.close();
    _audioPlayer.dispose();
    super.dispose();
  }
}
