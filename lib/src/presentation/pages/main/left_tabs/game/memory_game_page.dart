// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/memory_table.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/controller_game/controller_menory_game/controller_memory_game.dart';

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

    // 🔊 Arranca BGM en loop
    _startLoopingBgm();

    // Muestra overlay una sola vez
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
    // Opcional: optimiza el contexto de audio para reproducción continua
    // (no es obligatorio, pero ayuda a evitar cortes por enfoque de audio).
    try {
      await _audioPlayer.setReleaseMode(ReleaseMode.loop);
      await _audioPlayer.setVolume(1.0);

      // Usa la ruta EXACTA del asset declarada en pubspec.yaml
      await _audioPlayer.play(
        AssetSource(
            'assets/memory/sounds/5-strawberry-mousse-cute-bgm-274668.mp3'),
      );
    } catch (_) {
      // en caso de diferencia de versión del plugin, intenta sin el prefijo 'assets/'
      try {
        await _audioPlayer.play(
          AssetSource(
              'memory/sounds/5-strawberry-mousse-cute-bgm-274668.mp3'),
        );
      } catch (_) {
        // evita crashear; el juego sigue sin música
      }
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

  // (Opcional) si quieres que al minimizar la app siga sonando mientras no salgas de la vista,
  // NO pares aquí. Sólo se detiene en dispose al abandonar la pantalla.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // intencionalmente vacío: no pausamos el audio mientras esta vista esté montada
  }

  void _handleLevelCompleted() {
    final bool hasMore = _currentLevelIndex + 1 < _totalLevels;

    setState(() {
      if (hasMore) {
        _currentLevelIndex++;
      } else {
        // _currentLevelIndex = 0; // si quisieras reiniciar
      }
      _cardsFuture =
          MemoryGameController.loadCards(levelKey: _currentLevelKey);
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
