import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:species/src/data/services/local/pdf_service.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:species/src/presentation/global/functions/get_main_color_by_int.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
  late Color opaqueColor;
  late Map<String, dynamic> color;
  late String pathIcon;
  SpecieRepository get specieRepository => context.read();
  String baseUrl =
      dotenv.env['API_BASE_URL'] ?? 'https://api-amazonia.iiap.gob.pe/api/v1';
  final pdfService = PdfService();

  @override
  void initState() {
    super.initState();
    specie = Specie.fromJson(jsonDecode(widget.specie));

    color = getMainColorByInt(specie.type != null ? specie.type!.id : 0);

    mainColor = color['main'];
    opaqueColor = color['opaque'];

    switch (specie.type != null ? specie.type!.id : 0) {
      case 1:
        pathIcon = 'bird';

        break;
      case 2:
        pathIcon = 'mammal';

        break;
      case 3:
        pathIcon = 'reptile';

        break;
      case 4:
        pathIcon = 'reptile';

        break;
      case 5:
        pathIcon = 'fish';

        break;
      case 6:
        pathIcon = 'insect';
        break;
      case 7:
        pathIcon = 'tree';
        break;
      case 8:
        pathIcon = 'palm';
        break;
      default:
        pathIcon = 'bird';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Extend(
            child: SafeArea(
              child: PdfPreview(
                build: (context) => pdfService.makePdf(
                  specie: specie,
                  mainColor: mainColor.value.toRadixString(16).substring(2),
                  opaqueColor: opaqueColor.value.toRadixString(16).substring(2),
                  pathIcon: pathIcon,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 8.0,
            top: 8.0,
            child: SafeArea(child: CustomBackButton()),
          ),
        ],
      ),
    );
  }
}
