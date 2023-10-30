import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class StaffPage extends StatelessWidget {
  const StaffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text('Equipo de desarrollo'),
        ),
        Expanded(
            child: GridView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 280,
            childAspectRatio: 3 / 5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            _staffProfile(
              name: 'Santos Panaifo José Jefferson',
              image: 'assets/staff/santos.png',
              github: 'https://github.com/daylerjeff199906',
            ),
            _staffProfile(
              name: 'Frías Mori Piero Eleví',
              image: 'assets/staff/santos.png',
              github: 'https://github.com/PieroFrias',
            ),
            _staffProfile(
              name: 'Edson Isaias Sánchez Chota',
              image: 'assets/staff/santos.png',
              github: 'https://github.com/edisaiassan',
            ),
            _staffProfile(
              name: 'Anthony Scott Ramirez Sias',
              image: 'assets/staff/scott.png',
              github: 'https://github.com/Scott-Ramirez',
            ),
            _staffProfile(
                name: 'Jorge Antonio Del Aguila Malafaya',
                image: 'assets/staff/santos.png',
                github: 'https://github.com/JorgeAntonio'),
          ],
        )),
      ],
    );
  }

  Material _staffProfile({
    required String name,
    required String image,
    required String github,
  }) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: Image.asset(image).image,
          ),
          Text(name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              )),
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
