import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:species/src/data/repositories_implementation/species_iiap/specie_species_iiap_repository_impl.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:species/src/presentation/global/colors.dart';
import 'package:species/src/presentation/global/functions/get_main_color_by_string.dart';

class PdfPreviewPage extends StatefulWidget {
  final String specie;
  const PdfPreviewPage({
    super.key,
    required this.specie,
  });

  @override
  State<PdfPreviewPage> createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  late Specie specie;
  late Color mainColor;
  late String pathIcon;
  final SpecieRepository userIiap = SpecieSpeciesIIapRepositoryImpl();

  @override
  void initState() {
    super.initState();
    specie = Specie.fromJson(jsonDecode(widget.specie));
  }

  @override
  Widget build(BuildContext context) {
    late Map<String, dynamic> mainOpaqueColor;
    late Color mainColor;
    mainOpaqueColor = getMainColorByString(specie.type);
    mainColor = mainOpaqueColor['main'];

    switch (specie.type) {
      case 'Aves':
        mainColor = CustomColors.bird;
        pathIcon = 'bird';

        break;
      case 'Mamiferos':
        mainColor = CustomColors.mammal;
        pathIcon = 'mammal';

        break;
      case 'Reptiles':
        mainColor = CustomColors.reptile;
        pathIcon = 'reptile';

        break;
      case 'Anfibios':
        mainColor = CustomColors.reptile;
        pathIcon = 'reptile';

        break;
      case 'Peces':
        mainColor = CustomColors.fish;
        pathIcon = 'fish';

        break;
      case 'Insectos':
        mainColor = CustomColors.insect;
        pathIcon = 'insect';
        break;
      case 'Arboles':
        mainColor = CustomColors.tree;
        pathIcon = 'tree';
        break;
      case 'Palmeras':
        mainColor = CustomColors.palm;
        pathIcon = 'palm';
        break;
      default:
        mainColor = CustomColors.bird;
        pathIcon = 'bird';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF'),
      ),
      body: PdfPreview(
        build: (context) => userIiap.makePdf(
          mainColor: mainColor,
          pathIcon: pathIcon,
          specie: specie,
        ),
      ),
    );
  }
}
