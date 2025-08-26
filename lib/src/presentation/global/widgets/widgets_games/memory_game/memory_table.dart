// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/card_little.dart';
import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/simple_button.dart';
import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/progress_bar.dart';

class MemoryCardData {
  final String imagePath;
  final String title;

  MemoryCardData({required this.imagePath, required this.title});
}

class MemoryTable extends StatefulWidget {
  final int rows;
  final int columns;
  final List<MemoryCardData> cards;

  /// NUEVO: callback cuando se emparejaron todas las parejas del tablero.
  final VoidCallback? onAllPairsMatched;

  /// NUEVO: progreso externo por nivel (opcional).
  /// Si ambos vienen, la ProgressBar muestra nivel actual vs total de niveles del JSON.
  /// Si no vienen, la ProgressBar sigue mostrando el avance de PAREJAS del tablero (comportamiento anterior).
  final int? currentLevel;
  final int? totalLevels;

  const MemoryTable({
    Key? key,
    required this.rows,
    required this.columns,
    required this.cards,
    this.onAllPairsMatched,
    this.currentLevel,
    this.totalLevels,
  }) : super(key: key);

  @override
  _MemoryTableState createState() => _MemoryTableState();
}

class _MemoryTableState extends State<MemoryTable> {
  late List<_CardStateData> _cardStates;
  bool _gameStarted = false;
  _CardStateData? _firstSelected;
  bool _lockBoard = true;

  // ⏱️ Timers y contadores
  Timer? _revealTimer;
  Timer? _elapsedTimer;
  int _revealSeconds = 3;   // cuenta regresiva de memorización
  int _elapsedSeconds = 0;  // tiempo desde que termina la memorización
  bool _gameCompleted = false;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  @override
  void dispose() {
    _revealTimer?.cancel();
    _elapsedTimer?.cancel();
    super.dispose();
  }

  void _initializeBoard() {
    final allCards = <MemoryCardData>[
      ...widget.cards,
      ...widget.cards,
    ]..shuffle(Random());

    _cardStates = allCards
        .map((c) => _CardStateData(card: c, revealed: false, matched: false))
        .toList();
  }

  void _startGame() {
    // reset de estado de timers y contadores
    _revealTimer?.cancel();
    _elapsedTimer?.cancel();
    _revealSeconds = 3;
    _elapsedSeconds = 0;
    _gameCompleted = false;

    setState(() {
      _gameStarted = true;
      _lockBoard = true;
      for (var c in _cardStates) {
        c.revealed = true; // mostrar todas para memorización
      }
    });

    // ⏳ Inicia cuenta regresiva de memorización (5s)
    _revealTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() {
        _revealSeconds--;
      });
      if (_revealSeconds <= 0) {
        _revealTimer?.cancel();
        _endRevealPhaseAndStartElapsed();
      }
    });
  }

  void _endRevealPhaseAndStartElapsed() {
    if (!mounted) return;
    setState(() {
      for (var c in _cardStates) {
        if (!c.matched) c.revealed = false; // ocultar no emparejadas
      }
      _lockBoard = false;
    });

    // ▶️ Inicia cronómetro ascendente
    _elapsedTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  void _onCardTap(int index) {
    if (_lockBoard || _gameCompleted) return;
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

        // ¿Ya ganó?
        _checkIfCompleted();
      } else {
        // ❌ No coincide → ocultar ambas tras un breve delay
        Future.delayed(const Duration(milliseconds: 300), () {
          if (!mounted) return;
          setState(() {
            _firstSelected!.revealed = false;
            secondSelected.revealed = false;
          });
          _resetSelection();
        });
      }
    }
  }

  void _checkIfCompleted() {
    final allMatched = _cardStates.every((c) => c.matched);
    if (allMatched) {
      _elapsedTimer?.cancel();
      setState(() {
        _gameCompleted = true;
        _lockBoard = true;
        _gameStarted = false; 
      });

  
      widget.onAllPairsMatched?.call();
    }
  }

  void _resetSelection() {
    _firstSelected = null;
    _lockBoard = false;
  }

  String _formatTime(int secs) {
    final m = secs ~/ 60;
    final s = secs % 60;
    final mm = m.toString().padLeft(2, '0');
    final ss = s.toString().padLeft(2, '0');
    return '$mm:$ss';
  }

  @override
  Widget build(BuildContext context) {
    final int totalCards = widget.rows * widget.columns;
    if (_cardStates.length < totalCards) {
      return const Center(child: Text("No hay suficientes cartas para el tablero"));
    }

    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;


    final bool isWide =
        size.shortestSide >= 500 || (screenWidth / screenHeight) >= 0.75;
    final double horizontalInset =
        isWide ? screenWidth * 0.15 : screenWidth * 0.10;

    final int boardTotalPairs = totalCards ~/ 2;
    final int boardMatchedPairs = _cardStates.where((c) => c.matched).length ~/ 2;
    int boardCurrentPairStep = boardMatchedPairs + 1;
    if (boardCurrentPairStep < 1) boardCurrentPairStep = 1;
    if (boardCurrentPairStep > boardTotalPairs) boardCurrentPairStep = boardTotalPairs;

    final bool useExternalLevelProgress =
        (widget.totalLevels != null && widget.currentLevel != null);

    final int progressTotal =
        useExternalLevelProgress ? widget.totalLevels!.clamp(1, 999) : boardTotalPairs;
    final int progressCurrent = useExternalLevelProgress
        ? widget.currentLevel!.clamp(1, progressTotal)
        : boardCurrentPairStep;

    return Stack(
      children: [
        Positioned(
          top: screenHeight * 0.08,
          left: horizontalInset,
          right: horizontalInset,
          bottom: screenHeight * 0.0,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.columns,
              crossAxisSpacing: screenHeight * 0.01,
              mainAxisSpacing: screenHeight * 0.01,
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


        if (_gameStarted)
          Positioned(
            bottom: screenHeight * 0.2,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
     
                _revealSeconds > 0 ? '$_revealSeconds' : _formatTime(_elapsedSeconds),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                  fontSize: screenHeight * 0.04, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),


        Positioned(
          bottom: screenHeight * 0.13,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: ProgressBar(
              totalLevels: progressTotal,
              currentLevel: progressCurrent,
            ),
          ),
        ),

        // Botón iniciar
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
