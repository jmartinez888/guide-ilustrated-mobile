import 'package:flutter/material.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/puzzle/controllers/puzzle_game_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/puzzle/widgets/puzzle_piece.dart';
import 'package:species/src/presentation/global/utils/responsive.dart';

class PuzzleBoard extends StatelessWidget {
  final PuzzleGameController controller;
  final Responsive responsive;

  const PuzzleBoard({
    Key? key,
    required this.controller,
    required this.responsive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.currentImage == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!controller.isGameActive) {
      // Muestra la imagen completa antes de empezar
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange.shade300, width: 2),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: RawImage(
            image: controller.currentImage,
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    // Tablero vacío con DragTargets
    final int gridSize = controller.gridSize;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange.shade300, width: 2),
        color: Colors.white.withOpacity(0.5),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridSize,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          itemCount: gridSize * gridSize,
          itemBuilder: (context, index) {
            final row = index ~/ gridSize;
            final col = index % gridSize;
            final placedPiece = controller.boardPieces[index];

            return DragTarget<PuzzlePieceData>(
              builder: (context, candidateData, rejectedData) {
                if (placedPiece != null) {
                  return PuzzlePieceWidget(data: placedPiece);
                }
                bool isHovering = candidateData.isNotEmpty;
                return Container(
                  color: isHovering ? Colors.orange.withOpacity(0.3) : Colors.grey.withOpacity(0.1),
                  child: isHovering 
                    ? const Icon(Icons.download_rounded, color: Colors.orange, size: 20)
                    : null,
                );
              },
              onWillAccept: (data) => placedPiece == null,
              onAccept: (data) {
                if (data.row == row && data.col == col) {
                  controller.onPieceDropped(data, row, col);
                } else {
                  // Opcional: Sonido de error o feedback
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pieza incorrecta, intenta de nuevo.'),
                      duration: Duration(milliseconds: 500),
                    )
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
