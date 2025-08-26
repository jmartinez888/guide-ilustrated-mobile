// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/memory_table.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/controller_game/controller_menory_game/controller_memory_game.dart';

class MemoryGamePage extends StatefulWidget {
  /// Claves válidas: "level_1", "level_2", "level_3", "level_4" (o las que existan en tu JSON)
  final String levelKey;

  const MemoryGamePage({
    Key? key,
    this.levelKey = 'level_1',
  }) : super(key: key);

  @override
  _MemoryGamePageState createState() => _MemoryGamePageState();
}

class _MemoryGamePageState extends State<MemoryGamePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  late Future<void> _bootstrapFuture;
  late Future<List<MemoryCardData>> _cardsFuture;

  List<String> _levelKeys = [];
  int _currentLevelIndex = 0;

  int get _totalLevels => _levelKeys.length;
  String get _currentLevelKey => _levelKeys[_currentLevelIndex];

  @override
  void initState() {
    super.initState();
    _bootstrapFuture = _bootstrap();
  }

  Future<void> _bootstrap() async {
    _levelKeys = await MemoryGameController.loadLevelKeys();
    _currentLevelIndex = await MemoryGameController.indexOfLevelKey(widget.levelKey);
    _cardsFuture = MemoryGameController.loadCards(levelKey: _currentLevelKey);
  }

  /// Llamado cuando se emparejan todas las parejas del nivel actual.
  /// Dejamos el tablero listo para que, al presionar "Iniciar" nuevamente,
  /// arranque el siguiente nivel (con su vista previa y ocultado, como ya tienes).
  void _handleLevelCompleted() {
    final bool hasMore = _currentLevelIndex + 1 < _totalLevels;

    setState(() {
      if (hasMore) {
        _currentLevelIndex++;
      } else {
        // Si ya terminó el último, te quedas en el último nivel listo para repetir.
        // (Si prefieres reiniciar al level_1, descomenta la línea siguiente)
        // _currentLevelIndex = 0;
      }
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
                  // NO tocamos estilos visuales existentes
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
                  key: ValueKey('level_${_currentLevelIndex}'), // fuerza reset limpio del tablero
                  rows: 4,                   // 4 x 3 = 12 espacios
                  columns: 3,                // 6 cartas únicas → 12 tras duplicación
                  cards: cards,              // rutas + títulos del JSON
                  // 👇 Lógica nueva (solo comportamiento):
                  onAllPairsMatched: _handleLevelCompleted,
                  // Si tu UI ya tiene un indicador de progreso, con esto tendrá los valores:
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
