import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:species/src/data/repositories_implementation/auth_iiap/auth_iiap_repository_impl.dart';
import 'package:species/src/presentation/global/widgets/card/custom_list_tile.dart';
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
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
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
          return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.6,
              child: const Center(child: CircularProgressIndicator()));
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

          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: Center(
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
                        const SizedBox(height: 15.0),
                        Text(email,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Completa tu perfil para poder acceder a todas las funcionalidades de la aplicación.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16.0),
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
                        profilePicture == ''
                            ? const Icon(
                                Icons.account_circle_rounded,
                                color: Colors.grey,
                                size: 200,
                              )
                            : CircleAvatar(
                                radius: 100,
                                backgroundImage: CachedNetworkImageProvider(
                                  profilePicture,
                                ),
                              ),
                        const SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            name + ' ' + lastName,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.phone_iphone),
                            const SizedBox(width: 8.0),
                            Text(
                              phone,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.email),
                            const SizedBox(width: 8.0),
                            Text(
                              email,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                          ),
                          onPressed: () {
                            context.pushNamed(Routes.editProfile,
                                pathParameters: {'userId': userId.toString()});
                          },
                          child: const Text('Editar perfil'),
                        )
                      ],
                    ),
                ],
              ),
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
            onTap: () => context.pushNamed(
              Routes.specieFavorites,
            ),
            leading: const Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
            title: 'Mis favoritos',
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
          CustomListTile(
            onTap: () => context.pushNamed(
              Routes.forgotPassword,
            ),
            leading: const Icon(
              Icons.password_outlined,
              color: Colors.grey,
            ),
            title: 'Cambiar contraseña',
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
          CustomListTile(
            onTap: () {
              Share.share(
                  'Descarga la app de IIAP Guía Ilustrada de Flora y Fauna y conoce más sobre las especies de la Amazonía Peruana: https://play.google.com/store/apps/details?id=com.iiap.guiailustrada');
            },
            leading: const Icon(
              Icons.person_add,
              color: Colors.grey,
            ),
            title: 'Invitar amigos',
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
          CustomListTile(
            onTap: () => context.pushNamed(
              Routes.about,
            ),
            leading: const Icon(
              Icons.work_outlined,
              color: Colors.grey,
            ),
            title: 'Sobre el proyecto',
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
          CustomListTile(
            onTap: () => context.pushNamed(
              Routes.staff,
            ),
            leading: const Icon(
              Icons.info_outline,
              color: Colors.grey,
            ),
            title: 'Sobre nosotros',
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
          const CustomListTile(
            leading: Icon(
              Icons.delete_forever_outlined,
              color: Colors.grey,
            ),
            title: 'Eliminar cuenta',
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
