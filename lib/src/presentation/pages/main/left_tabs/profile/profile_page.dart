import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/repositories/auth/auth_repository.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/components/profile_body.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/components/profile_header.dart';
import 'package:species/src/presentation/router/routes.dart';
import 'package:species/src/generated/translations.g.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthRepository get authRepository => context.read();
  SessionController get sessionController => context.read();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(texts.profile.title),
          actions: [
            IconButton(
              tooltip: texts.profile.logout,
              onPressed: () async {
                await authRepository.signOut();
                if (mounted) {
                  sessionController.signOut();
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
