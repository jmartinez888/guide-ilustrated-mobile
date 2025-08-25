// ignore_for_file: library_private_types_in_public_api, unused_field

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:audioplayers/audioplayers.dart';

import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/memory_table.dart';

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
    _cardsFuture = _loadCards(widget.levelKey);
  }

  Future<List<MemoryCardData>> _loadCards(String levelKey) async {
    // Lee el JSON desde assets (asegúrate de declararlo en pubspec.yaml)
    final String raw = await rootBundle.loadString('assets/json/leves.json');
    final Map<String, dynamic> jsonMap = json.decode(raw) as Map<String, dynamic>;

    if (!jsonMap.containsKey(levelKey)) {
      throw Exception('Nivel no encontrado: $levelKey');
    }

    final List<dynamic> items = jsonMap[levelKey] as List<dynamic>;
    // Toma exactamente 6 (o menos si no alcanzan)
    final int take = items.length >= 6 ? 6 : items.length;

    final List<MemoryCardData> cards = items.take(take).map((e) {
      final map = e as Map<String, dynamic>;
      return MemoryCardData(
        imagePath: (map['path'] ?? '').toString(),
        title: (map['name'] ?? '').toString(),
      );
    }).toList();

    if (cards.isEmpty) {
      throw Exception('El nivel $levelKey no tiene imágenes disponibles.');
    }
    return cards;
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
            return const Center(
              child: CircularProgressIndicator(),
            );
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
