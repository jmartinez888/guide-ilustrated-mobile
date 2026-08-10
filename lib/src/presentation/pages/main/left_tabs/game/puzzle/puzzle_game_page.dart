import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:species/src/data/services/analytics_service.dart';

import 'package:species/src/presentation/global/utils/responsive.dart';
import 'package:species/src/presentation/global/widgets/intro_dialog.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/puzzle/controllers/puzzle_game_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/puzzle/widgets/puzzle_board.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/puzzle/widgets/puzzle_tray.dart';

import 'package:species/src/presentation/pages/main/left_tabs/game/trivia/widgets/dotted_background.dart';

class PuzzleGamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PuzzleGameController(),
      child: const _PuzzleGameView(),
    );
  }
}

class _PuzzleGameView extends StatefulWidget {
  const _PuzzleGameView({Key? key}) : super(key: key);

  @override
  __PuzzleGameViewState createState() => __PuzzleGameViewState();
}

class __PuzzleGameViewState extends State<_PuzzleGameView> {
  bool _introOverlayShown = false;

  @override
  void initState() {
    super.initState();
    context.read<AnalyticsService>().logPlayGame(gameName: 'puzzle');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _introOverlayShown) return;
      _introOverlayShown = true;
      showIntroDialog(
        context,
        title: 'Rompecabezas',
        message: 'Bienvenido al rompecabezas. Toca iniciar, elige la dificultad y arrastra las piezas al tablero para ganar.',
        icon: Icons.extension_outlined,
      );
    });
  }

  void _showDifficultyDialog(BuildContext context, PuzzleGameController controller) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (BuildContext dialogContext) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 350),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Nivel de Dificultad',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      _DifficultyButton(title: 'Muy Fácil (2x2)', onTap: () {
                        Navigator.pop(dialogContext);
                        controller.startGame(2);
                      }),
                      const SizedBox(height: 12),
                      _DifficultyButton(title: 'Fácil (3x3)', onTap: () {
                        Navigator.pop(dialogContext);
                        controller.startGame(3);
                      }),
                      const SizedBox(height: 12),
                      _DifficultyButton(title: 'Normal (4x4)', onTap: () {
                        Navigator.pop(dialogContext);
                        controller.startGame(4);
                      }),
                      const SizedBox(height: 12),
                      _DifficultyButton(title: 'Medio (5x5)', onTap: () {
                        Navigator.pop(dialogContext);
                        controller.startGame(5);
                      }),
                      const SizedBox(height: 12),
                      _DifficultyButton(title: 'Difícil (6x6)', onTap: () {
                        Navigator.pop(dialogContext);
                        controller.startGame(6);
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showWinDialog(BuildContext context, PuzzleGameController controller) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.3),
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 350),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "¡Felicitaciones!",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      const SizedBox(height: 16),
                      const Text("Has armado correctamente la imagen.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 16),
                      Lottie.asset('assets/lotties/Trofeo - green.json', width: 120, height: 120),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                          ),
                          onPressed: () {
                            Navigator.pop(dialogContext);
                            controller.resetGame();
                          },
                          child: const Text("Aceptar", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTimer(PuzzleGameController controller, Responsive responsive) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.timer, color: Colors.orange, size: 28),
          const SizedBox(width: 8),
          Text(
            controller.formattedTime,
            style: TextStyle(
              fontSize: responsive.dp(2.5),
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlsAndImages(BuildContext context, PuzzleGameController controller, Responsive responsive, Axis axis) {
    final bool isVertical = axis == Axis.vertical;
    
    final startButton = SizedBox(
      height: isVertical ? 60 : 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: controller.isGameActive ? Colors.redAccent : Colors.orange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () {
          if (controller.isGameActive) {
            controller.resetGame();
          } else {
            _showDifficultyDialog(context, controller);
          }
        },
        child: Icon(
          controller.isGameActive ? Icons.stop_rounded : Icons.play_arrow_rounded,
          color: Colors.white,
          size: 32,
        ),
      ),
    );

    final imageList = Container(
      height: isVertical ? null : 60,
      width: isVertical ? double.infinity : null,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: ListView.builder(
        scrollDirection: axis,
        itemCount: controller.imagePaths.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final bool isSelected = controller.currentImageIndex == index;
          return GestureDetector(
            onTap: () {
              if (!controller.isGameActive) {
                controller.selectImage(index);
              }
            },
            child: Opacity(
              opacity: controller.isGameActive ? 0.5 : 1.0,
              child: Container(
                width: isVertical ? double.infinity : 60,
                height: isVertical ? 80 : double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? Colors.orange : Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    controller.imagePaths[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

    if (isVertical) {
      return Column(
        children: [
          _buildTimer(controller, responsive),
          startButton,
          const SizedBox(height: 8),
          Expanded(child: imageList),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(flex: 1, child: startButton),
          const SizedBox(width: 16),
          Expanded(flex: 3, child: imageList),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final controller = context.watch<PuzzleGameController>();

    if (controller.gameCompleted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (ModalRoute.of(context)?.isCurrent == true) {
          _showWinDialog(context, controller);
        }
      });
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Text(
          'Rompecabezas',
          style: TextStyle(
            color: Colors.black87,
            fontSize: responsive.dp(responsive.isTablet ? 2.0 : 2.5),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: DottedBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.wp(4),
            vertical: responsive.hp(1),
          ),
          child: MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Center(
                              child: PuzzleBoard(controller: controller, responsive: responsive),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: PuzzleTray(
                        controller: controller,
                        responsive: responsive,
                        axis: Axis.vertical,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: _buildControlsAndImages(context, controller, responsive, Axis.vertical),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _buildTimer(controller, responsive),
                    Expanded(
                      child: Center(
                        child: PuzzleBoard(controller: controller, responsive: responsive),
                      ),
                    ),
                    PuzzleTray(
                      controller: controller,
                      responsive: responsive,
                      axis: Axis.horizontal,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: responsive.hp(2)),
                      child: _buildControlsAndImages(context, controller, responsive, Axis.horizontal),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _DifficultyButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _DifficultyButton({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        onPressed: onTap,
        child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}
