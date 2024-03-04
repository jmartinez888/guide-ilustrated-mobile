import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/data/services/remote/specie_api.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class SpecieRepositoryImpl implements SpecieRepository {
  final baseUrl = 'https://api.amazonia.iiap.gob.pe/api/v1';
  final firebaseInstance = FirebaseFirestore.instance.collection('users');
  final SpecieApi _specieApi;
  SpecieRepositoryImpl({
    required SpecieApi specieApi,
  }) : _specieApi = specieApi;

  @override
  Future<Either<HttpRequestFailure, List<Specie>>> getSpecies({
    required int pageNumber,
    required int type,
    required int numberOfPostsPerRequest,
    required bool orderByName,
    required bool orderAsc,
  }) {
    return _specieApi.getSpecies(
      pageNumber: pageNumber,
      type: type,
      numberOfPostsPerRequest: numberOfPostsPerRequest,
      orderByName: orderByName,
      orderAsc: orderAsc,
    );
  }

  @override
  Future<Either<HttpRequestFailure, Specie>> getSpecie(String id) {
    return _specieApi.getSpecie(id);
  }

  @override
  Future<Uint8List> makePdf({
    required Specie specie,
    required String pathIcon,
    required Color mainColor,
  }) async {
    final pdf = pw.Document();
    final specieImage = await networkImage(specie.image ?? '');
    final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List(),
    );
    final logoMinam = pw.MemoryImage(
      (await rootBundle.load('assets/images/logo_minam.png'))
          .buffer
          .asUint8List(),
    );
    final logoIIAP = pw.MemoryImage(
      (await rootBundle.load('assets/images/logoIIAP.jpg'))
          .buffer
          .asUint8List(),
    );
    final logoSpain = pw.MemoryImage(
      (await rootBundle.load('assets/images/logo_spain.png'))
          .buffer
          .asUint8List(),
    );

    final specieIcon = pw.MemoryImage(
      (await rootBundle.load('assets/icons/species/images_icons/$pathIcon.png'))
          .buffer
          .asUint8List(),
    );

    final hexValue = mainColor.value.toRadixString(16).substring(2);
    final formattedHexValue = hexValue.padLeft(6, '0');

    pdf.addPage(
      pw.MultiPage(
        margin: const pw.EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => [
          pw.Stack(
            alignment: pw.Alignment.bottomCenter,
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 148.0),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      children: [
                        pw.Container(
                          padding: const pw.EdgeInsets.only(right: 8.0),
                          child: pw.Image(
                            logoImage,
                            height: 56.0,
                            width: 56.0,
                          ),
                        ),
                        pw.Column(
                          children: [
                            pw.Text(
                              'AMAZONÍA',
                              style: pw.TextStyle(
                                fontSize: 22.0,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.Text(
                              'Guía ilustrada de flora y fauna',
                              style: pw.TextStyle(
                                fontSize: 9.0,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    pw.Container(
                      height: 8.0,
                      width: double.infinity,
                      color: PdfColor.fromHex('#005E80FF'),
                    ),
                    pw.Row(
                      mainAxisSize: pw.MainAxisSize.min,
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              color: PdfColor.fromHex(formattedHexValue),
                              padding: const pw.EdgeInsets.all(16.0),
                              child: pw.Column(
                                children: [
                                  pw.Image(
                                    specieIcon,
                                    height: 24.0,
                                    width: 24.0,
                                  ),
                                  pw.Text(
                                    specie.type!.name!,
                                    style: pw.TextStyle(
                                      color: PdfColor.fromHex('#ffffff'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.SizedBox(width: 8.0),
                          ],
                        ),
                        pw.Expanded(
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              mainAxisSize: pw.MainAxisSize.max,
                              children: [
                                pw.Paragraph(
                                  text: specie.name,
                                  style: pw.TextStyle(
                                    fontSize: 16.0,
                                    color: PdfColor.fromHex(formattedHexValue),
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                  margin: const pw.EdgeInsets.only(bottom: 8.0),
                                ),
                                pw.Paragraph(
                                  text: specie.scientificName,
                                  style: pw.TextStyle(
                                    fontSize: 14.0,
                                    fontStyle: pw.FontStyle.italic,
                                  ),
                                  margin: const pw.EdgeInsets.only(bottom: 8.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.GridView(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      children: [
                        pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(bottom: 16.0),
                              child: pw.Text(
                                'Taxonomía:',
                                style: pw.TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromHex('#808080'),
                                ),
                              ),
                            ),
                            if (specie.taxonomy != null &&
                                specie.taxonomy!.kingdom != null &&
                                specie.taxonomy!.kingdom!.name != null &&
                                specie.taxonomy!.kingdom!.name!.isNotEmpty)
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text: 'Reino:     ',
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    pw.TextSpan(
                                      text: specie.taxonomy!.kingdom!.name,
                                    ),
                                  ],
                                ),
                              ),
                            if (specie.taxonomy != null &&
                                specie.taxonomy!.phylum != null &&
                                specie.taxonomy!.phylum!.name != null &&
                                specie.taxonomy!.phylum!.name!.isNotEmpty)
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text: 'Filo:        ',
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold,
                                          fontSize: 12.0),
                                    ),
                                    pw.TextSpan(
                                      text: specie.taxonomy!.phylum!.name,
                                    ),
                                  ],
                                ),
                              ),
                            if (specie.taxonomy != null &&
                                specie.taxonomy!.classC != null &&
                                specie.taxonomy!.classC!.name != null &&
                                specie.taxonomy!.classC!.name!.isNotEmpty)
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text: 'Clase:     ',
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    pw.TextSpan(
                                      text: specie.taxonomy!.classC!.name,
                                    ),
                                  ],
                                ),
                              ),
                            if (specie.taxonomy != null &&
                                specie.taxonomy!.order != null &&
                                specie.taxonomy!.order!.name != null &&
                                specie.taxonomy!.order!.name!.isNotEmpty)
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text: 'Orden:    ',
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    pw.TextSpan(
                                      text: specie.taxonomy!.order!.name,
                                    ),
                                  ],
                                ),
                              ),
                            if (specie.taxonomy != null &&
                                specie.taxonomy!.family != null &&
                                specie.taxonomy!.family!.name != null &&
                                specie.taxonomy!.family!.name!.isNotEmpty)
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text: 'Familia:   ',
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    pw.TextSpan(
                                      text: specie.taxonomy!.order!.name,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        if (specie.image != null)
                          pw.Container(
                            width: double.infinity,
                            height: 512.0,
                            child: pw.Image(
                              specieImage,
                              fit: pw.BoxFit.contain,
                            ),
                          )
                      ],
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(bottom: 16.0, top: 8.0),
                      child: pw.Text(
                        'Decripción:',
                        style: pw.TextStyle(
                          fontSize: 18.0,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColor.fromHex('#808080'),
                        ),
                      ),
                    ),
                    if (specie.description != null &&
                        specie.description!.isNotEmpty)
                      pw.Text(
                        specie.description!.replaceAll('\t', ''),
                        style: const pw.TextStyle(fontSize: 12.0),
                      ),
                  ],
                ),
              ),
              pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Paragraph(
                    text: 'Visita: $baseUrl/species/${specie.id}',
                    style: pw.TextStyle(color: PdfColor.fromHex('#808080')),
                    margin: pw.EdgeInsets.zero,
                  ),
                  pw.Container(
                    color: PdfColor.fromHex('#2E9159'),
                    height: 8.0,
                  ),
                  pw.SizedBox(
                    height: 64.0,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Expanded(
                          child: pw.Container(
                            height: 40.0,
                            color: PdfColor.fromHex('#ff0000'),
                            child: pw.Image(
                              logoMinam,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.SizedBox(
                            height: 40.0,
                            child: pw.Row(
                              children: [
                                pw.Image(
                                  logoIIAP,
                                ),
                                pw.Container(
                                  height: 40.0,
                                  padding: const pw.EdgeInsets.symmetric(
                                      horizontal: 2.0, vertical: 4.0),
                                  alignment: pw.Alignment.center,
                                  color: PdfColor.fromHex('#000000'),
                                  child: pw.Text(
                                    'Insitiuto de Investigaciones\nde la Amazonía Peruana',
                                    style: pw.TextStyle(
                                      color: PdfColor.fromHex('#ffffff'),
                                      fontSize: 9.0,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Container(
                            height: 40.0,
                            color: PdfColor.fromHex('#0000ff'),
                            child: pw.Image(
                              logoSpain,
                              height: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
    return pdf.save();
  }

  @override
  Future<void> filterSpecies({
    required PagingController pagingController,
    required int pageKey,
    required int numberOfPostsPerRequest,
    int? taxonomyId,
    int? class_,
    int? order,
    int? family,
    int? conservationStatus,
    int? hasSound,
    String query = '',
    String? orderByName = '',
    String? orderType = '',
  }) {
    return _specieApi.filterSpecies(
      pagingController: pagingController,
      pageKey: pageKey,
      numberOfPostsPerRequest: numberOfPostsPerRequest,
    );
  }
}
