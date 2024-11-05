import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class PuzzlePage extends StatefulWidget {
  @override
  _PuzzlePageState createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  List<PuzzlePiece> pieces = [];
  bool isGameActive = false;
  Timer? _timer;
  int secondsPassed = 0;
  int movesCount = 0;
  Offset emptyTile = Offset(3, 3);
  List<String> imagePaths = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png'
  ];
  int currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectImage(imagePaths[currentImageIndex]);
    _resetTimer();
  }

  void _startGame() {
    setState(() {
      _shufflePieces();
      _startTimer();
      movesCount = 0;
      isGameActive = true;
    });
  }

  void _resetGame() {
    setState(() {
      _selectImage(imagePaths[currentImageIndex]);
      _resetTimer();
      movesCount = 0;
      isGameActive = false;
    });
  }

  void _shufflePieces() {
    setState(() {
      pieces.shuffle(Random());
      emptyTile = Offset(3, 3);
    });
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        secondsPassed++;
      });
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    _timer = null;
    secondsPassed = 0;
  }

  void _onPieceTap(PuzzlePiece piece) {
    if (!isGameActive) return;
    if ((piece.currentPosition.dx - emptyTile.dx).abs() + (piece.currentPosition.dy - emptyTile.dy).abs() == 1) {
      setState(() {
        final temp = piece.currentPosition;
        piece.currentPosition = emptyTile;
        emptyTile = temp;
        movesCount++;
      });
    }
  }

  void _selectImage(String imagePath) async {
    pieces.clear();
    for (int row = 0; row < 4; row++) {
      for (int col = 0; col < 4; col++) {
        if (row == 3 && col == 3) continue;
        PuzzlePiece piece = PuzzlePiece(
          image: await _loadImage(imagePath),
          correctPosition: Offset(col.toDouble(), row.toDouble()),
          currentPosition: Offset(col.toDouble(), row.toDouble()),
          row: row,
          col: col,
        );
        pieces.add(piece);
      }
    }
    setState(() {}); // Llama a setState después de cargar las piezas
  }

  Future<ui.Image> _loadImage(String imagePath) async {
    final completer = Completer<ui.Image>();
    final image = AssetImage(imagePath);
    final stream = image.resolve(ImageConfiguration());
    stream.addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info.image);
    }));
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          _buildHeader(),
          _buildTimerAndMoves(),
          Expanded(child: _buildPuzzleGrid()),
          _buildImageSelector(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: isGameActive ? _resetGame : _startGame,
        child: Icon(isGameActive ? Icons.replay : Icons.play_arrow),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          'Puzzle Challenge',
          style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTimerAndMoves() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Icon(Icons.timer, color: Colors.white),
              Text(
                _formatTime(secondsPassed),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          Text(
            'Moves: $movesCount',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  Widget _buildPuzzleGrid() {
    // Verifica si hay piezas para mostrar
    if (pieces.isEmpty) {
      return Center(child: CircularProgressIndicator()); // Muestra un cargador mientras se cargan las imágenes
    }

    return GridView.builder(
      itemCount: pieces.length, // Cambia a pieces.length
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) {
        final piece = pieces[index];
        return GestureDetector(
          onTap: () => _onPieceTap(piece),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: ClipRect(
              child: CustomPaint(
                painter: PuzzlePiecePainter(
                  image: piece.image,
                  row: piece.row,
                  col: piece.col,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageSelector() {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentImageIndex = index;
                _selectImage(imagePaths[currentImageIndex]);
              });
            },
            child: Container(
              width: 80,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: currentImageIndex == index ? Colors.white : Colors.transparent,
                ),
              ),
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class PuzzlePiece {
  final ui.Image image; // Cambia el tipo a ui.Image
  final Offset correctPosition;
  Offset currentPosition;
  final int row;
  final int col;

  PuzzlePiece({
    required this.image,
    required this.correctPosition,
    required this.currentPosition,
    required this.row,
    required this.col,
  });
}

class PuzzlePiecePainter extends CustomPainter {
  final ui.Image image; // Cambia el tipo a ui.Image
  final int row;
  final int col;

  PuzzlePiecePainter({required this.image, required this.row, required this.col});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromLTWH(-size.width * col, -size.height * row, size.width * 4, size.height * 4),
      Paint(),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
