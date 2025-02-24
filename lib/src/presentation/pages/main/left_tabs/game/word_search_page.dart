import 'package:flutter/material.dart';
import 'package:word_search_safety/word_search_safety.dart';

class WordSearchPage extends StatefulWidget {
  const WordSearchPage({Key? key}) : super(key: key);

  @override
  _WordSearchPageState createState() => _WordSearchPageState();
}

class _WordSearchPageState extends State<WordSearchPage> {
  late WordSearchSafety wordSearch;
  late WSNewPuzzle newPuzzle;
  final List<String> wordList = ['hello', 'world', 'foo', 'bar', 'baz', 'dart'];
  late List<bool> _foundWords;
  Set<Offset> _selectedLetters = {};
  List<Set<Offset>> _highlightedWords = [];
  bool _isSelecting = false;

  @override
  void initState() {
    super.initState();
    wordSearch = WordSearchSafety();
    _createPuzzle();
    _foundWords = List<bool>.filled(wordList.length, false);
  }

  void _createPuzzle() {
    final WSSettings ws = WSSettings(
      width: 10,
      height: 10,
      orientations: List.from([
        WSOrientation.horizontal,
        WSOrientation.vertical,
        WSOrientation.diagonal,
      ]),
    );

    newPuzzle = wordSearch.newPuzzle(wordList, ws);

    if (newPuzzle.errors != null && newPuzzle.errors!.isNotEmpty) {
      for (var error in newPuzzle.errors!) {
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sopa de Letras'),
      ),
      body: Center(
        child: newPuzzle.puzzle != null && newPuzzle.puzzle!.isNotEmpty
            ? _buildPuzzleGrid()
            : const Text('No se pudo crear el rompecabezas.'),
      ),
    );
  }

  Widget _buildPuzzleGrid() {
    final puzzle = newPuzzle.puzzle!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Contenedor para la lista de palabras
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 3,
            ),
            itemCount: wordList.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Checkbox(
                    value: _foundWords[index],
                    onChanged: null, // Deshabilitar el checkbox para que no se pueda cambiar manualmente
                  ),
                  Expanded(
                    child: Text(
                      wordList[index],
                      style: TextStyle(
                        fontSize: 16,
                        decoration: _foundWords[index]
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                  if (_foundWords[index])
                    const Icon(Icons.check, color: Colors.green),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        // Contenedor de la sopa de letras sin desplazamiento
        Expanded(
          child: GestureDetector(
            onPanStart: (details) {
              _startSelecting(details.localPosition, puzzle);
            },
            onPanUpdate: (details) {
              _updateSelection(details.localPosition, puzzle);
            },
            onPanEnd: (_) {
              _finishSelection();
            },
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
                childAspectRatio: 1.0,
              ),
              itemCount: puzzle.length * puzzle[0].length,
              itemBuilder: (context, index) {
                final row = index ~/ puzzle[0].length;
                final col = index % puzzle[0].length;
                final letter = puzzle[row][col];

                bool isHighlighted = _highlightedWords.any(
                    (highlighted) => highlighted.contains(Offset(row.toDouble(), col.toDouble())));

                return Container(
                  margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: isHighlighted
                        ? Colors.lightGreen // Color para letras de palabras encontradas
                        : _selectedLetters.contains(Offset(row.toDouble(), col.toDouble()))
                            ? Colors.yellow // Color para letras seleccionadas
                            : Colors.grey[200],
                  ),
                  child: Center(
                    child: Text(
                      letter ?? '',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _solvePuzzle,
          child: const Text('Resolver'),
        ),
      ],
    );
  }

  void _startSelecting(Offset position, List<List<String?>> puzzle) {
    _selectedLetters.clear();
    _addSelectedLetterFromPosition(position, puzzle);
    _isSelecting = true;
  }

  void _updateSelection(Offset position, List<List<String?>> puzzle) {
    if (_isSelecting) {
      _addSelectedLetterFromPosition(position, puzzle);
    }
  }

  void _finishSelection() {
    _isSelecting = false;
    _checkSelectedWord();
    _selectedLetters.clear(); // Limpiar la selección
    setState(() {});
  }

  void _addSelectedLetterFromPosition(Offset position, List<List<String?>> puzzle) {
    double gridWidth = MediaQuery.of(context).size.width / 10;
    int row = (position.dy ~/ gridWidth).clamp(0, puzzle.length - 1);
    int col = (position.dx ~/ gridWidth).clamp(0, puzzle[0].length - 1);
    Offset selectedOffset = Offset(row.toDouble(), col.toDouble());

    if (!_selectedLetters.contains(selectedOffset)) {
      setState(() {
        _selectedLetters.add(selectedOffset);
      });
    }
  }

  void _checkSelectedWord() {
    List<String> selectedLetters = _selectedLetters.map((offset) {
      int row = offset.dy.toInt();
      int col = offset.dx.toInt();
      return newPuzzle.puzzle![row][col]!; // Cambia esta línea para obtener la letra correctamente
    }).toList();

    String selectedWord = selectedLetters.join('');
    String reversedWord = selectedLetters.reversed.join('');
    
    // Checar ambas direcciones: normal y reversa
    int wordIndex = wordList.indexOf(selectedWord);
    int reverseWordIndex = wordList.indexOf(reversedWord);

    if (wordIndex != -1) {
      _markWordAsFound(wordIndex, _selectedLetters);
    } else if (reverseWordIndex != -1) {
      _markWordAsFound(reverseWordIndex, _selectedLetters);
    }
  }

  void _markWordAsFound(int wordIndex, Set<Offset> selectedLetters) {
    setState(() {
      _foundWords[wordIndex] = true; // Marcar la palabra como encontrada
      _highlightedWords.add(Set.from(selectedLetters)); // Mantener resaltada en el puzzle
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('¡Palabra encontrada: ${wordList[wordIndex]}!')),
    );
  }

  void _solvePuzzle() {
    if (newPuzzle.puzzle != null) {
      _createPuzzle();
      setState(() {
        _foundWords.fillRange(0, _foundWords.length, false); // Resetear las palabras encontradas
        _highlightedWords.clear();
      });
    }
  }
}
