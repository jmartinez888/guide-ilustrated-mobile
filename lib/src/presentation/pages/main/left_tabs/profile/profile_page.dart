import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:species/src/data/repositories_implementation/auth_iiap/auth_iiap_repository_impl.dart';
import 'package:species/src/presentation/global/widgets/alerts/custom_bottom_sheet.dart';
import 'package:species/src/presentation/global/widgets/card/custom_list_tile.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/edit_profile_page.dart';
import 'package:species/src/presentation/router/routes.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
              onPressed: () {
                authRepository.signOut();
                context.goNamed(Routes.species);
              },
              icon: const Icon(Icons.logout_rounded),
            ),
            const SizedBox(width: 8.0),
          ],
        ),
        const Expanded(
          child: Column(
            children: [
              _HeaderProfile(),
              _ContentProfile(),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeaderProfile extends StatefulWidget {
  const _HeaderProfile();

  @override
  State<_HeaderProfile> createState() => __HeaderProfileState();
}

class __HeaderProfileState extends State<_HeaderProfile> {
  Future<Map<String, dynamic>> getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      }
    }
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final userData = snapshot.data;
          final profilePicture = userData!['profilePicture'] ?? '';
          final name = userData['name'] ?? '';
          final lastName = userData['lastName'] ?? '';
          final email = userData['email'] ?? '';
          final phone = userData['phone'] ?? '';
          final profileIncomplete = name.isEmpty || lastName.isEmpty;

          final userId = userData['id'] ?? '';

          return Container(
            height: MediaQuery.sizeOf(context).height * 0.4,
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                if (profileIncomplete)
                  Column(
                    children: [
                      Icon(
                        Icons.account_circle_rounded,
                        color: Colors.grey[400],
                        size: 200,
                      ),
                      const SizedBox(height: 8.0),
                      headerText(
                        texto: email,
                        fontWeight: FontWeight.w600,
                      ),
                      FilledButton(
                        onPressed: () {
                          context.pushNamed(Routes.editProfile,
                              pathParameters: {'userId': userId.toString()});
                        },
                        child: const Text('Completar perfil'),
                      ),
                    ],
                  ),
                if (!profileIncomplete)
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(profilePicture),
                      ),
                      const SizedBox(height: 8.0),
                      headerText(
                        texto: name,
                        fontWeight: FontWeight.w600,
                      ),
                      headerText(
                        texto: lastName,
                        fontWeight: FontWeight.w600,
                      ),
                      headerText(
                        texto: phone,
                        fontWeight: FontWeight.w600,
                      ),
                      headerText(
                        texto: email,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 8.0),
                      FilledButton(
                        onPressed: () {
                          context.pushNamed(Routes.editProfile,
                              pathParameters: {'userId': userId.toString()});
                        },
                        child: const Text('Editar perfil'),
                      ),
                    ],
                  ),
              ],
            ),
          );
        } else {
          return const Text('Usuario no encontrado');
        }
      },
    );
  }
}

class _ContentProfile extends StatelessWidget {
  const _ContentProfile();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          CustomListTile(
            title: 'sasas',
            leading: Icon(Icons.add),
            trailing: Icon(Icons.add),
            onTap: () {},
          ),
          ListTile(
            onTap: () => context.pushNamed(
              Routes.forgotPassword,
            ),
            leading: const Icon(
              Icons.password_outlined,
              color: Colors.grey,
            ),
            title: headerText(
                texto: 'Cambiar contraseña', fontWeight: FontWeight.w400),
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
          ListTile(
            onTap: () {
              Share.share(
                  'Descarga la app de IIAP Guía Ilustrada de Flora y Fauna y conoce más sobre las especies de la Amazonía Peruana: https://play.google.com/store/apps/details?id=com.iiap.guiailustrada');
            },
            leading: const Icon(
              Icons.person_add,
              color: Colors.grey,
            ),
            title: headerText(
                texto: 'Invitar amigos', fontWeight: FontWeight.w400),
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.help_outline,
              color: Colors.grey,
            ),
            title: headerText(texto: 'FAQ', fontWeight: FontWeight.w400),
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
          ListTile(
            onTap: () => context.pushNamed(
              Routes.about,
            ),
            leading: const Icon(
              Icons.work_outlined,
              color: Colors.grey,
            ),
            title: headerText(
                texto: 'Sobre el proyecto', fontWeight: FontWeight.w400),
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
          ListTile(
            onTap: () => context.pushNamed(
              Routes.staff,
            ),
            leading: const Icon(
              Icons.info_outline,
              color: Colors.grey,
            ),
            title: headerText(
                texto: 'Sobre nosotros', fontWeight: FontWeight.w400),
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.delete_forever_outlined,
              color: Colors.grey,
            ),
            title: headerText(
                texto: 'Eliminar cuenta', fontWeight: FontWeight.w400),
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

Widget headerText({
  String texto = "",
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.bold,
  double? fontSize,
  TextAlign textAlign = TextAlign.justify,
}) {
  return Text(
    texto,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );
}
