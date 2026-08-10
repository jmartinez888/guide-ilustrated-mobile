import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/puzzle/widgets/puzzle_piece.dart';

class PuzzleGameController extends ChangeNotifier {
  final List<String> imagePaths = [
    'assets/puzzle/image1.webp',
    'assets/puzzle/image2.webp',
    'assets/puzzle/image3.webp'
  ];
  
  int currentImageIndex = 0;
  int gridSize = 4;
  bool isGameActive = false;
  bool gameCompleted = false;
  int secondsPassed = 0;
  Timer? _timer;
  ui.Image? currentImage;

  List<PuzzlePieceData> trayPieces = [];
  List<PuzzlePieceData?> boardPieces = [];

  PuzzleGameController() {
    _loadCurrentImage();
  }

  void selectImage(int index) {
    if (isGameActive) return; // Prevent changing image while playing
    currentImageIndex = index;
    _loadCurrentImage();
    notifyListeners();
  }

  Future<void> _loadCurrentImage() async {
    final completer = Completer<ui.Image>();
    final imageProvider = AssetImage(imagePaths[currentImageIndex]);
    final stream = imageProvider.resolve(const ImageConfiguration());
    stream.addListener(ImageStreamListener((ImageInfo info, bool _) {
      if (!completer.isCompleted) {
        completer.complete(info.image);
      }
    }));
    currentImage = await completer.future;
    notifyListeners();
  }

  void startGame(int newGridSize) {
    if (currentImage == null) return;
    
    gridSize = newGridSize;
    isGameActive = true;
    gameCompleted = false;
    secondsPassed = 0;
    
    _sliceImage();
    _startTimer();
    notifyListeners();
  }

  void resetGame() {
    isGameActive = false;
    gameCompleted = false;
    trayPieces.clear();
    boardPieces.clear();
    _stopTimer();
    secondsPassed = 0;
    notifyListeners();
  }

  void _sliceImage() {
    trayPieces.clear();
    boardPieces = List.generate(gridSize * gridSize, (index) => null);

    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        trayPieces.add(PuzzlePieceData(
          image: currentImage!,
          row: row,
          col: col,
          gridSize: gridSize,
        ));
      }
    }
    
    // Shuffle the pieces in the tray
    trayPieces.shuffle(Random());
  }

  void onPieceDropped(PuzzlePieceData piece, int targetRow, int targetCol) {
    // Check if the drop is valid (it matches the actual row/col of the piece)
    if (piece.row == targetRow && piece.col == targetCol) {
      final index = targetRow * gridSize + targetCol;
      boardPieces[index] = piece;
      trayPieces.remove(piece);
      
      _checkWinCondition();
      notifyListeners();
    }
  }

  void _checkWinCondition() {
    if (trayPieces.isEmpty) {
      gameCompleted = true;
      _stopTimer();
    }
  }

  void _startTimer() {
    _stopTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsPassed++;
      notifyListeners();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  String get formattedTime {
    int minutes = secondsPassed ~/ 60;
    int remainingSeconds = secondsPassed % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }
}
