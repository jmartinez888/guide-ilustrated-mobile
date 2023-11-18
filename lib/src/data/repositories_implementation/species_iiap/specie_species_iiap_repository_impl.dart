import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/data/mappers/specie_mapper.dart';
import 'package:species/src/data/models/species_iiap/response_species_iiap.dart';
import 'package:species/src/data/models/species_iiap/specie_amazonia_iiap.dart';
import 'package:species/src/domain/entities/class.dart';
import 'package:species/src/domain/entities/family.dart';
import 'package:species/src/domain/entities/order.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class SpecieSpeciesIiapRepositoryImpl implements SpecieRepository {
  final baseUrl = 'https://api.amazonia.iiap.gob.pe/api/v1';
  final firebaseInstance = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> getSpecies({
    required int pageKey,
    required int type,
    required int numberOfPostsPerRequest,
    required PagingController pagingController,
    bool asc = true,
  }) async {

    String ascValue = asc ? 'ASC' : 'DESC';
    
    try {
      final response = await get(Uri.parse(
          '$baseUrl/species/search/type/$type/$pageKey/$numberOfPostsPerRequest/$ascValue'));
          print('abc');
      final responseList =
          ResponseSpecieAmazoniaIIAP.fromJson(jsonDecode(response.body));

          print('😘${responseList}🤣');

          print('😘${responseList.toJson()}🤣');

      List<Specie> postList = responseList.species
          .where((speciesIiap) => speciesIiap.vcImagen.isNotEmpty)
          .map((speciesIiap) => SpecieMapper.speciesIiapToEntity(speciesIiap))
          .toList();

      final isLatPage = postList.length < numberOfPostsPerRequest;

      if (isLatPage) {
        pagingController.appendLastPage(postList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(postList, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  @override
  Future<Specie> getSpecieId(String id) async {
    final response = await get(Uri.parse('$baseUrl/species/$id'));
    print('🤣😘${response.body}');
    print('🤣😘${response.statusCode}');
    if (response.statusCode != 200) {
      throw Exception('Specie no existe $id');
    }
    final specieDetail = SpecieAmazoniaIIAP.fromJson(jsonDecode(response.body));
    final Specie specie = SpecieMapper.speciesIiapToEntity(specieDetail);
    return specie;
  }

  @override
  Stream<List<Specie>> getFavoriteSpecies() {
    try {
      final querySnapshot = firebaseInstance
          .doc(_auth.currentUser?.uid)
          .collection('favorites')
          .orderBy('name')
          .snapshots();

      return querySnapshot.map((snapshot) {
        final List<Specie> species = [];

        for (var doc in snapshot.docs) {
          final data = doc.data();
          final specie = Specie.fromJson(data);
          species.add(specie);
        }
        return species;
      });
    } catch (e) {
      throw 'Ha ocurrido un error al obtener las especies';
    }
  }

  @override
  Future<void> saveSpecieFavorite({
    required String userId,
    required Specie specie,
  }) async {
    final docUser = firebaseInstance.doc(userId);
    final getUser = await docUser.get();
    final json = specie.toJson();
    await getUser.reference
        .collection('favorites')
        .doc(specie.id.toString())
        .set(json);
  }

  @override
  Future<void> deleteSpecieFavorite({
    required String userId,
    required int idSpecie,
  }) async {
    final docUser = firebaseInstance.doc(userId);
    final getUser = await docUser.get();
    getUser.reference.collection('favorites').doc(idSpecie.toString()).delete();
  }

  @override
  Future<Uint8List> makePdf({
    required Specie specie,
    required String pathIcon,
    required Color mainColor,
  }) async {
    final pdf = pw.Document();
    final specieImage = await networkImage(specie.images.first);
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
                                    specie.type,
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
                                    text: specie.kingdom,
                                  ),
                                ],
                              ),
                            ),
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
                                    text: specie.phylum,
                                  ),
                                ],
                              ),
                            ),
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
                                    text: specie.class_,
                                  ),
                                ],
                              ),
                            ),
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
                                    text: specie.order,
                                  ),
                                ],
                              ),
                            ),
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
                                    text: specie.family,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                    pw.Text(
                      specie.description.replaceAll('\t', ''),
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
                    text:
                        'Visita: https://amazonia.iiap.gob.pe/species/${specie.id}',
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
    String query = '',
    int? family,
    int? order,
    int? class_,
    String? orderNameScientific = '',
    int? conservationStatus,
    int? hasSound,
    int? taxonomyId,
    required int pageKey,
    required int numberOfPostsPerRequest,
    required PagingController pagingController,
  }) async {
    try {
      final response = await post(
        Uri.parse('$baseUrl/species/filter'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "page": pageKey,
          "pageSize": numberOfPostsPerRequest,
          "taxonomyId": taxonomyId,
          "classId": class_,
          "orderId": order,
          "familyId": family,
          "conservationStatus": conservationStatus,
          "hasSound": hasSound,
          "orderNameScientific": orderNameScientific,
          "search": query
        }),
      );

      final responseList =
          ResponseSpecieAmazoniaIIAP.fromJson(jsonDecode(response.body));

      List<Specie> postList = responseList.species
          .where((speciesIiap) => speciesIiap.vcImagen.isNotEmpty)
          .map((speciesIiap) => SpecieMapper.speciesIiapToEntity(speciesIiap))
          .toList();

      final isLatPage = postList.length < numberOfPostsPerRequest;

      if (isLatPage) {
        pagingController.appendLastPage(postList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(postList, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  @override
  Future<List<Class>> getClasses() async {
    try {
      final response = await get(Uri.parse('$baseUrl/classes'));
      if (response.statusCode == 200) {
        final List<dynamic> responseList = json.decode(response.body);
        List<Class> classList =
            responseList.map((item) => Class.fromMap(item)).toList();
        return classList;
      } else {
        return [];
      }
    } catch (e) {
      throw 'Error en la solicitud: $e';
    }
  }

  @override
  Future<List<OrderClass>> getOrdersByClassId(int familyId) async {
    try {
      final response =
          await get(Uri.parse('$baseUrl/orders/by-class/$familyId'));
      if (response.statusCode == 200) {
        final List<dynamic> responseList = json.decode(response.body);
        List<OrderClass> orderList =
            responseList.map((item) => OrderClass.fromMap(item)).toList();
        return orderList;
      } else {
        return [];
      }
    } catch (e) {
      throw 'Error en la solicitud: $e';
    }
  }

  @override
  Future<List<Family>> getFamilies(int orderId) async {
    try {
      final response =
          await get(Uri.parse('$baseUrl/families/by-order/$orderId'));
      if (response.statusCode == 200) {
        final List<dynamic> responseList = json.decode(response.body);
        List<Family> orderList =
            responseList.map((item) => Family.fromMap(item)).toList();
        return orderList;
      } else {
        return [];
      }
    } catch (e) {
      throw 'Error en la solicitud: $e';
    }
  }
}
