import 'dart:async'; // Para usar StreamController.
import 'dart:math'; // Para seleccionar preguntas aleatoriamente.
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';

// Definición del estado del juego
class GameState {
  final bool loading;

  GameState({this.loading = false});

  GameState copyWith({bool? loading}) {
    return GameState(
      loading: loading ?? this.loading,
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameState state; // Estado del juego
  final Random _random = Random();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isSpinning = false;

  // Lista de nombres de especies para la ruleta.
  late List<String> speciesNames = [
    'Aves',
    'Mamíferos',
    'Reptiles',
    'Anfibios',
    'Peces',
    'Insectos',
    'Árboles',
    'Palmeras',
  ];

  // Preguntas y respuestas para cada especie.
  late List<List<Map<String, dynamic>>> questions = [
    [
      {
        'question': '¿Cuál es el nombre común del Harpia harpyja?',
        'correct': 'Águila harpía',
        'options': ['Águila calva', 'Águila real', 'Águila harpía', 'Águila pescadora'],
      },
      {
        'question': '¿Qué ave es conocida por su canto onomatopéyico "tatatao"?',
        'correct': 'Red-throated caracara',
        'options': ['Tucán', 'Colibrí', 'Cacatúa', 'Red-throated caracara'],
      },
      {
        'question': '¿Cuántos centímetros mide aproximadamente la garza blanca grande?',
        'correct': '85 cm',
        'options': ['85 cm', '60 cm', '100 cm', '75 cm'],
      },
      {
        'question': '¿Qué ave construye su nido en ramas sobre el agua?',
        'correct': 'Hoatzin (Shansho)',
        'options': ['Hoatzin (Shansho)', 'Martín pescador', 'Águila harpía', 'Garza real'],
      },
      {
        'question': '¿Qué ave es conocida por tener un pico ancho que asemeja una cuchara?',
        'correct': 'Huapapa (Boat-billed heron)',
        'options': ['Pelícano', 'Huapapa (Boat-billed heron)', 'Flamenco', 'Cormorán'],
      }
    ],
    [
      {
        'question': '¿Cuál es el mamífero más grande de la Amazonía?',
        'correct': 'Manatí',
        'options': ['Tapir', 'Jaguar', 'Manatí', 'Mono aullador'],
      },
      {
        'question': '¿Qué mamífero tiene la capacidad de sumergirse completamente en el agua para cazar?',
        'correct': 'Nutria gigante',
        'options': ['Capibara', 'Nutria gigante', 'Jaguar', 'Tapir'],
      },
      {
        'question': '¿Qué animal amazónico es conocido como "el ingeniero del ecosistema" por su capacidad de modificar el hábitat?',
        'correct': 'Castor',
        'options': ['Nutria', 'Jaguar', 'Mono araña', 'Castor'],
      },
      {
        'question': '¿Cuál es el depredador más grande de la Amazonía?',
        'correct': 'Jaguar',
        'options': ['Jaguar', 'Puma', 'Ocelote', 'Caimán negro'],
      },
      {
        'question': '¿Qué mamífero amazónico se caracteriza por tener una piel gruesa y arrugada?',
        'correct': 'Tapir',
        'options': ['Tapir', 'Armadillo', 'Manatí', 'Pecarí'],
      }
    ],
    [
      {
        'question': '¿Qué reptil puede llegar a medir más de 10 metros y es el más grande de la Amazonía?',
        'correct': 'Anaconda',
        'options': ['Anaconda', 'Boa constrictora', 'Caimán negro', 'Iguana'],
      },
      {
        'question': '¿Cuál es el nombre común del Caiman crocodilus?',
        'correct': 'Caimán blanco',
        'options': ['Caimán negro', 'Caimán de hocico ancho', 'Caimán blanco', 'Caimán enano'],
      },
      {
        'question': '¿Qué reptil amazónico es conocido por sus colores brillantes y puede escalar árboles?',
        'correct': 'Iguana',
        'options': ['Iguana', 'Tortuga de río', 'Serpiente coral', 'Lagarto basilisco'],
      },
      {
        'question': '¿Cuál es la serpiente venenosa más conocida de la Amazonía?',
        'correct': 'Bothrops (Fer-de-lance)',
        'options': ['Cobra', 'Bothrops (Fer-de-lance)', 'Serpiente coral', 'Víbora'],
      },
      {
        'question': '¿Qué especie de tortuga es común en los ríos amazónicos?',
        'correct': 'Tortuga Arrau',
        'options': ['Tortuga Arrau', 'Tortuga de caparazón blando', 'Tortuga de orejas rojas', 'Tortuga leopardo'],
      }
    ],
    [
      {
        'question': '¿Qué anfibio es conocido por sus colores vivos y es venenoso?',
        'correct': 'Rana dardo venenoso',
        'options': ['Rana de árbol', 'Rana dardo venenoso', 'Sapo Bufo', 'Salamandra'],
      },
      {
        'question': '¿Cuál es la especie de anfibio más pequeña encontrada en la Amazonía?',
        'correct': 'Rana pigmea',
        'options': ['Sapo Bufo', 'Rana de cristal', 'Rana pigmea', 'Salamandra de río'],
      },
      {
        'question': '¿Qué tipo de sapo es conocido por secretar toxinas defensivas en la Amazonía?',
        'correct': 'Sapo Bufo',
        'options': ['Sapo Bufo', 'Rana dardo venenoso', 'Rana toro', 'Sapo de caña'],
      },
      {
        'question': '¿Qué anfibio utiliza los charcos temporales de la selva para reproducirse?',
        'correct': 'Rana de árbol',
        'options': ['Salamandra de agua', 'Sapo Bufo', 'Rana de cristal', 'Rana de árbol'],
      },
      {
        'question': '¿Cuál es la característica distintiva de la rana de cristal amazónica?',
        'correct': 'Piel translúcida',
        'options': ['Coloración brillante', 'Secreciones venenosas', 'Piel translúcida', 'Ojos grandes'],
      }
    ],
    [
      {
        'question': '¿Cuál es el pez más grande de la Amazonía?',
        'correct': 'Paiche',
        'options': ['Paiche', 'Piraña', 'Bagre', 'Tetra'],
      },
      {
        'question': '¿Qué pez amazónico es conocido por ser carnívoro y tener dientes afilados?',
        'correct': 'Piraña',
        'options': ['Anguila eléctrica', 'Dorado', 'Piraña', 'Paiche'],
      },
      {
        'question': '¿Qué especie de pez puede respirar aire y vivir en aguas con bajo oxígeno?',
        'correct': 'Arapaima',
        'options': ['Bagre', 'Tilapia', 'Piraña', 'Arapaima'],
      },
      {
        'question': '¿Qué pez es conocido por su habilidad de generar electricidad?',
        'correct': 'Anguila eléctrica',
        'options': ['Anguila eléctrica', 'Tetra', 'Paiche', 'Dorado'],
      },
      {
        'question': '¿Cuál es el pez que migra durante la temporada de lluvias en la Amazonía?',
        'correct': 'Dorado',
        'options': ['Piraña', 'Dorado', 'Paiche', 'Anguila'],
      }
    ],
    [
      {
        'question': '¿Qué insecto amazónico es conocido por su picadura dolorosa y agresiva?',
        'correct': 'Hormiga bala',
        'options': ['Hormiga bala', 'Termita', 'Escarabajo', 'Avispa'],
      },
      {
        'question': '¿Cuál es el insecto que causa la mayoría de las picaduras durante la noche en la Amazonía?',
        'correct': 'Mosquito',
        'options': ['Hormiga', 'Mariposa', 'Mosquito', 'Avispa'],
      },
      {
        'question': '¿Qué mariposa es famosa por sus alas de color azul brillante?',
        'correct': 'Mariposa Morpho',
        'options': ['Mariposa Morpho', 'Mariposa Monarca', 'Mariposa Emperador', 'Mariposa Atlas'],
      },
      {
        'question': '¿Qué insecto puede crear túneles bajo tierra en la Amazonía?',
        'correct': 'Termita',
        'options': ['Hormiga bala', 'Termita', 'Escarabajo pelotero', 'Grillo'],
      },
      {
        'question': '¿Cuál es el insecto que contribuye a la polinización nocturna en la selva amazónica?',
        'correct': 'Polilla Esfinge',
        'options': ['Abeja', 'Mariposa Morpho', 'Avispa', 'Polilla Esfinge'],
      }
    ],
    [
      {
        'question': '¿Cuál es el árbol más alto de la Amazonía?',
        'correct': 'Ceiba',
        'options': ['Ceiba', 'Castaño de Brasil', 'Palo de hierro', 'Cactus epífito'],
      },
      {
        'question': '¿Qué árbol amazónico produce nueces comestibles muy valoradas?',
        'correct': 'Castaño de Brasil',
        'options': ['Castaño de Brasil', 'Ceiba', 'Palmera de aceite', 'Árbol del caucho'],
      },
      {
        'question': '¿Cuál es el árbol conocido por su madera resistente y densa en la Amazonía?',
        'correct': 'Palo de hierro',
        'options': ['Ceiba', 'Palo de hierro', 'Castaño de Brasil', 'Cedro'],
      },
      {
        'question': '¿Qué árbol tiene flores que se abren solo por la noche y son polinizadas por murciélagos?',
        'correct': 'Cactus epífito',
        'options': ['Ceiba', 'Castaño de Brasil', 'Cactus epífito', 'Árbol de cacao'],
      },
      {
        'question': '¿Cuál es el árbol que se utiliza para la extracción de látex?',
        'correct': 'Caucho',
        'options': ['Ceiba', 'Castaño de Brasil', 'Caucho', 'Cedro'],
      }
    ],
    [
      {
        'question': '¿Qué palma es famosa por sus frutos que producen aceite?',
        'correct': 'Palma de aceite',
        'options': ['Palma de aceite', 'Irapay', 'Aguaje', 'Pona'],
      },
      {
        'question': '¿Cuál es el nombre de la palmera cuyos frutos son utilizados para hacer bebidas refrescantes?',
        'correct': 'Aguaje',
        'options': ['Açai', 'Palma de aceite', 'Pona', 'Aguaje'],
      },
      {
        'question': '¿Qué palmera es conocida por tener hojas grandes que se usan para techos en la Amazonía?',
        'correct': 'Irapay',
        'options': ['Pona', 'Irapay', 'Palma de aceite', 'Aguaje'],
      },
      {
        'question': '¿Cuál es la palmera que produce un tipo de fruta roja comestible rica en vitamina C?',
        'correct': 'Açai',
        'options': ['Pona', 'Açai', 'Irapay', 'Palma de aceite'],
      },
      {
        'question': '¿Qué palmera es comúnmente usada en la construcción de viviendas en la Amazonía?',
        'correct': 'Pona',
        'options': ['Irapay', 'Aguaje', 'Palma de aceite', 'Pona'],
      }
    ]
  ];

  final StreamController<int> _selectedController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    state = GameState();
  
    // Mostrar el mensaje inicial al cargar la página
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showInitialMessage();
    });
  }

  Future<void> _playSound(String path) async {
    await _audioPlayer.play(AssetSource(path));
  }

  // Función para mostrar el mensaje inicial
  void _showInitialMessage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) { // Verifica si el widget está montado
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Bienvenido a la Trivia de Especies"),
            content: Text(
              "Presiona el botón 'Girar' para comenzar el juego y responder preguntas sobre las especies.",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Entendido"),
              ),
            ],
          ),
        );
      }
    });
  }

  void _showQuestionDialog(int specieIndex) {
    _playSound('sounds/question.mp3');
    var randomQuestion = questions[specieIndex][_random.nextInt(questions[specieIndex].length)];
    String question = randomQuestion['question'];
    String correctAnswer = randomQuestion['correct'];
    List<String> options = randomQuestion['options'];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Pregunta de ${speciesNames[specieIndex]}"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(question),
            SizedBox(height: 10),
            ...options.map((option) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showResultDialog(option, correctAnswer);
                },
                child: Text(option),
              );
            }).toList(),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text("Cerrar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _showResultDialog(String selectedAnswer, String correctAnswer) {
    bool isCorrect = selectedAnswer == correctAnswer;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isCorrect ? "¡Correcto!" : "Incorrecto"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isCorrect) ...[
              const SizedBox(height: 20),
            Lottie.asset('assets/lotties/Trofeo - green.json', width: 150, height: 150),
              const Text(
                '¡Respuesta Correcta!',
              ),
            ] else ...[
              Text("La respuesta correcta era: $correctAnswer."),
            ],
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text("Aceptar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
    if (isCorrect) {
    _playSound('sounds/correct.mp3');
  } else {
    _playSound('sounds/incorrect.mp3');
  }
  }

  @override
  void dispose() {
    _selectedController.close();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text("Trivia Game"),
        ),
      ),
      body: speciesNames.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: FortuneWheel(
                    physics: CircularPanPhysics(
                      duration: Duration(seconds: 3),
                      curve: Curves.decelerate,
                    ),
                    selected: _selectedController.stream,
                    items: [
                      for (var name in speciesNames) FortuneItem(child: Text(name)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isSpinning
                      ? null // Desactivar el botón si está girando
                      : () {
                          setState(() {
                            _isSpinning = true; // Cambiar el estado a girando
                          });
                          _playSound('sounds/spin.mp3');
                          int randomIndex = Fortune.randomInt(0, speciesNames.length);
                          _selectedController.add(randomIndex);

                          Future.delayed(Duration(seconds: 5), () {
                            _showQuestionDialog(randomIndex);
                            setState(() {
                              _isSpinning = false; // Restablecer el estado después de girar
                            });
                          });
                        },
                  child: Text(_isSpinning ? "Girando..." : "Girar"), // Cambiar texto del botón
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}