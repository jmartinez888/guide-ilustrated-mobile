// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/simple_button.dart';
import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/card_little.dart';

class MemoryGamePage extends StatefulWidget {
  const MemoryGamePage({Key? key}) : super(key: key);

  @override
  _MemoryGamePageState createState() => _MemoryGamePageState();
}

class _MemoryGamePageState extends State<MemoryGamePage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardLittle(
              imagePath: 'assets/memory/fruit/Pijuayo.webp',  // Ruta de la imagen
              title: 'Frutas Test',  // Título que se mostrará en la tarjeta
            ),
          ],
        ),
      ),
    );
  }
}