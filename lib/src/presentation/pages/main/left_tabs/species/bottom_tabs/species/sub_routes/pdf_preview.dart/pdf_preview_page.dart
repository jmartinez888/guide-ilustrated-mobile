import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
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
  SpecieRepository get specieRepository => context.read();

  @override
  void initState() {
    super.initState();
    specie = Specie.fromJson(jsonDecode(widget.specie));
  }

  @override
  Widget build(BuildContext context) {
    //late Map<String, dynamic> mainOpaqueColor;
    late Color mainColor;
   /*  mainOpaqueColor =
        getMainColorByString(specie.type != null ? specie.type!.id : 0);
    mainColor = mainOpaqueColor['main'];

    switch (specie.type != null ? specie.type!.id : 0) {
      case 1:
        mainColor = CustomColors.bird;
        pathIcon = 'bird';

        break;
      case 2:
        mainColor = CustomColors.mammal;
        pathIcon = 'mammal';

        break;
      case 3:
        mainColor = CustomColors.reptile;
        pathIcon = 'reptile';

        break;
      case 4:
        mainColor = CustomColors.reptile;
        pathIcon = 'reptile';

        break;
      case 5:
        mainColor = CustomColors.fish;
        pathIcon = 'fish';

        break;
      case 6:
        mainColor = CustomColors.insect;
        pathIcon = 'insect';
        break;
      case 7:
        mainColor = CustomColors.tree;
        pathIcon = 'tree';
        break;
      case 8:
        mainColor = CustomColors.palm;
        pathIcon = 'palm';
        break;
      default:
        mainColor = CustomColors.bird;
        pathIcon = 'bird';
        break;
    } */

    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF'),
      ),
      body: PdfPreview(
        build: (context) => specieRepository.makePdf(
          mainColor: Colors.red,
          pathIcon: pathIcon,
          specie: specie,
        ),
      ),
    );
  }
}
