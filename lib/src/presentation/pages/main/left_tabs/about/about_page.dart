import 'package:flutter/material.dart';
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
    return Column(
      children: [
        AppBar(
          title: const Text('Acerca de'),
        ),
        Expanded(
          child: Extend(
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
                  child: const Text('Obtener libro'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'AMAZONÍA',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(1, 94, 128, 1)),
                ),
                const Text(
                  'Guía ilustrada de flora y fauna',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromRGBO(139, 180, 56, 1)),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Bienvenidos a la plataforma móvil de la Guía Ilustrada de Flora y Fauna de la Amazonía. Adéntrate en la riqueza y diversidad de esta región única a través de una experiencia interactiva basada en datos actualizados hasta el año 2022',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Sobre el contenido',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Nuestra plataforma es una ventana a la asombrosa biodiversidad amazónica. A través de contenido experto y visualmente impactante, te invitamos a explorar la inigualable belleza de esta región y comprender su importancia crítica para nuestro planeta.',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Nuestro compromiso',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Nos esforzamos por concienciar sobre la inmensa importancia de la biodiversidad y su protección, especialmente en las regiones más vulnerables y entre las poblaciones afectadas por la degradación y el cambio climático.',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Contactanos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Para más información sobre el proyecto, contacta al Instituto de Investigaciones de la Amazonía Peruana (IIAP) a través de la página web: ',
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
                const Text(
                  'Carretera Iquitos - Nauta Km 4.5, Quistococha, Distrito de San Juan Bautista, Maynas, Loreto: ',
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
        ),
      ],
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
