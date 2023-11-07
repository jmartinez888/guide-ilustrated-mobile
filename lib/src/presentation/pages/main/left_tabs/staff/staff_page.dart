import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:species/src/presentation/global/functions/build_multi_grids.dart';

class StaffPage extends StatelessWidget {
  const StaffPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverAppBar(title: Text('Equipo de trabajo'), pinned: true),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _titleSection(context, 'EQUIPO DE COORDINACIÓN'),
        )),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _subtitleSection(context, 'COORDINACIÓN EDITORIAL'),
              _text('Manuel Martín Brañas\nJuan José Bellido Collahuacho'),
            ],
          ),
        )),
        SliverToBoxAdapter(
          child: _subtitleSection(context, 'COMITÉ REVISOR'),
        ),
        SliverToBoxAdapter(
          child: MasonryGridView(
            padding: const EdgeInsets.all(16.0),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: buildMultiGrids(width)),
            children: [
              SizedBox(
                  child: Column(
                children: [
                  _reviewerTitle(context, 'Revisión de textos:'),
                  _text(
                      'Manuel Martín Brañas, IIAP\nJuan José Bellido Collahuacho, IIAP'),
                  _reviewerTitle(context, 'Revisión anfibios y reptiles:'),
                  _text('Giussepe Gagliardi Urrutia, IIAP'),
                ],
              )),
              SizedBox(
                  child: Column(
                children: [
                  _reviewerTitle(context, 'Revisión aves:'),
                  _text('José Álvarez Alonso, MINAM\nJuan Díaz Alván, UCP'),
                  _reviewerTitle(context, 'Revisión peces:'),
                  _text(
                      'Carmen Rosa García Dávila, IIAP\nKevin Morgan Ruíz Tafur, IIAP'),
                ],
              )),
              SizedBox(
                child: Column(children: [
                  _reviewerTitle(context, 'Revisión insectos:'),
                  _text(
                      'Joel Bardales Vásquez, IIAP\nWalter Leonardo Vásquez Mora, UNAP'),
                  _reviewerTitle(context, 'Revisión palmeras:'),
                  _text('Kember Mejía Carhuanca, IIAP'),
                ]),
              ),
              SizedBox(
                child: Column(children: [
                  _reviewerTitle(context, 'Revisión plantas:'),
                  _text(
                      'Nállarett Dávila Cardozo, IIAP\nRicardo Zárate Gómez, IIAP\nElsa Renjifo Salgado, IIAP'),
                  _reviewerTitle(context, 'Revisión mamíferos:'),
                  _text('Pedro Pérez Peña, IIAP'),
                ]),
              ),
              SizedBox(
                child: Column(children: [
                  _reviewerTitle(context, 'Elaboración de mapas:'),
                  _text('Juan José Palacios Vega y Lizardo Fachín Malaverri.'),
                ]),
              ),
              SizedBox(
                child: Column(children: [
                  _reviewerTitle(context, 'Ilustraciones:'),
                  _text(
                      'Jaime Choclote Martínez; Nicolás Farroñay Kanaffo y Javier Vela.'),
                ]),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _titleSection(context, 'EQUIPO DE DESARROLLO'),
        )),
        SliverToBoxAdapter(
          child: MasonryGridView(
            padding: const EdgeInsets.all(16.0),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: buildMultiGrids(width)),
            children: [
              _staffProfile(
                context,
                role: 'Líder técnico',
                name: 'Jhon Charlie Martinez Carranza',
                image: 'assets/staff/jhon.jpg',
                github: 'https://github.com/jmartinez888',
              ),
              _staffProfile(
                context,
                role: 'Desarrollador móvil',
                name: 'Edson Isaias Sánchez Chota',
                image: 'assets/staff/edson.jpg',
                github: 'https://github.com/edisaiassan',
              ),
              _staffProfile(context,
                  role: 'Desarrollador móvil',
                  name: 'Jorge Antonio Del Aguila Malafaya',
                  image: 'assets/staff/antonio.jpg',
                  github: 'https://github.com/JorgeAntonio'),
              _staffProfile(
                context,
                role: 'Desarrollador web',
                name: 'Santos Panaifo José Jefferson',
                image: 'assets/staff/santos.png',
                github: 'https://github.com/daylerjeff199906',
              ),
              _staffProfile(
                context,
                role: 'Desarrollador web',
                name: 'Danny Dávila Daza',
                image: 'assets/staff/danny.jpeg',
                github: 'https://github.com/Danny-da',
              ),
              _staffProfile(
                context,
                role: 'Desarrollador web',
                name: 'Josue Franco Soria Ponce',
                image: 'assets/staff/josue.png',
                github: 'https://github.com/franquito3',
              ),
              _staffProfile(
                context,
                role: 'Desarrollador backend',
                name: 'Frías Mori Piero Eleví',
                image: 'assets/staff/piero.png',
                github: 'https://github.com/PieroFrias',
              ),
              _staffProfile(
                context,
                role: 'Desarrollador backend',
                name: 'Anthony Scott Ramirez Sias',
                image: 'assets/staff/scott.png',
                github: 'https://github.com/Scott-Ramirez',
              ),
            ],
          ),
        )
      ],
    );
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
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: image != null ? Image.asset(image).image : null,
              child:
                  image == null ? const Icon(Icons.person, size: 64.0) : null,
            ),
          ),
          _reviewerTitle(context, role),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Colors.black),
              ),
            ),
            onPressed: () => Share.share(github),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icons/github.png', width: 24),
                const SizedBox(width: 8),
                const Text('Portafolio',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
