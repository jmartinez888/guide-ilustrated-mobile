import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/data/repositories_implementation/auth_iiap/auth_iiap_repository_impl.dart';
import 'package:species/src/presentation/router/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthIiapRepositoryImpl();
    return Column(
      children: [
        AppBar(
          title: const Text('Perfil'),
          actions: [
            IconButton(
              tooltip: 'Cerrar sesión',
              onPressed: () {
                authRepository.signOut();
                context.goNamed(Routes.species);
              },
              icon: const Icon(Icons.logout_rounded),
            ),
            const SizedBox(width: 8.0),
          ],
        ),
      ],
    );
  }
}
