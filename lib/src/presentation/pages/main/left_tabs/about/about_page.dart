import 'package:flutter/material.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final Uri url =
        Uri.parse('https://repositorio.iiap.gob.pe/handle/20.500.12921/680');
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(texts.aboutProject.title),
      ),
      body: Extend(
        min: true,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            Image.asset(
              'assets/images/guia.png',
              width: size.width * 0.8,
              height: size.height * 0.4,
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () async {
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: Text(texts.aboutProject.getBook),
            ),
            const SizedBox(height: 16),
            Text(
              texts.aboutProject.titleBook,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(1, 94, 128, 1)),
            ),
            Text(
              texts.aboutProject.subtitleBook,
              style: const TextStyle(
                  fontSize: 20, color: Color.fromRGBO(139, 180, 56, 1)),
            ),
            const SizedBox(height: 16),
            Text(
              texts.aboutProject.p1,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            Text(
              texts.aboutProject.content,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              texts.aboutProject.p2,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            Text(
              texts.aboutProject.commitment,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              texts.aboutProject.p3,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            Text(
              texts.aboutProject.contact,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              texts.aboutProject.p4,
              textAlign: TextAlign.justify,
            ),
            TextButton(
                onPressed: () async {
                  final Uri url0 =
                      Uri.parse('https://amazonia.iiap.gob.pe/species');
                  if (!await launchUrl(url0)) {
                    throw Exception('Could not launch $url0');
                  }
                },
                child: const Text('amazonia.iiap.gob.pe')),
            const SizedBox(height: 16),
            Text(
              texts.aboutProject.address,
            ),
            const SizedBox(height: 16),
            const Wrap(
              alignment: WrapAlignment.center,
              spacing: 16.0,
              children: [
                _OrganizationImageButton(
                  urlAddress: 'https://www.gob.pe/iiap',
                  imageUrl: 'assets/images/logoIIAP.jpg',
                  imageHeight: 128,
                  imageWidth: 128,
                ),
                _OrganizationImageButton(
                  urlAddress: 'https://www.gob.pe/minam',
                  imageUrl: 'assets/images/logo_minam.png',
                  imageHeight: 128,
                  imageWidth: 256,
                ),
                _OrganizationImageButton(
                  urlAddress: 'https://www.cooperacionespanola.es/',
                  imageUrl: 'assets/images/logo_spain.png',
                  imageHeight: 128,
                  imageWidth: 256,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _OrganizationImageButton extends StatelessWidget {
  final String urlAddress;
  final String imageUrl;
  final double imageWidth;
  final double imageHeight;

  const _OrganizationImageButton(
      {required this.urlAddress,
      required this.imageUrl,
      required this.imageWidth,
      required this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Uri url = Uri.parse(urlAddress);
        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        }
      },
      child: Image.asset(
        imageUrl,
        width: imageWidth,
        height: imageHeight,
      ),
    );
  }
}
