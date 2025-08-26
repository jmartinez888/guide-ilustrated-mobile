import 'package:flutter/material.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:url_launcher/url_launcher.dart';

class StaffPage extends StatelessWidget {
  const StaffPage({super.key});

   String _iconForUrl(Uri url) {
    final host = url.host.toLowerCase();
    if (host == 'github.com' || host.endsWith('.github.com')) {
      return 'assets/icons/github.png';
    }
    if (host == 'behance.net' || host == 'www.behance.net' || host.endsWith('.behance.net')) {
      return 'assets/icons/behance.png';
    }
    // Fallback (elige el que prefieras tener disponible en assets)
    return 'assets/icons/github.png';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context), // Diálogo de confirmación
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: const SizedBox(),
              title: Text(texts.staff.title),
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _titleSection(context, texts.staff.coordinationTeam),
                  const SizedBox(height: 8.0),
                  _subtitleSection(context, texts.staff.editorialCoordination),
                  _text('Manuel Martín Brañas;\nJuan José Bellido Collahuacho'),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: _subtitleSection(context, texts.staff.reviewCommittee),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: PaddingConfig.allL,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16.0,
                  runSpacing: 16.0,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          _reviewerTitle(context, texts.staff.textReview),
                          _text('Manuel Martín Brañas, IIAP;\nJuan José Bellido Collahuacho, IIAP.'),
                          _reviewerTitle(context, 'Revisión anfibios y reptiles:'),
                          _text('Giussepe Gagliardi Urrutia, IIAP.'),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          _reviewerTitle(context, texts.staff.birdReview),
                          _text('José Álvarez Alonso, MINAM;\nJuan Díaz Alván, UCP.'),
                          _reviewerTitle(context, texts.staff.fishReview),
                          _text('Carmen Rosa García Dávila, IIAP;\nKevin Morgan Ruíz Tafur, IIAP.'),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          _reviewerTitle(context, texts.staff.insectReview),
                          _text('Joel Bardales Vásquez, IIAP;\nWalter Leonardo Vásquez Mora, UNAP.'),
                          _reviewerTitle(context, 'Revisión palmeras:'),
                          _text('Kember Mejía Carhuanca, IIAP.'),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          _reviewerTitle(context, texts.staff.plantReview),
                          _text('Nállarett Dávila Cardozo, IIAP;\nRicardo Zárate Gómez, IIAP;\nElsa Renjifo Salgado, IIAP.'),
                          _reviewerTitle(context, 'Revisión mamíferos:'),
                          _text('Pedro Pérez Peña, IIAP.'),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          _reviewerTitle(context, texts.staff.mapMaking),
                          _text('Juan José Palacios Vega,\nLizardo Fachín Malaverri.'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _subtitleSection(context, texts.staff.illustrations),
                  const SizedBox(height: 8.0),
                  _text('Jaime Choclote Martínez;\n Nicolás Farroñay Kanaffo y Javier Vela.'),
                ],
              ),
            ),
            SliverToBoxAdapter(child: _subtitleSection(context, texts.staff.sounds)),
            SliverToBoxAdapter(child: _reviewerTitle(context, texts.staff.birds)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16.0,
                  runSpacing: 16.0,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          _text('Roger Ahlman;\n Frank Lambert;\n Juan Diaz;\n Thomas S. Schulenberg;\n Curtis A. Marantz;\n Peter H. English;\n Niels Krabbe;\n Olaf Jhan.'),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          _text('Peter Boesman;\n Alejandro Luy;\n Thibaud Aronson;\n Pedro Allasi;\n Andrew Spencer;\n Jaime Suarez;\n Guilherme Melo;\n John V Moore.'),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          _text('Carlos Octavio Gussoni;\n Edson Endrigo;\n Scarlet Medina;\n David F Belmonte;\n Glen Seeholzer;\n Daniel Lane;\n Fernando Angulo;\n Davis Finch.'),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          _text('Ted Parker;\n Jonas Nilsson;\nRaul Pommer;\n Jerome Fischer;\n Paul Marvin;\n Fabio Toledo;\n Manuel Roncal.'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16.0,
                  runSpacing: 16.0,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          _reviewerTitle(context, texts.staff.monkeys),
                          _text('Roberta Aralla'),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          _reviewerTitle(context, texts.staff.amphibians),
                          _text('José Manuel Padial;\nGiussepe Gagliardi Urrutia.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: _titleSection(context, texts.staff.developmentTeam),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  alignment: WrapAlignment.center,
                  children: [
                    _staffProfile(
                      context,
                      role: texts.staff.technicalLeader,
                      name: 'Jhon Charlie Martinez Carranza',
                      image: 'assets/staff/jhon.jpg',
                      github: 'https://github.com/jmartinez888',
                    ),
                    _staffProfile(
                      context,
                      role: texts.staff.mobileDeveloper,
                      name: 'Edson Isaias Sánchez Chota',
                      image: 'assets/staff/edson.jpg',
                      github: 'https://github.com/edisaiassan',
                    ),
                    _staffProfile(
                      context,
                      role: texts.staff.mobileDeveloper,
                      name: 'Jorge Antonio Del Aguila Malafaya',
                      image: 'assets/staff/antonio.jpg',
                      github: 'https://github.com/JorgeAntonio',
                    ),
                    _staffProfile(
                      context,
                      role: texts.staff.mobileDeveloper,
                      name: 'Tercer David Ahuite Murayari',
                      image: 'assets/staff/david.jpeg',
                      github: 'https://github.com/TerDavid',
                    ),
                     _staffProfile(
                      context,
                      role: texts.staff.mobileDeveloper,
                      name: 'Jose Sergio Siguas Salas',
                      image: 'assets/staff/sergio.webp',
                      github: 'https://github.com/SergioSiguas',
                    ),
                    _staffProfile(
                      context,
                      role: texts.staff.developmentFrontend,
                      name: 'Santos Panaifo José Jefferson',
                      image: 'assets/staff/santos.png',
                      github: 'https://github.com/daylerjeff199906',
                    ),
                    _staffProfile(
                      context,
                      role: texts.staff.developmentFrontend,
                      name: 'Danny Dávila Daza',
                      image: 'assets/staff/danny.jpeg',
                      github: 'https://github.com/Danny-da',
                    ),
                    _staffProfile(
                      context,
                      role: texts.staff.developmentFrontend,
                      name: 'Josue Franco Soria Ponce',
                      image: 'assets/staff/josue.png',
                      github: 'https://github.com/franquito3',
                    ),
                    _staffProfile(
                      context,
                      role: texts.staff.developmentBackend,
                      name: 'Piero Eleví Frías Mori',
                      image: 'assets/staff/piero.jpg',
                      github: 'https://github.com/PieroFrias',
                    ),
                    _staffProfile(
                      context,
                      role: texts.staff.developmentBackend,
                      name: 'Anthony Scott Ramirez Sias',
                      image: 'assets/staff/scott.png',
                      github: 'https://github.com/Scott-Ramirez',
                    ),
                      _staffProfile(
                      context,
                      role: texts.staff.graphicDesigner,
                      name: 'Jener Ronald Canayo Nashnate',
                      image: 'assets/staff/jener.webp',
                      github: 'https://www.behance.net/jhenerronald1',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('¿Salir de la app?'),
        content: Text('¿Estás seguro que quieres salir?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // No salir
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true), // Confirmar salida
            child: Text('Sí'),
          ),
        ],
      ),
    );
    return shouldPop ?? false;
  }

  Text _titleSection(BuildContext context, String title) {
    return Text(title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.primary));
  }

  Padding _subtitleSection(BuildContext context, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.secondary,
          )),
    );
  }

  Text _reviewerTitle(BuildContext context, String title) {
    return Text(title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onTertiaryContainer,
        ));
  }

  Widget _text(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Material _staffProfile(
    BuildContext context, {
    required String role,
    required String name,
    String? image,
    required String github,
  }) {
    final Uri url = Uri.parse(github);
    return Material(
     child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Padding(
      padding: PaddingConfig.onlyBottom,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: image != null ? Image.asset(image).image : null,
        child: image == null ? const Icon(Icons.person, size: 64.0) : null,
      ),
    ),
    _reviewerTitle(context, role),
    Text(
      name,
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.w400),
    ),
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: PaddingConfig.symetrictHorizontal,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.black),
        ),
      ),
      onPressed: () async {
        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ⬇️ Icono según el dominio
          Image.asset(_iconForUrl(url), width: 24),
          const SizedBox(width: 8),
          Text(
            texts.staff.briefcase,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  ],
)

    );
  }
}
