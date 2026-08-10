// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/memory/widgets/card_little.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/memory/widgets/progress_bar.dart';
import 'package:species/src/presentation/global/utils/responsive.dart';

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

  final int? levelTotalSeconds;
  final VoidCallback? onTimeUp;

  const MemoryTable({
    Key? key,
    required this.rows,
    required this.columns,
    required this.cards,
    this.onAllPairsMatched,
    this.currentLevel,
    this.totalLevels,
    this.levelTotalSeconds,
    this.onTimeUp,
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
  Timer? _levelTimer;
  int _revealSeconds = 3; // cuenta regresiva de memorización
  int _levelSecondsLeft = 0; // tiempo desde que termina la memorización
  bool _gameCompleted = false;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  @override
  void dispose() {
    _revealTimer?.cancel();
    _levelTimer?.cancel();
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
    _levelTimer?.cancel();
    _revealSeconds = 3;
    _levelSecondsLeft = 0;
    _gameCompleted = false;

    setState(() {
      _gameStarted = true;
      _lockBoard = true;
      for (var c in _cardStates) {
        c.revealed = true; // mostrar todas para memorización (solo imagen)
      }
    });

    // ⏳ Inicia cuenta regresiva de memorización (3s)
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
        if (!c.matched) c.revealed = false;
      }
      _lockBoard = false;

      // ⬅️ INICIO COUNTDOWN DEL NIVEL
      _levelSecondsLeft = (widget.levelTotalSeconds ?? 60).clamp(1, 3600);
    });

    _levelTimer?.cancel();
    _levelTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() {
        _levelSecondsLeft--;
      });
      if (_levelSecondsLeft <= 0) {
        _levelTimer?.cancel();
        // tiempo agotado → bloquear el tablero y avisar
        setState(() {
          _gameCompleted = true;
          _lockBoard = true;
          _gameStarted = false;
        });
        widget.onTimeUp?.call(); // ⬅️ notifica a la página
      }
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
        // ✅ Par correcto: marcar ambas como emparejadas
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
      _levelTimer?.cancel();
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
      return const Center(
          child: Text("No hay suficientes cartas para el tablero"));
    }

    final responsive = Responsive.of(context);
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final int boardTotalPairs = totalCards ~/ 2;
    final int boardMatchedPairs =
        _cardStates.where((c) => c.matched).length ~/ 2;
    int boardCurrentPairStep = boardMatchedPairs + 1;
    if (boardCurrentPairStep < 1) boardCurrentPairStep = 1;
    if (boardCurrentPairStep > boardTotalPairs) boardCurrentPairStep = boardTotalPairs;

    final bool useExternalLevelProgress =
        (widget.totalLevels != null && widget.currentLevel != null);

    final int progressTotal = useExternalLevelProgress
        ? widget.totalLevels!.clamp(1, 999)
        : boardTotalPairs;
    final int progressCurrent = useExternalLevelProgress
        ? widget.currentLevel!.clamp(1, progressTotal)
        : boardCurrentPairStep;

    final gridWidget = LayoutBuilder(
      builder: (context, constraints) {
        final double cardWidth = (constraints.maxWidth - (responsive.hp(1) * (widget.columns - 1))) / widget.columns;
        final double cardHeight = (constraints.maxHeight - (responsive.hp(1) * (widget.rows - 1))) / widget.rows;
        final double childAspectRatio = cardWidth / cardHeight;

        return GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.columns,
            crossAxisSpacing: responsive.hp(1),
            mainAxisSpacing: responsive.hp(1),
            childAspectRatio: childAspectRatio > 0 ? childAspectRatio : 1.0,
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
                showTitle: card.matched,
              ),
            );
          },
        );
      }
    );

    final timerWidget = _gameStarted
        ? Text(
            _revealSeconds > 0
                ? '$_revealSeconds'
                : _formatTime(_levelSecondsLeft),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onErrorContainer,
              fontSize: responsive.dp(responsive.isTablet ? 3 : 4),
              fontWeight: FontWeight.bold,
            ),
          )
        : const SizedBox.shrink();

    final startButton = !_gameStarted
        ? SizedBox(
            width: isLandscape ? double.infinity : 200,
            height: 50,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 4,
              ),
              onPressed: _startGame,
              icon: const Icon(Icons.play_arrow, color: Colors.black87),
              label: const Text(
                "Iniciar",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        : const SizedBox.shrink();

    if (isLandscape) {
      return Padding(
        padding: EdgeInsets.only(
          top: responsive.hp(8),
          bottom: responsive.hp(2),
          left: responsive.wp(2),
          right: responsive.wp(2),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(2)),
                  child: gridWidget,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  timerWidget,
                  const SizedBox(height: 16),
                  Expanded(
                    child: ProgressBar(
                      totalLevels: progressTotal,
                      currentLevel: progressCurrent,
                      axis: Axis.vertical,
                    ),
                  ),
                  const SizedBox(height: 16),
                  startButton,
                ],
              ),
            ),
          ],
        ),
      );
    }

    final isWide =
        responsive.isTablet || (responsive.width / responsive.height) >= 0.75;
    final double horizontalInset =
        isWide ? responsive.wp(15) : responsive.wp(10);

    return Stack(
      children: [
        Positioned(
          top: responsive.hp(8),
          left: horizontalInset,
          right: horizontalInset,
          bottom: responsive.hp(25),
          child: gridWidget,
        ),
        if (_gameStarted)
          Positioned(
            bottom: responsive.hp(18),
            left: 0,
            right: 0,
            child: Center(child: timerWidget),
          ),
        Positioned(
          bottom: responsive.hp(13),
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(4)),
            child: ProgressBar(
              totalLevels: progressTotal,
              currentLevel: progressCurrent,
              axis: Axis.horizontal,
            ),
          ),
        ),
        if (!_gameStarted)
          Positioned(
            bottom: responsive.hp(2),
            left: 0,
            right: 0,
            child: Center(child: startButton),
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
