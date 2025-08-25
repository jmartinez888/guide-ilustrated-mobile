// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/memory_table.dart';

class MemoryGamePage extends StatefulWidget {
  const MemoryGamePage({Key? key}) : super(key: key);

  @override
  _MemoryGamePageState createState() => _MemoryGamePageState();
}

class _MemoryGamePageState extends State<MemoryGamePage> {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
 
    final cards = [
      MemoryCardData(imagePath: "assets/memory/fruit/Aguaje.webp", title: "Aguaje"),
      MemoryCardData(imagePath: "assets/memory/fruit/Araza.webp", title: "Araza"),
      MemoryCardData(imagePath: "assets/memory/image0.png", title: "Bolsa mullaca 2"),
      MemoryCardData(imagePath: "assets/memory/fruit/Cashu.webp", title: "Cashu"),
      MemoryCardData(imagePath: "assets/memory/image1.png", title: "Chambira 2"),
      MemoryCardData(imagePath: "assets/memory/image2.png", title: "Cocona 2"),
    ];


    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Text(
            'Juego de Memoria',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.025,
             
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.02),
        child: MemoryTable(
          rows: 4, 
          columns: 3, 
          cards: cards,
        ),
      ),
    );
  }
}
