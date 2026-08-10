import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:lottie/lottie.dart';
import 'package:shake/shake.dart';
import 'package:species/src/data/services/analytics_service.dart';

import 'package:species/src/data/repositories/local_trivia_repository_impl.dart';
import 'providers/trivia_provider.dart';
import 'widgets/dotted_background.dart';

class TriviaGamePage extends StatelessWidget {
  const TriviaGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TriviaProvider(repository: LocalTriviaRepositoryImpl()),
      child: const _TriviaGameView(),
    );
  }
}

class _TriviaGameView extends StatefulWidget {
  const _TriviaGameView({Key? key}) : super(key: key);

  @override
  State<_TriviaGameView> createState() => _TriviaGameViewState();
}

class _TriviaGameViewState extends State<_TriviaGameView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _arrowController;
  late final Animation<double> _arrowAnimation;
  late final ShakeDetector _shakeDetector;

  @override
  void initState() {
    super.initState();
    _arrowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);

    _arrowAnimation = Tween<double>(begin: -8.0, end: 8.0).animate(
      CurvedAnimation(parent: _arrowController, curve: Curves.easeInOut),
    );

    _shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: (_) {
        final provider = context.read<TriviaProvider>();
        if (!provider.isSpinning) {
          provider.spinWheel((selectedIndex) {
            _showQuestionDialog(selectedIndex);
          });
        }
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showInitialMessage();
      context.read<AnalyticsService>().logPlayGame(gameName: 'trivia');
    });
  }

  @override
  void dispose() {
    _shakeDetector.stopListening();
    _arrowController.dispose();
    super.dispose();
  }

  void _showInitialMessage() {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.3),
        builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Color(0xFFE8F5E9), // Light green background
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.energy_savings_leaf, // Leaf icon
                            color: Color(0xFF2E7D32),
                            size: 32,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Bienvenido a la\nTrivia de Especies",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Presiona el botón 'Girar' para\ncomenzar el juego y\nresponder preguntas sobre\nlas especies.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Entendido",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  void _showQuestionDialog(int categoryIndex) {
    final provider = context.read<TriviaProvider>();
    final questionData = provider.getRandomQuestionForCategory(categoryIndex);
    final categoryName = provider.categories[categoryIndex].category;

    provider.playSound('sounds/question.mp3');

    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.3),
        builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                title: Text(
                  "Pregunta de $categoryName",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        questionData.question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      ...questionData.options.map((option) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade200,
                              foregroundColor: Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              _showResultDialog(option, questionData.correct);
                            },
                            child: Text(option),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ));
  }

  void _showResultDialog(String selectedAnswer, String correctAnswer) {
    bool isCorrect = selectedAnswer == correctAnswer;
    final provider = context.read<TriviaProvider>();

    if (isCorrect) {
      provider.playSound('sounds/correct.mp3');
    } else {
      provider.playSound('sounds/incorrect.mp3');
    }

    showDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.3),
        builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                title: Text(
                  isCorrect ? "¡Correcto!" : "Incorrecto",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isCorrect ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isCorrect) ...[
                        const SizedBox(height: 10),
                        Lottie.asset('assets/lotties/Trofeo - green.json',
                            width: 150, height: 150),
                        const SizedBox(height: 10),
                        const Text(
                          '¡Respuesta Correcta!',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ] else ...[
                        const Icon(Icons.error_outline,
                            size: 80, color: Colors.redAccent),
                        const SizedBox(height: 16),
                        const Text(
                          "La respuesta correcta era:",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          correctAnswer,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
                actions: <Widget>[
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                      ),
                      child: const Text("Aceptar",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF7), // Off-white warm background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text(
          "Trivia de Especies",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: DottedBackground(
        child: Consumer<TriviaProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.categories.isEmpty) {
              return const Center(child: Text("No se encontraron categorías."));
            }

            Widget wheelWidget = FortuneWheel(
              animateFirst: false, // Prevents the initial spin
              physics: CircularPanPhysics(
                duration: const Duration(seconds: 3),
                curve: Curves.decelerate,
              ),
              selected: provider.selectedStream,
              indicators: <FortuneIndicator>[
                FortuneIndicator(
                  alignment: Alignment.topCenter,
                  child: AnimatedBuilder(
                    animation: _arrowAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _arrowAnimation.value),
                        child: child,
                      );
                    },
                    child: const TriangleIndicator(
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
              items: [
                for (int i = 0; i < provider.categories.length; i++)
                  FortuneItem(
                    style: FortuneItemStyle(
                      color: i % 2 == 0
                          ? const Color(0xFF2E6A4F) // Dark green
                          : const Color(0xFF95D5B2), // Light green
                      borderColor: Colors.white,
                      borderWidth: 2,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        provider.categories[i].category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              16, // The wheel resizes contents responsively by default but this sets a base
                        ),
                      ),
                    ),
                  ),
              ],
            );

            Widget buttonWidget = SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 4,
                ),
                onPressed: provider.isSpinning
                    ? null
                    : () {
                        provider.spinWheel((selectedIndex) {
                          _showQuestionDialog(selectedIndex);
                        });
                      },
                icon: const Icon(Icons.refresh, color: Colors.black87),
                label: Text(
                  provider.isSpinning ? "Girando..." : "Girar",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );

            if (isPortrait) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: wheelWidget,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0, top: 20.0),
                    child: buttonWidget,
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: wheelWidget,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0, left: 20.0),
                    child: Center(child: buttonWidget),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
