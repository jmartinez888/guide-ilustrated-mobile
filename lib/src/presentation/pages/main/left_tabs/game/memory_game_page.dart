// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/memory_table.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/controller_game/controller_menory_game/controller_memory_game.dart';
import 'package:lottie/lottie.dart';
// Overlay
import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/overley.dart'
    as intro_overlay;

class MemoryGamePage extends StatefulWidget {
  final String levelKey;

  const MemoryGamePage({
    Key? key,
    this.levelKey = 'level_1',
  }) : super(key: key);

  @override
  _MemoryGamePageState createState() => _MemoryGamePageState();
}

class _MemoryGamePageState extends State<MemoryGamePage>
    with WidgetsBindingObserver {
  final AudioPlayer _audioPlayer = AudioPlayer();

  late Future<void> _bootstrapFuture;
  late Future<List<MemoryCardData>> _cardsFuture;

  List<String> _levelKeys = [];
  int _currentLevelIndex = 0;

  bool _introOverlayShown = false;

  int get _totalLevels => _levelKeys.length;
  String get _currentLevelKey => _levelKeys[_currentLevelIndex];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _bootstrapFuture = _bootstrap();

    // 🔊 BGM loop
    _startLoopingBgm();

    // Overlay de bienvenida una sola vez
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _introOverlayShown) return;
      _introOverlayShown = true;
      intro_overlay.showMemoryIntroOverlay(
        context,
        message:
            'Bienvenido al juego de memoria, te deseo mucha suerte para completar el desafío',
      );
    });
  }

  Future<void> _bootstrap() async {
    _levelKeys = await MemoryGameController.loadLevelKeys();
    _currentLevelIndex =
        await MemoryGameController.indexOfLevelKey(widget.levelKey);
    _cardsFuture =
        MemoryGameController.loadCards(levelKey: _currentLevelKey);
  }

  /// 🔊 Configura y reproduce el BGM en bucle.
  Future<void> _startLoopingBgm() async {
    try {
      await _audioPlayer.setReleaseMode(ReleaseMode.loop);
      await _audioPlayer.setVolume(1.0);
      await _audioPlayer.play(
         AssetSource('assets/memory/sounds/5-strawberry-mousse-cute-bgm-274668.mp3'),
      );
    } catch (_) {
      try {
        await _audioPlayer.play(
           AssetSource('memory/sounds/5-strawberry-mousse-cute-bgm-274668.mp3'),
        );
      } catch (_) {}
    }
  }

  /// 🛑 Detiene el BGM cuando sales de la vista.
  Future<void> _stopBgm() async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.release();
    } catch (_) {}
  }

  @override
  void dispose() {
    _stopBgm();
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // intencionalmente vacío: mantenemos el audio mientras la vista esté montada
  }

  // ✅ Avance de nivel o trofeo + reset a level_1
// Reemplaza tu método actual
void _handleLevelCompleted() async {
  final bool isLast = (_currentLevelIndex + 1) >= _totalLevels;

  if (!isLast) {
    final completed = _currentLevelIndex + 1;
    final next = _currentLevelIndex + 2;

    // 1) Mostrar overlay de felicitación (esperamos a que se cierre)
    await intro_overlay.showMemoryIntroOverlay(
      context,
      message: '¡Nivel $completed completado! ¡Vamos por el nivel $next!',
      // opcional: puedes pasar otro Lottie si quieres
      // lottieAsset: 'assets/memory/animation/NIO-ANIMACION 2.json',
    );

    if (!mounted) return;

    // 2) Avanzar al siguiente nivel y recargar cartas
    setState(() {
      _currentLevelIndex++;
      _cardsFuture = MemoryGameController.loadCards(levelKey: _currentLevelKey);
    });
  } else {
    // Último nivel → trofeo y reset a nivel 1
    _showTrophyAndReset();
  }
}


Future<void> _showTrophyAndReset() async {
  if (!mounted) return;
  final size = MediaQuery.of(context).size;
  final h = size.height;
  final w = size.width;

  final nav = Navigator.of(context, rootNavigator: true);

await showGeneralDialog(
  context: context,
  barrierDismissible: false,
  barrierLabel: 'trophy-overlay',
  barrierColor: Colors.black54,
  transitionDuration: const Duration(milliseconds: 200),
  pageBuilder: (_, __, ___) {
    return Center(
      child: Container(
        width: w * 0.60,
        height: h * 0.40,
        decoration: BoxDecoration(
          color: Colors.white,                 // ⬅️ fondo blanco
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(h * 0.02),     // opcional
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Lottie.asset(
            'assets/lotties/Trofeo - green.json',
            fit: BoxFit.contain,
            repeat: false,
            onLoaded: (composition) {
              Future.delayed(composition.duration, () {
                if (nav.canPop()) nav.pop();
              });
            },
          ),
        ),
      ),
    );
  },
  transitionBuilder: (context, anim, _, child) {
    final curved = CurvedAnimation(parent: anim, curve: Curves.easeOut);
    return FadeTransition(opacity: curved, child: child);
  },
);


  if (!mounted) return;
  setState(() {
    _currentLevelIndex = 0; // volver a level_1
    _cardsFuture = MemoryGameController.loadCards(levelKey: _currentLevelKey);
  });
}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FutureBuilder<void>(
      future: _bootstrapFuture,
      builder: (context, snapBoot) {
        if (snapBoot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapBoot.hasError) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.06),
                child: Text(
                  'Error iniciando niveles:\n${snapBoot.error}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: size.height * 0.02,
                  ),
                ),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: EdgeInsets.only(left: size.width * 0.10),
              child: Text(
                'Juego de Memoria',
                style: TextStyle(
                  fontSize: size.height * 0.025,
                ),
              ),
            ),
          ),
          body: FutureBuilder<List<MemoryCardData>>(
            future: _cardsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.06),
                    child: Text(
                      'Error al cargar el nivel:\n${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: size.height * 0.02,
                      ),
                    ),
                  ),
                );
              }

              final cards = snapshot.data!;
              return Padding(
                padding: EdgeInsets.zero,
                child: MemoryTable(
                  key: ValueKey('level_${_currentLevelIndex}'),
                  rows: 4,
                  columns: 3,
                  cards: cards,
                  onAllPairsMatched: _handleLevelCompleted,
                  currentLevel: _currentLevelIndex + 1,
                  totalLevels: _totalLevels,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
