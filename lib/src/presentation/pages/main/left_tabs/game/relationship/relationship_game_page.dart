import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import 'package:species/src/data/services/analytics_service.dart';

import 'package:species/src/presentation/global/utils/responsive.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/relationship/widgets/animal_card.dart';
import 'package:species/src/presentation/pages/main/left_tabs/game/trivia/widgets/dotted_background.dart';

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
    context.read<AnalyticsService>().logPlayGame(gameName: 'relationship');
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    remainingAnimals = List<String>.from(birds + mammals + fish + insects);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showInitialMessage();
    });
  }

  Future<void> _playSound(String path) async {
    await _audioPlayer.play(AssetSource(path));
  }

  void _showInitialMessage() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8F5E9), // Light green background
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.energy_savings_leaf, // Leaf icon
                      color: Color(0xFF2E7D32),
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Bienvenido a\nRelaciona las Especies",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Arrastra cada animal al contenedor\ncorrespondiente según su especie.\nPresiona 'Confirmar' para\nverificar las agrupaciones.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Entendido",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> shuffledAnimals = List.from(remainingAnimals)..shuffle(Random());
    final responsive = Responsive.of(context);
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    Widget animalsGrid = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      padding: EdgeInsets.all(responsive.wp(2)),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 4 columns
          childAspectRatio: isPortrait ? 0.75 : 0.9,
          crossAxisSpacing: responsive.wp(1.5),
          mainAxisSpacing: responsive.hp(2),
        ),
        itemCount: shuffledAnimals.length,
        itemBuilder: (context, index) {
          return _buildAnimalContainer(shuffledAnimals[index], responsive, isPortrait);
        },
      ),
    );

    Widget targetsArea = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      padding: EdgeInsets.all(responsive.wp(2)),
      child: isPortrait
          ? Row(
              children: [
                Expanded(child: _buildGroupContainer(context, 'Aves', 'aves', responsive, isPortrait)),
                SizedBox(width: responsive.wp(1.5)),
                Expanded(child: _buildGroupContainer(context, 'Mamíferos', 'mamíferos', responsive, isPortrait)),
                SizedBox(width: responsive.wp(1.5)),
                Expanded(child: _buildGroupContainer(context, 'Peces', 'peces', responsive, isPortrait)),
                SizedBox(width: responsive.wp(1.5)),
                Expanded(child: _buildGroupContainer(context, 'Insectos', 'insectos', responsive, isPortrait)),
              ],
            )
          : GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.4,
              crossAxisSpacing: responsive.wp(2),
              mainAxisSpacing: responsive.hp(2),
              children: [
                _buildGroupContainer(context, 'Aves', 'aves', responsive, isPortrait),
                _buildGroupContainer(context, 'Mamíferos', 'mamíferos', responsive, isPortrait),
                _buildGroupContainer(context, 'Peces', 'peces', responsive, isPortrait),
                _buildGroupContainer(context, 'Insectos', 'insectos', responsive, isPortrait),
              ],
            ),
    );

    Widget confirmButton = SizedBox(
      width: double.infinity,
      height: responsive.hp(isPortrait ? 6 : 10),
      child: ElevatedButton(
        onPressed: gameCompleted ? _resetGame : _confirmPositions,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 4,
        ),
        child: Text(
          gameCompleted ? 'Reiniciar Juego' : 'Confirmar',
          style: TextStyle(
            fontSize: responsive.dp(isPortrait ? 2.0 : (responsive.isTablet ? 1.5 : 2.5)),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF7), // Off-white warm background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Text(
          'Relaciona las Especies',
          style: TextStyle(
            color: Colors.black87,
            fontSize: responsive.dp(responsive.isTablet ? 2.0 : 2.5),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: DottedBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.wp(4),
            vertical: responsive.hp(isPortrait ? 1 : 2),
          ),
          child: isPortrait
              ? Column(
                  children: [
                    Expanded(flex: 11, child: animalsGrid),
                    SizedBox(height: responsive.hp(1.5)),
                    Expanded(flex: 9, child: targetsArea),
                    SizedBox(height: responsive.hp(1.5)),
                    confirmButton,
                    SizedBox(height: responsive.hp(1)),
                  ],
                )
              : Row(
                  children: [
                    Expanded(flex: 5, child: animalsGrid),
                    SizedBox(width: responsive.wp(4)),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Expanded(child: targetsArea),
                          SizedBox(height: responsive.hp(2)),
                          confirmButton,
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildAnimalContainer(String animal, Responsive responsive, bool isPortrait) {
    return Draggable<String>(
      data: animal,
      child: AnimalCard(
        animal: animal,
        imagePath: animalImages[animal] ?? 'assets/',
        responsive: responsive,
      ),
      feedback: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: responsive.wp(isPortrait ? 20 : 10),
          height: responsive.wp(isPortrait ? 20 : 10) / (isPortrait ? 0.75 : 0.9),
          child: AnimalCard(
            animal: animal,
            imagePath: animalImages[animal] ?? 'assets/',
            responsive: responsive,
            isDragging: true,
          ),
        ),
      ),
      childWhenDragging: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _buildGroupContainer(
      BuildContext context, String groupName, String expectedCategory, Responsive responsive, bool isPortrait) {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        bool isHovering = candidateData.isNotEmpty;
        return Container(
          padding: EdgeInsets.all(responsive.wp(1)),
          decoration: BoxDecoration(
            color: isHovering ? const Color(0xFFC8E6C9) : const Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isHovering ? const Color(0xFF4CAF50) : const Color(0xFFA5D6A7),
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: responsive.hp(0.5)),
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  groupName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: responsive.dp(isPortrait ? 1.0 : 1.2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: responsive.hp(1)),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Wrap(
                    spacing: responsive.wp(1),
                    runSpacing: responsive.hp(1),
                    alignment: WrapAlignment.center,
                    children: groupedAnimals[expectedCategory]!.map((animal) {
                      return GestureDetector(
                        onTap: () {
                          // Allow removing the animal from the group
                          setState(() {
                            groupedAnimals[expectedCategory]!.remove(animal);
                            remainingAnimals.add(animal);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(responsive.wp(0.5)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              )
                            ],
                          ),
                          child: Image.asset(
                            animalImages[animal]!,
                            width: responsive.wp(isPortrait ? 8 : 4),
                            height: responsive.wp(isPortrait ? 8 : 4),
                            fit: BoxFit.contain,
                          ),
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
          _showMessage("Este contenedor esta lleno.", isError: true);
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
        if (category == 'aves')
          correctGroup = birds;
        else if (category == 'mamíferos')
          correctGroup = mammals;
        else if (category == 'peces')
          correctGroup = fish;
        else
          correctGroup = insects;

        for (String animal in animals) {
          if (!correctGroup.contains(animal)) {
            allGroupedCorrectly = false;
            incorrectAnimals.add(animal);
          }
        }
      });

      if (remainingAnimals.isNotEmpty) {
        _playSound('sounds/incorrect.mp3');
        _showMessage("Aún quedan animales por relacionar.", isError: true);
      } else if (allGroupedCorrectly) {
        gameCompleted = true;
        _showCongratulations();
      } else {
        for (String animal in incorrectAnimals) {
          groupedAnimals.forEach((category, animals) {
            animals.remove(animal);
          });
          remainingAnimals.add(animal);
        }
        _playSound('sounds/incorrect.mp3');
        _showMessage("Algunos animales no pertenecen a esta especie. Vuelve a intentarlo.", isError: true);
      }
    });
  }

  void _showCongratulations() {
    _playSound('sounds/correct.mp3');
    final responsive = Responsive.of(context);
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "¡Felicitaciones!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Has agrupado correctamente\ntodos los animales.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: responsive.hp(2)),
                    Lottie.asset(
                      'assets/lotties/Trofeo - green.json',
                      width: responsive.wp(20),
                      height: responsive.wp(20),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Aceptar",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
      gameCompleted = false;
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

  void _showMessage(String message, {bool isError = false}) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isError ? Icons.error_outline : Icons.info_outline,
                      color: isError ? Colors.redAccent : Colors.orange,
                      size: 60,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Aceptar",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
