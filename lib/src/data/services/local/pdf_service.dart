import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:species/src/domain/entities/class/class.dart';
import 'package:species/src/domain/entities/family/family.dart';
import 'package:species/src/domain/entities/kindom/kindom.dart';
import 'package:species/src/domain/entities/order/order.dart';
import 'package:species/src/domain/entities/phylum/phylum.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/generated/translations.g.dart';

class PdfService {
  static const String _baseUrl = 'https://api.amazonia.iiap.gob.pe/api/v1';

  Future<Uint8List> makePdf({
    required Specie specie,
    required String mainColor,
    required String opaqueColor,
    required String pathIcon,
  }) async {
    final pdf = pw.Document();

    pw.ImageProvider? specieImage;
    if (specie.images != null &&
        specie.images!.isNotEmpty &&
        specie.images!.first.isNotEmpty) {
      specieImage = (await networkImage(specie.images!.first));
    }

    List<pw.ImageProvider>? images;
    if (specie.authors != null && specie.authors!.isNotEmpty) {
      images = [];
      for (final author in specie.authors!) {
        if (author.images != null &&
            author.images!.isNotEmpty &&
            author.images!.first.isNotEmpty) {
          images.add(await networkImage(author.images!.first));
        }
      }
    }

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

    final hexValue = mainColor;
    final formattedHexValue = hexValue.padLeft(6, '0');

    pdf.addPage(
      pw.MultiPage(
        header: (_) => pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 8.0),
            child: _listTile(
              leading: pw.Image(
                logoImage,
                height: 56.0,
                width: 40.0,
                fit: pw.BoxFit.fill,
              ),
              title: _textLarge(texts.pdfPreviewPage.amazon),
              subtitle: _text(texts.pdfPreviewPage.title),
            )),
        footer: (_) => pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 8.0),
              child: _textSmall(
                'Visita: $_baseUrl/species/${specie.id}',
                color: '#808080',
              ),
            ),
            pw.SizedBox(
              width: double.infinity,
              height: 40.0,
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Expanded(
                    child: pw.Image(
                      logoMinam,
                      fit: pw.BoxFit.fill,
                    ),
                  ),
                  pw.SizedBox(width: 8.0),
                  pw.Expanded(
                    child: pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Image(
                          logoIIAP,
                          height: 40.0,
                          width: 40.0,
                        ),
                        pw.Expanded(
                          child: pw.Container(
                            padding: const pw.EdgeInsets.all(4.0),
                            decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(4.0),
                              color: PdfColor.fromHex('#9E9E9E'),
                            ),
                            child: _textSmall(
                              texts.pdfPreviewPage.institute,
                              color: '#ffffff',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(width: 8.0),
                  pw.Expanded(
                    child: pw.Image(
                      logoSpain,
                      fit: pw.BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        margin: const pw.EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => [
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 16.0),
            child: _listTile(
              leading: _containerColor(
                child: pw.Column(
                  children: [
                    pw.Image(
                      specieIcon,
                      height: 24.0,
                      width: 24.0,
                    ),
                    _text(
                        specie.type!.name!
                            .replaceAll('”', '"')
                            .replaceAll('“', '"'),
                        color: '#ffffff'),
                  ],
                ),
                borderRadius: 12.0,
                color: formattedHexValue,
              ),
              title: _textLarge(
                specie.name?.replaceAll('”', '"').replaceAll('“', '"') ??
                    texts.pdfPreviewPage.commonNameNotAvailable,
                color: formattedHexValue,
              ),
              subtitle: _text(
                specie.scientificName
                        ?.replaceAll('”', '"')
                        .replaceAll('“', '"') ??
                    texts.pdfPreviewPage.scientificNameNotAvailable,
                fontStyle: pw.FontStyle.italic,
              ),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 8.0),
            child: pw.SizedBox(
              height: 320.0,
              child: pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Center(
                      child: pw.SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: specieImage != null
                            ? pw.ClipRRect(
                                horizontalRadius: 16.0,
                                verticalRadius: 16.0,
                                child: pw.Image(
                                  specieImage,
                                  fit: pw.BoxFit.contain,
                                ),
                              )
                            : pw.Text('sds'),
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 8.0),
                  pw.Expanded(
                    child: pw.Center(
                      child: _tableSpecie(
                        hexMainColor: formattedHexValue,
                        hexOpaqueColor: opaqueColor,
                        classC: specie.classC,
                        family: specie.family,
                        kingdom: specie.kingdom,
                        order: specie.order,
                        phylum: specie.phylum,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (specie.year != null &&
              specie.year!.isNotEmpty &&
              specie.year! != '0')
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: _containerColor(
                child: _text('Año: ${specie.year!}', color: '#ffffff'),
                color: formattedHexValue,
                padding: const pw.EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 16.0),
              ),
            ),
          if (specie.description != null && specie.description!.isNotEmpty)
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 8.0),
              child: _textSmall(
                specie.description!
                    .replaceAll('\t', '')
                    .replaceAll('”', '"')
                    .replaceAll('“', '"'),
                textAlign: pw.TextAlign.justify,
              ),
            ),
          if (specie.authors != null && specie.authors!.isNotEmpty)
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: _textLarge(
                specie.authors!.length > 1 ? texts.pdfPreviewPage.authors : texts.pdfPreviewPage.author,
                color: '#348A29',
              ),
            ),
          if (specie.authors != null && specie.authors!.isNotEmpty)
            pw.ListView.separated(
              itemCount: specie.authors!.length,
              separatorBuilder: (_, __) => pw.SizedBox(height: 8.0),
              itemBuilder: (_, index) {
                final author = specie.authors![index];
                return pw.Column(
                  children: [
                    pw.Row(
                      children: [
                        pw.Expanded(
                          child: pw.Center(
                            child: pw.SizedBox(
                              height: 256.0,
                              child: images != null && images.isNotEmpty
                                  ? pw.ClipRRect(
                                      horizontalRadius: 16.0,
                                      verticalRadius: 16.0,
                                      child: pw.Image(
                                        images[index],
                                        fit: pw.BoxFit.contain,
                                      ),
                                    )
                                  : _text(texts.pdfPreviewPage.imageNotAvailable),
                            ),
                          ),
                        ),
                        pw.SizedBox(width: 8.0),
                        pw.Expanded(
                          child: pw.Center(
                            child: _tableAuthor(
                              hexMainColor: '#348A29',
                              hexOpaqueColor: '#E6E6E8',
                              name: author.name,
                              proffesion: author.profession,
                              yearOfBirth: author.yearOfBirth,
                              yearOfDeath: author.yearOfDeath,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (author.biography != null &&
                        author.biography!.isNotEmpty)
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(top: 8.0),
                        child: _textSmall(
                          author.biography!
                              .replaceAll('”', '"')
                              .replaceAll('“', '"')
                              .trim(),
                          textAlign: pw.TextAlign.justify,
                        ),
                      ),
                  ],
                );
              },
            ),
        ],
      ),
    );
    return pdf.save();
  }

  pw.Text _textLarge(
    String text, {
    String? color,
    pw.FontStyle? fontStyle,
    pw.TextAlign? textAlign,
  }) =>
      pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: 16.0,
          fontWeight: pw.FontWeight.bold,
          color: color != null ? PdfColor.fromHex(color) : null,
          fontStyle: fontStyle,
        ),
        textAlign: textAlign,
      );

  pw.Text _text(
    String text, {
    String? color,
    pw.FontStyle? fontStyle,
    pw.TextAlign? textAlign,
  }) =>
      pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: 14.0,
          color: color != null ? PdfColor.fromHex(color) : null,
          fontStyle: fontStyle,
        ),
        textAlign: textAlign,
      );

  pw.Text _textSmall(
    String text, {
    String? color,
    pw.FontStyle? fontStyle,
    pw.TextAlign? textAlign,
  }) =>
      pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: 10.0,
          color: color != null ? PdfColor.fromHex(color) : null,
          fontStyle: fontStyle,
        ),
        textAlign: textAlign,
      );

  pw.Widget _listTile({
    pw.Widget? leading,
    required pw.Text title,
    pw.Text? subtitle,
  }) =>
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          if (leading != null)
            pw.Padding(
              padding: const pw.EdgeInsets.only(right: 8.0),
              child: pw.SizedBox(child: leading),
            ),
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                title,
                if (subtitle != null) subtitle,
              ],
            ),
          ),
        ],
      );

  pw.Widget _tableSpecie({
    required String hexMainColor,
    required String hexOpaqueColor,
    Kingdom? kingdom,
    Phylum? phylum,
    ClassC? classC,
    OrderC? order,
    Family? family,
  }) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        borderRadius: pw.BorderRadius.circular(16.0),
        border: pw.Border.all(
          width: 2,
          color: PdfColor.fromHex(hexMainColor),
        ),
      ),
      child: pw.Column(
        mainAxisSize: pw.MainAxisSize.min,
        children: [
          doubleListTile(
            firstText: texts.pdfPreviewPage.taxonomicInformation,
            hexBackgroundColor: hexOpaqueColor,
            textColor: hexMainColor,
          ),
          pw.Divider(
            height: 2.0,
            thickness: 2.0,
            color: PdfColor.fromHex(hexMainColor),
          ),
          doubleListTile(
            firstText: texts.pdfPreviewPage.kingdom,
            secondText: kingdom?.name ?? '-',
            hexDivideColor: hexMainColor,
          ),
          customDivider(hexMainColor),
          doubleListTile(
            firstText: texts.pdfPreviewPage.phylum,
            secondText: phylum?.name ?? '-',
            hexDivideColor: hexMainColor,
          ),
          customDivider(hexMainColor),
          doubleListTile(
            firstText: texts.pdfPreviewPage.class_,
            secondText: classC?.name ?? '-',
            hexDivideColor: hexMainColor,
          ),
          customDivider(hexMainColor),
          doubleListTile(
            firstText: texts.pdfPreviewPage.order,
            secondText: order?.name ?? '-',
            hexDivideColor: hexMainColor,
          ),
          customDivider(hexMainColor),
          doubleListTile(
            firstText: texts.pdfPreviewPage.family,
            secondText: family?.name ?? '-',
            hexDivideColor: hexMainColor,
          ),
        ],
      ),
    );
  }

  pw.Widget customDivider(String hexMainColor) => pw.Divider(
        height: 1.5,
        thickness: 1.5,
        indent: 8.0,
        endIndent: 8.0,
        color: PdfColor.fromHex(hexMainColor),
      );
  pw.Widget doubleListTile({
    String? firstText,
    String? secondText,
    String? hexDivideColor,
    String? hexBackgroundColor,
    String? textColor,
  }) {
    const padding = pw.EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0);
    return pw.Container(
      margin: const pw.EdgeInsets.fromLTRB(1, 1, 1, -1.0),
      decoration: pw.BoxDecoration(
          color: hexBackgroundColor != null
              ? PdfColor.fromHex(hexBackgroundColor)
              : null,
          borderRadius: pw.BorderRadius.only(
            topLeft: secondText == null
                ? const pw.Radius.circular(15.25)
                : pw.Radius.zero,
            topRight: secondText == null
                ? const pw.Radius.circular(15.25)
                : pw.Radius.zero,
          )),
      child: pw.Row(
        children: [
          if (firstText != null)
            pw.Expanded(
              child: pw.Container(
                padding: padding,
                child: secondText == null
                    ? _text(firstText, color: textColor)
                    : _textSmall(
                        firstText.replaceAll('”', '"').replaceAll('“', '"')),
              ),
            ),
          if (hexDivideColor != null)
            pw.Container(
              height: 24.0,
              width: 1.5,
              color: PdfColor.fromHex(hexDivideColor),
            ),
          if (secondText != null)
            pw.Expanded(
              child: pw.Container(
                padding: padding,
                child: _textSmall(
                    secondText.replaceAll('”', '"').replaceAll('“', '"')),
              ),
            ),
        ],
      ),
    );
  }

  pw.Widget _tableAuthor({
    required String hexMainColor,
    required String hexOpaqueColor,
    String? name,
    String? lastname,
    String? proffesion,
    String? yearOfBirth,
    String? yearOfDeath,
  }) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        borderRadius: pw.BorderRadius.circular(16.0),
        border: pw.Border.all(
          width: 2,
          color: PdfColor.fromHex(hexMainColor),
        ),
      ),
      child: pw.Column(
        mainAxisSize: pw.MainAxisSize.min,
        children: [
          doubleListTile(
            firstText: texts.pdfPreviewPage.authorInformation,
            hexBackgroundColor: hexOpaqueColor,
            textColor: hexMainColor,
          ),
          pw.Divider(
            height: 2.0,
            thickness: 2.0,
            color: PdfColor.fromHex(hexMainColor),
          ),
          doubleListTile(
            firstText: texts.pdfPreviewPage.name,
            secondText:
                '${name != null && name.isNotEmpty && !name.startsWith('NA') && !name.startsWith('-') && !name.startsWith('N/A') ? name : '-'} ',
            hexDivideColor: hexMainColor,
          ),
          customDivider(hexMainColor),
          doubleListTile(
            firstText: texts.pdfPreviewPage.lastname,
            secondText:
                '${lastname != null && lastname.isNotEmpty && !lastname.startsWith('NA') && !lastname.startsWith('-') && !lastname.startsWith('N/A') ? lastname : '-'} ',
            hexDivideColor: hexMainColor,
          ),
          customDivider(hexMainColor),
          doubleListTile(
            firstText: texts.pdfPreviewPage.profession,
            secondText: proffesion ?? '-',
            hexDivideColor: hexMainColor,
          ),
          customDivider(hexMainColor),
          doubleListTile(
            firstText: texts.pdfPreviewPage.bornIn,
            secondText: yearOfBirth ?? '-',
            hexDivideColor: hexMainColor,
          ),
          customDivider(hexMainColor),
          doubleListTile(
            firstText: texts.pdfPreviewPage.diedIn,
            secondText: yearOfDeath ?? '-',
            hexDivideColor: hexMainColor,
          ),
        ],
      ),
    );
  }

  pw.Widget _containerColor({
    required pw.Widget child,
    String? color,
    double? borderRadius,
    pw.EdgeInsets? padding,
  }) =>
      pw.Container(
        decoration: pw.BoxDecoration(
            color: color != null ? PdfColor.fromHex(color) : null,
            borderRadius: pw.BorderRadius.circular(borderRadius ?? 16.0)),
        padding: padding ?? const pw.EdgeInsets.all(8.0),
        child: child,
      );
}
