import 'package:flutter/material.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/components/profile_body.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/components/profile_header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(title: const Text('Mi perfil')),
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
