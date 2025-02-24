import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

class MemoryGamePage extends StatefulWidget {
  const MemoryGamePage({Key? key}) : super(key: key);

  @override
  _MemoryGamePageState createState() => _MemoryGamePageState();
}

class _MemoryGamePageState extends State<MemoryGamePage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  final int totalSeconds = 50;
  Timer? timer;
  int secondsRemaining = 50;
  bool showImages = false;
  bool gameStarted = false;
  bool gameOver = false;

  List<String> images = [
    'assets/memory/image1.png',
    'assets/memory/image2.png',
    'assets/memory/image3.png',
    'assets/memory/image4.png',
    'assets/memory/image5.png',
    'assets/memory/image6.png',
    'assets/memory/image7.png',
    'assets/memory/image8.png',
    'assets/memory/image9.png',
    'assets/memory/image0.png',
    'assets/memory/image1.png',
    'assets/memory/image2.png',
    'assets/memory/image3.png',
    'assets/memory/image4.png',
    'assets/memory/image5.png',
    'assets/memory/image6.png',
    'assets/memory/image7.png',
    'assets/memory/image8.png',
    'assets/memory/image9.png',
    'assets/memory/image0.png',
  ];

  late List<bool> revealedImages;
  int firstSelectedIndex = -1;
  int secondSelectedIndex = -1;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    images.shuffle();
    revealedImages = List.generate(images.length, (_) => false);
    _showWelcomeMessage();
  }

  void _showWelcomeMessage() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('¡Bienvenido al Juego de Memoria!'),
          content: const Text(
            'Encuentra todos los pares antes de que se acabe el tiempo. '
            'Pulsa en cada tarjeta para descubrir su imagen y trata de recordar su posición. '
            '¡Buena suerte!',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Entendido'),
            ),
          ],
        ),
      );
    });
  }

  void startGame() {
    setState(() {
      showImages = true;
      gameStarted = true;
      gameOver = false;
      secondsRemaining = totalSeconds;
      revealedImages = List.generate(images.length, (_) => false);
      firstSelectedIndex = -1;
      secondSelectedIndex = -1;
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        showImages = false;
      });
      startCountdown();
    });
  }

  void startCountdown() {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPlayer.play(AssetSource('sounds/clock.mp3'));
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer.cancel();
        endGame();
      }
    });
  }

  void revealImage(int index) {
    if (!gameStarted || showImages || revealedImages[index]) return;

    setState(() {
      if (firstSelectedIndex == -1) {
        firstSelectedIndex = index;
        revealedImages[index] = true;
      } else if (secondSelectedIndex == -1 && index != firstSelectedIndex) {
        secondSelectedIndex = index;
        revealedImages[index] = true;

        Future.delayed(const Duration(milliseconds: 800), () {
          checkMatch();
        });
      }
    });
  }

  void checkMatch() {
    if (images[firstSelectedIndex] == images[secondSelectedIndex]) {
      if (revealedImages.every((revealed) => revealed)) {
        showCongratulations();
      }
    } else {
      setState(() {
        revealedImages[firstSelectedIndex] = false;
        revealedImages[secondSelectedIndex] = false;
      });
    }
    firstSelectedIndex = -1;
    secondSelectedIndex = -1;
  }

  void resetGame() {
    timer?.cancel();
    audioPlayer.stop();
    setState(() {
      gameStarted = false;
      showImages = false;
      gameOver = false;
      secondsRemaining = totalSeconds;
      revealedImages = List.generate(images.length, (_) => false);
      images.shuffle();
    });
  }

  void endGame() {
    if (timer!.isActive) {
      timer?.cancel();
    }
    audioPlayer.stop();
    audioPlayer.setReleaseMode(ReleaseMode.stop);
    audioPlayer.play(AssetSource('sounds/incorrect.mp3'));
    setState(() {
      gameStarted = false;
      gameOver = true;
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¡Tiempo agotado!'),
        content: const Text('El juego ha terminado. Precione reiniciar'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              audioPlayer.stop();
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  void showCongratulations() {
    audioPlayer.setReleaseMode(ReleaseMode.stop);
    audioPlayer.play(AssetSource('sounds/correct.mp3'));
    timer?.cancel();
    setState(() {
      gameStarted = false;
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¡Felicidades!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Has encontrado todos los pares antes de que termine el tiempo.'),
            const SizedBox(height: 20),
            Lottie.asset('assets/lotties/Trofeo - green.json', width: 150, height: 150),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              audioPlayer.stop();
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    timer?.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 40.0),
          child: Text('Juego de Memoria'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tiempo restante: ${secondsRemaining}s',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.0,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => revealImage(index),
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: (showImages || revealedImages[index])
                        ? Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          )
                        : Container(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (gameOver) {
                resetGame(); // Jugar de nuevo
              } else if (gameStarted) {
                resetGame(); // Reiniciar juego
              } else {
                startGame(); // Iniciar juego
              }
            },
            child: Text(
              gameOver
                  ? 'Jugar de nuevo'
                  : gameStarted
                      ? 'Comenzar otra vez'
                      : 'Iniciar juego',
            ),
          ),
        ],
      ),
    );
  }
}
