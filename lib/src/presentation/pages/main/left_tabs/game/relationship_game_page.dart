import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class RelationshipGamePage extends StatefulWidget {
  @override
  _RelationshipGamePageState createState() => _RelationshipGamePageState();
}

class _RelationshipGamePageState extends State<RelationshipGamePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<String> birds = ['Guacamayo', 'Tucán', 'Colibrí'];
  final List<String> mammals = ['Ronsoco', 'Tigrillo', 'Manati'];
  final List<String> fish = ['Piraña', 'Raya', 'Bagre'];
  final List<String> insects = ['Mariposa', 'Escarabajo', 'Hormiga'];

  final Map<String, List<String>> groupedAnimals = {
    'aves': [],
    'mamíferos': [],
    'peces': [],
    'insectos': [],
  };

  List<String> remainingAnimals = [];
  bool gameCompleted = false;
  final Map<String, String> animalImages = {
    'Guacamayo': 'assets/relacionaEspecie/guacamayo.png',
    'Tucán': 'assets/relacionaEspecie/tucan.png',
    'Colibrí': 'assets/relacionaEspecie/colibri.png',
    'Ronsoco': 'assets/relacionaEspecie/ronsoco.png',
    'Tigrillo': 'assets/relacionaEspecie/tigrillo.png',
    'Manati': 'assets/relacionaEspecie/manati.png',
    'Piraña': 'assets/relacionaEspecie/piranha.png',
    'Raya': 'assets/relacionaEspecie/raya.png',
    'Bagre': 'assets/relacionaEspecie/bagre.png',
    'Mariposa': 'assets/relacionaEspecie/mariposa.png',
    'Escarabajo': 'assets/relacionaEspecie/escarabajo.png',
    'Hormiga': 'assets/relacionaEspecie/hormiga.png',
  };

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    remainingAnimals = List<String>.from(birds + mammals + fish + insects);
    _showInitialMessage();
  }

  Future<void> _playSound(String path) async {
    await _audioPlayer.play(AssetSource(path));
  }

  void _showInitialMessage() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Instrucciones"),
          content: Text(
            "Arrastra cada animal al contenedor correspondiente según su especie. "
            "Presiona 'Confirmar' para verificar las agrupaciones. "
            "¡Buena suerte!"
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Entendido"),
            ),
          ],
        );
      },
    );
  });
}

  @override
  Widget build(BuildContext context) {
    List<String> shuffledAnimals = List.from(remainingAnimals)..shuffle(Random());
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text('Relaciona las Especies'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 1,
                children: shuffledAnimals
                    .map((animal) => _buildAnimalContainer(animal))
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildGroupContainer(context, 'Ave', 'aves'),
                _buildGroupContainer(context, 'Mamífero', 'mamíferos'),
                _buildGroupContainer(context, 'Pez', 'peces'),
                _buildGroupContainer(context, 'Insecto', 'insectos'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: gameCompleted ? _resetGame : _confirmPositions, // Cambia la acción del botón
              child: Text(gameCompleted ? 'Reiniciar Juego' : 'Confirmar'), // Cambia el texto del botón
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalContainer(String animal) {
    return Draggable<String>(
      data: animal,
      child: Container(
        margin: const EdgeInsets.all(4.0),
        width: 80,
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              animalImages[animal] ?? 'assets/',
              width: 40,
              height: 40,
            ),
            Text(
              animal,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
      feedback: Material(
        color: Colors.transparent,
        child: Container(
          width: 80,
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                animalImages[animal] ?? 'assets/',
                width: 40,
                height: 40,
              ),
              Text(
                animal,
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
      childWhenDragging: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildGroupContainer(BuildContext context, String groupName, String expectedCategory) {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 80,
          height: 250,
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                groupName,
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
              SizedBox(height: 10),
              ...groupedAnimals[expectedCategory]!.map((animal) {
                return Container(
                  margin: const EdgeInsets.only(top: 4.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    animalImages[animal]!,
                    width: 40,
                    height: 40,
                  ),
                );
              }).toList(),
            ],
          ),
        );
      },
      onAccept: (data) {
        if (groupedAnimals[expectedCategory]!.length < 3) {
        setState(() {
          groupedAnimals[expectedCategory]!.add(data);
          remainingAnimals.remove(data);
        });
      } else {
        _playSound('sounds/incorrect.mp3');
        // Muestra un mensaje si el contenedor está lleno
        _showMessage("Este contenedor esta lleno.");
      }
      },
    );
  }

  void _confirmPositions() {
    setState(() {
      bool allGroupedCorrectly = true;
      List<String> incorrectAnimals = [];

      groupedAnimals.forEach((category, animals) {
        List<String> correctGroup;

      // Asigna la lista de animales correcta para cada categoría
        if (category == 'aves') correctGroup = birds;
        else if (category == 'mamíferos') correctGroup = mammals;
        else if (category == 'peces') correctGroup = fish;
        else correctGroup = insects;

      // Verifica si algún animal no pertenece al grupo correcto
        for (String animal in animals) {
          if (!correctGroup.contains(animal)) {
          allGroupedCorrectly = false;
          incorrectAnimals.add(animal);
          }
        }
      });

      if (remainingAnimals.isNotEmpty) {
        _playSound('sounds/incorrect.mp3');
        _showMessage("Aún quedan animales por relacionar.");
      } else if (allGroupedCorrectly) {
        gameCompleted = true;
        _showCongratulations();
      } else {
      // Devuelve los animales incorrectos al contenedor general
        for (String animal in incorrectAnimals) {
          groupedAnimals.forEach((category, animals) {
            animals.remove(animal);
          });
          remainingAnimals.add(animal);
        }
        _playSound('sounds/incorrect.mp3');
        _showMessage("Algunos animales no pertenecen a esta especie. Vuelve a intentarlo.");
      }
    });
  }

  void _showCongratulations() {
    _playSound('sounds/correct.mp3');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("¡Felicitaciones! Has agrupado correctamente todos los animales."),
              SizedBox(height: 20),
              Lottie.asset('assets/lotties/Trofeo - green.json', width: 150, height: 150),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    setState(() {
      groupedAnimals.forEach((key, value) {
        value.clear();
      });
      remainingAnimals = List.from(birds + mammals + fish + insects);
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _audioPlayer.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }
}
