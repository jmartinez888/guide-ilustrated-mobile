import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class PuzzlePieceData {
  final ui.Image image;
  final int row;
  final int col;
  final int gridSize;

  PuzzlePieceData({
    required this.image,
    required this.row,
    required this.col,
    required this.gridSize,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PuzzlePieceData &&
        other.row == row &&
        other.col == col &&
        other.gridSize == gridSize;
  }

  @override
  int get hashCode => row.hashCode ^ col.hashCode ^ gridSize.hashCode;
}

class PuzzlePiecePainter extends CustomPainter {
  final PuzzlePieceData data;

  PuzzlePiecePainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    final image = data.image;
    final row = data.row;
    final col = data.col;
    final gridSize = data.gridSize;

    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromLTWH(-size.width * col, -size.height * row, size.width * gridSize, size.height * gridSize),
      Paint(),
    );
  }

  @override
  bool shouldRepaint(covariant PuzzlePiecePainter oldDelegate) {
    return oldDelegate.data != data;
  }
}

class PuzzlePieceWidget extends StatelessWidget {
  final PuzzlePieceData data;

  const PuzzlePieceWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomPaint(
        painter: PuzzlePiecePainter(data: data),
      ),
    );
  }
}
