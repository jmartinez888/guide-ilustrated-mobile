import 'package:flutter/material.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/puzzle/controllers/puzzle_game_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/puzzle/widgets/puzzle_piece.dart';
import 'package:species/src/presentation/global/utils/responsive.dart';

class PuzzleTray extends StatelessWidget {
  final PuzzleGameController controller;
  final Responsive responsive;
  final Axis axis;

  const PuzzleTray({
    Key? key,
    required this.controller,
    required this.responsive,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!controller.isGameActive || controller.trayPieces.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      height: axis == Axis.horizontal ? responsive.hp(14) : null,
      width: axis == Axis.vertical ? responsive.wp(15) : null,
      margin: axis == Axis.horizontal 
          ? EdgeInsets.symmetric(vertical: responsive.hp(1))
          : EdgeInsets.symmetric(horizontal: responsive.wp(1)),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.orange.shade300, width: 2),
      ),
      child: ListView.builder(
        scrollDirection: axis,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(responsive.wp(2)),
        itemCount: controller.trayPieces.length,
        itemBuilder: (context, index) {
          final pieceData = controller.trayPieces[index];
          // Use wp or hp depending on axis to ensure pieces are large enough
          final double pieceSize = axis == Axis.horizontal ? responsive.hp(10) : responsive.wp(10);

          return Padding(
            padding: axis == Axis.horizontal
                ? EdgeInsets.symmetric(horizontal: responsive.wp(1.5))
                : EdgeInsets.symmetric(vertical: responsive.hp(1.5)),
            child: Draggable<PuzzlePieceData>(
              data: pieceData,
              feedback: SizedBox(
                width: pieceSize * 1.2,
                height: pieceSize * 1.2,
                child: Opacity(
                  opacity: 0.8,
                  child: PuzzlePieceWidget(data: pieceData),
                ),
              ),
              childWhenDragging: SizedBox(
                width: pieceSize,
                height: pieceSize,
                child: Container(
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
              child: SizedBox(
                width: pieceSize,
                height: pieceSize,
                child: PuzzlePieceWidget(data: pieceData),
              ),
            ),
          );
        },
      ),
    );
  }
}
