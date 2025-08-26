// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/memory_table.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/controller_game/controller_menory_game/controller_memory_game.dart';

class MemoryGamePage extends StatefulWidget {
  /// Claves válidas: "level_1", "level_2", "level_3", "level_4"
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
  late Future<List<MemoryCardData>> _cardsFuture;

  @override
  void initState() {
    super.initState();
    _cardsFuture = MemoryGameController.loadCards(levelKey: widget.levelKey);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
              rows: 4,      // 4 x 3 = 12 espacios (MemoryTable duplica internamente)
              columns: 3,   // Proveer 6 cartas únicas → 12 tras duplicación
              cards: cards, // 6 rutas + títulos desde el JSON
            ),
          );
        },
      ),
    );
  }
}
