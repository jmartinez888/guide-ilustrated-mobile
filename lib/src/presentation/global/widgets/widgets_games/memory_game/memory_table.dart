// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/card_little.dart';
import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/simple_button.dart';

class MemoryCardData {
  final String imagePath;
  final String title;

  MemoryCardData({required this.imagePath, required this.title});
}

class MemoryTable extends StatefulWidget {
  final int rows;
  final int columns;
  final List<MemoryCardData> cards;

  const MemoryTable({
    Key? key,
    required this.rows,
    required this.columns,
    required this.cards,
  }) : super(key: key);

  @override
  _MemoryTableState createState() => _MemoryTableState();
}

class _MemoryTableState extends State<MemoryTable> {
  late List<_CardStateData> _cardStates;
  bool _gameStarted = false; 
  _CardStateData? _firstSelected;
  bool _lockBoard = true; 

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    List<MemoryCardData> allCards = [];
    allCards.addAll(widget.cards);
    allCards.addAll(widget.cards); 

    allCards.shuffle(Random());

  
    _cardStates = allCards
        .map((c) => _CardStateData(card: c, revealed: false, matched: false))
        .toList();
  }

  void _startGame() {
    setState(() {
      _gameStarted = true;
      _lockBoard = true; 
      for (var c in _cardStates) {
        c.revealed = true;
      }
    });

   
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        for (var c in _cardStates) {
          if (!c.matched) {
            c.revealed = false;
          }
        }
        _lockBoard = false; 
      });
    });
  }

  void _onCardTap(int index) {
    if (_lockBoard) return;
    if (_cardStates[index].matched || _cardStates[index].revealed) return;

    setState(() {
      _cardStates[index].revealed = true;
    });

    if (_firstSelected == null) {
      _firstSelected = _cardStates[index];
    } else {
      _lockBoard = true;
      final secondSelected = _cardStates[index];

      if (_firstSelected!.card.imagePath == secondSelected.card.imagePath &&
          _firstSelected!.card.title == secondSelected.card.title) {
        // ✅ Par correcto
        setState(() {
          _firstSelected!.matched = true;
          secondSelected.matched = true;
        });
        _resetSelection();
      } else {
       
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _firstSelected!.revealed = false;
            secondSelected.revealed = false;
          });
          _resetSelection();
        });
      }
    }
  }

  void _resetSelection() {
    _firstSelected = null;
    _lockBoard = false;
  }

  @override
  Widget build(BuildContext context) {
    int totalCards = widget.rows * widget.columns;
    if (_cardStates.length < totalCards) {
      return const Center(child: Text("No hay suficientes cartas para el tablero"));
    }

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
       children: [

      Positioned(
        top: screenHeight * 0.08,   
        left: screenWidth * 0.02,  
        right: screenWidth * 0.02,
        bottom: screenHeight * 0.0,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.columns,
          ),
          itemCount: totalCards,
          itemBuilder: (context, index) {
            final card = _cardStates[index];
            return GestureDetector(
              onTap: () => _onCardTap(index),
              child: CardLittle(
                imagePath: card.card.imagePath,
                title: card.card.title,
                revealed: card.revealed || card.matched,
              ),
            );
          },
        ),
      ),

   
        if (!_gameStarted)
          Positioned(
            bottom: screenHeight * 0.02, 
            left: 0,
            right: 0,
            child: Center(
              child: SimpleButton(
                text: "Iniciar",
                onPressed: _startGame,
              ),
            ),
          ),
      ],
    );
  }
}

class _CardStateData {
  final MemoryCardData card;
  bool revealed;
  bool matched;

  _CardStateData({
    required this.card,
    this.revealed = false,
    this.matched = false,
  });
}
