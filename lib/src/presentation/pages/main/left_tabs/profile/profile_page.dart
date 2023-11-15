import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/data/repositories_implementation/auth_iiap/auth_iiap_repository_impl.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/components/profile_body.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/components/profile_header.dart';
import 'package:species/src/presentation/router/routes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final authRepository = AuthIiapRepositoryImpl();

    return Column(
      children: [
        AppBar(
          title: const Text('Mi perfil'),
          actions: [
            IconButton(
              tooltip: 'Cerrar sesión',
              onPressed: () async {
                await authRepository.signOut();
                if (mounted) {
                  context.goNamed(Routes.species);
                }
              },
              icon: const Icon(Icons.logout_rounded),
            ),
            const SizedBox(width: 8.0),
          ],
        ),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              ProfileHeader(),
              SizedBox(height: 16.0),
              ProfileBody(),
            ],
          ),
        ),
      ],
    );
  }
}
