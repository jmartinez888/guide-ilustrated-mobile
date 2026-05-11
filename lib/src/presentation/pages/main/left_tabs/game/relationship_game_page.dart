import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

import 'package:species/src/presentation/global/utils/responsive.dart';

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
                "¡Buena suerte!"),
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
    List<String> shuffledAnimals = List.from(remainingAnimals)
      ..shuffle(Random());
    final responsive = Responsive.of(context);

    // Ajustes responsivos para Grid y Contenedores
    // Mantenemos 4 columnas, calculamos el tamaño de item basado en ancho
    final itemSize = responsive.wp(20);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: responsive.wp(4)),
          child: Text(
            'Relaciona las Especies',
            style: TextStyle(
                fontSize: responsive
                    .dp(responsive.isTablet ? 2.5 : 4)), // Ajuste fuente
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(responsive.wp(4)),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 1, // Cuadrado
                crossAxisSpacing: responsive.wp(2),
                mainAxisSpacing: responsive.hp(1),
                children: shuffledAnimals
                    .map((animal) =>
                        _buildAnimalContainer(animal, itemSize, responsive))
                    .toList(),
              ),
            ),
            SizedBox(height: responsive.hp(2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildGroupContainer(context, 'Ave', 'aves', responsive),
                _buildGroupContainer(
                    context, 'Mamífero', 'mamíferos', responsive),
                _buildGroupContainer(context, 'Pez', 'peces', responsive),
                _buildGroupContainer(
                    context, 'Insecto', 'insectos', responsive),
              ],
            ),
            SizedBox(height: responsive.hp(2)),
            ElevatedButton(
              onPressed: gameCompleted ? _resetGame : _confirmPositions,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: responsive.wp(10),
                    vertical: responsive.hp(1.5)),
                textStyle: TextStyle(
                  fontSize: responsive.dp(responsive.isTablet ? 2 : 3.5),
                ),
              ),
              child: Text(gameCompleted ? 'Reiniciar Juego' : 'Confirmar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalContainer(
      String animal, double size, Responsive responsive) {
    return Draggable<String>(
      data: animal,
      child: Container(
        // margin: const EdgeInsets.all(4.0), // Ya manejado por spacing del Grid
        width: size,
        height: size,
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
              width: size * 0.5,
              height: size * 0.5,
            ),
            Text(
              animal,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: responsive.dp(1.2)), // Texto responsivo
            ),
          ],
        ),
      ),
      feedback: Material(
        color: Colors.transparent,
        child: Container(
          width: size,
          height: size,
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
                width: size * 0.5,
                height: size * 0.5,
              ),
              Text(
                animal,
                style: TextStyle(
                    color: Colors.white, fontSize: responsive.dp(1.2)),
              ),
            ],
          ),
        ),
      ),
      childWhenDragging: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildGroupContainer(BuildContext context, String groupName,
      String expectedCategory, Responsive responsive) {
    // Tamaño contenedores de grupo
    final width = responsive.wp(22);
    final height = responsive.hp(30);

    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(responsive.wp(1)),
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
                style: TextStyle(
                    color: Colors.black,
                    fontSize: responsive.dp(1.2),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: responsive.hp(1)),
              Expanded(
                // Permitir scroll si hay muchos? O ajustar tamaño.
                child: SingleChildScrollView(
                  child: Column(
                    children: groupedAnimals[expectedCategory]!.map((animal) {
                      return Container(
                        margin: EdgeInsets.only(top: responsive.hp(0.5)),
                        padding: EdgeInsets.all(responsive.wp(1)),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          animalImages[animal]!,
                          width: responsive
                              .wp(8), // Imagen pequeña dentro del grupo
                          height: responsive.wp(8),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
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
        if (category == 'aves')
          correctGroup = birds;
        else if (category == 'mamíferos')
          correctGroup = mammals;
        else if (category == 'peces')
          correctGroup = fish;
        else
          correctGroup = insects;

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
        _showMessage(
            "Algunos animales no pertenecen a esta especie. Vuelve a intentarlo.");
      }
    });
  }

  void _showCongratulations() {
    _playSound('sounds/correct.mp3');
    final responsive = Responsive.of(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  "¡Felicitaciones! Has agrupado correctamente todos los animales.",
                  textAlign: TextAlign.center),
              SizedBox(height: responsive.hp(2)),
              Lottie.asset('assets/lotties/Trofeo - green.json',
                  width: responsive.wp(40), height: responsive.wp(40)),
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
      gameCompleted = false; // Add reset of game status
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
