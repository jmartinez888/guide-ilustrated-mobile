import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text('Acerca de'),
        ),
        Expanded(
          child: Extend(
            min: true,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Image.asset(
                  'assets/images/guia.png',
                  width: 320,
                  height: 500,
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
                    onPressed: () {
                      Share.share('https://amazonia.iiap.gob.pe/');
                    },
                    child: const Text('https://amazonia.iiap.gob.pe/')),
                const SizedBox(height: 16),
                const Text(
                  'Carretera Iquitos - Nauta Km 4.5, Quistococha, Distrito de San Juan Bautista, Maynas, Loreto: ',
                ),
                TextButton(
                    onPressed: () {
                      Share.share('ciiap@iiap.gob.pe', subject: 'Contacto');
                    },
                    child: const Text('ciiap@iiap.gob.pe')),
                const SizedBox(height: 16),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16.0,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Share.share('https://www.gob.pe/iiap');
                      },
                      child: Image.asset(
                        'assets/images/logoIIAP.jpg',
                        width: 128,
                        height: 128,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Share.share('https://www.gob.pe/minam');
                      },
                      child: Image.asset(
                        'assets/images/logo_minam.png',
                        width: 256,
                        height: 128,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Share.share('https://www.cooperacionespanola.es/');
                      },
                      child: Image.asset(
                        'assets/images/logo_spain.png',
                        width: 256,
                        height: 128,
                      ),
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
