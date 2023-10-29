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
                  'Bienvenidos a la plataforma web de la guía ilustrada de flora y fauna. Explora la biodiversidad de la región a través de una experiencia interactiva basada en datos actualizados de 2022.',
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
                  'Destaca la impresionante diversidad de la región, educando y sensibilizando a todas las edades tanto dentro como fuera de la Amazonía debido a su belleza e importancia.',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Nuestro objetivo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Buscamos concienciar sobre la importancia de la biodiversidad y su protección, especialmente en las regiones más pobres y entre las poblaciones vulnerables afectadas por la degradación y el cambio climático.',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Contacta al IIAP',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Para más información sobre el proyecto, contacta al Instituto de Investigaciones de la Amazonía Peruana (IIAP) a través de su página web: ',
                  textAlign: TextAlign.justify,
                ),
                TextButton(
                    onPressed: () {
                      Share.share('https://amazonia.iiap.gob.pe/');
                    },
                    child: const Text('https://amazonia.iiap.gob.pe/')),
                const SizedBox(height: 16),
                const Text(
                  'Carretera Iquitos - Nauta Km 4.5, Quistococha, Distrito de San Juan Bautista, Maynas, Loreto: ciiap@iiap.gob.pe',
                ),
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
