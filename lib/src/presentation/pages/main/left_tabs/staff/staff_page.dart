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
        const SliverAppBar(title: Text('Staff'), pinned: true),
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList.list(
            children: [
              _text(
                  'COORDINACIÓN EDITORIAL\nManuel Martín Brañas\nJuan José Bellido Collahuacho'),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _text('COMITÉ REVISOR'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _text(
                    'Revisión de textos:\nManuel Martín Brañas, IIAP; Juan José Bellido Collahuacho, IIAP'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _text(
                    'Revisión anfibios y reptiles:\nGiussepe Gagliardi Urrutia, IIAP'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _text(
                    'Revisión aves:\nJosé Álvarez Alonso, MINAM; Juan Díaz Alván, UCP'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _text(
                    'Revisión peces:\nCarmen Rosa García Dávila, IIAP; Kevin Morgan Ruíz Tafur, IIAP'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _text(
                    'Revisión insectos:\nJoel Bardales Vásquez, IIAP; Walter Leonardo Vásquez Mora, UNAP'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child:
                    _text('Revisión palmeras:\nKember Mejía Carhuanca, IIAP'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _text(
                    'Revisión plantas:\nNállarett Dávila Cardozo, IIAP; Ricardo Zárate Gómez, IIAP; Elsa Renjifo Salgado, IIAP'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _text('Revisión mamíferos:\nPedro Pérez Peña, IIAP'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _text(
                    'ELABORACIÓN DE MAPAS\nJuan José Palacios Vega y Lizardo Fachín Malaverri'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: _text(
                    'ILUSTRACIONES\nJaime Choclote Martínez; Nicolás Farroñay Kanaffo y Javier Vela'),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Equipo de desarrollo',
              style: TextStyle(
                  fontSize: 26.0,
                  color: Theme.of(context).colorScheme.primary)),
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
                name: 'Edson Isaias Sánchez Chota',
                image: 'assets/staff/edson.jpg',
                github: 'https://github.com/edisaiassan',
              ),
              _staffProfile(
                  name: 'Jorge Antonio Del Aguila Malafaya',
                  image: 'assets/staff/antonio.jpg',
                  github: 'https://github.com/JorgeAntonio'),
              _staffProfile(
                name: 'Jhon Charlie Martinez Carranza',
                image: 'assets/staff/jhon.jpg',
                github: 'https://github.com/jmartinez888',
              ),
              _staffProfile(
                name: 'Santos Panaifo José Jefferson',
                image: 'assets/staff/santos.png',
                github: 'https://github.com/daylerjeff199906',
              ),
              _staffProfile(
                name: 'Frías Mori Piero Eleví',
                github: 'https://github.com/PieroFrias',
              ),
              _staffProfile(
                name: 'Anthony Scott Ramirez Sias',
                image: 'assets/staff/scott.png',
                github: 'https://github.com/Scott-Ramirez',
              ),
            ],
          ),
        )
      ],
    );
    /*  return Column(
      children: [
        AppBar(title: const Text('Equipo de desarrollo')),
        Expanded(
          child: ListView(
            
            
              
            ],
          ),
        ),
      ],
    );
   */
  }

  Widget _text(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24.0,
      ),
    );
  }

  Material _staffProfile({
    required String name,
    String? image,
    required String github,
  }) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CircleAvatar(
              radius: 100,
              backgroundImage: image != null ? Image.asset(image).image : null,
              child:
                  image == null ? const Icon(Icons.person, size: 64.0) : null,
            ),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.black)),
            ),
            onPressed: () => Share.share(github),
            icon: Image.asset('assets/icons/github.png', width: 24),
            label: const Text('Portafolio',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 12)),
          )
        ],
      ),
    );
  }
}
