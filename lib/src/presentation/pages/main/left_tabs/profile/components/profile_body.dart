import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:species/src/data/repositories_implementation/auth_iiap/auth_iiap_repository_impl.dart';
import 'package:species/src/presentation/global/colors.dart';
import 'package:species/src/presentation/router/routes.dart';

List<Map<String, dynamic>> items = [
  {
    'icon': Icons.favorite,
    'title': 'Mis favoritos',
    'route': Routes.specieFavorites,
  },
  {
    'icon': Icons.password_outlined,
    'title': 'Cambiar contraseña',
    'route': Routes.forgotPassword,
  },
  {
    'icon': Icons.person_add,
    'title': 'Compartir',
    'onTap': () {
      Share.share(
          'Descarga la app de IIAP Guía Ilustrada de Flora y Fauna y conoce más sobre las especies de la Amazonía Peruana: https://play.google.com/store/apps/details?id=com.iiap.guiailustrada');
    },
  },
  {
    'icon': Icons.work_outlined,
    'title': 'Acerca de la app',
    'route': Routes.about,
  },
  {
    'icon': Icons.info_outline,
    'title': 'Acerca del Equipo IIAP',
    'route': Routes.staff,
  },
];

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
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

    return FutureBuilder<Map<String, dynamic>>(
      future: getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: const Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final userData = snapshot.data;
          final userId = userData?['id'] ?? '';

          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Column(
                  children: items.map((item) {
                    return ListTile(
                      onTap: item['onTap'] ??
                          () => context.pushNamed(item['route']),
                      leading: Icon(
                        item['icon'],
                        color: CustomColors.secondary,
                      ),
                      title: Text(item['title']),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    );
                  }).toList(),
                ),
                _deleteAccount(context, userId),
                _logout(context, userId),
              ],
            ),
          );
        } else {
          return const Text('Usuario no encontrado');
        }
      },
    );
  }

  ListTile _logout(BuildContext context, userId) {
    final authRepository = AuthIiapRepositoryImpl();
    return ListTile(
      onTap: () async {
        await authRepository.signOut();
        if (mounted) {
          context.goNamed(Routes.species);
        }
      },
      leading: const Icon(Icons.logout_outlined, color: CustomColors.secondary),
      title: const Text('Cerrar sesión'),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }

  ListTile _deleteAccount(BuildContext context, userId) {
    return ListTile(
      onTap: () => context
          .pushNamed(Routes.deleteAccount, pathParameters: {'userId': userId}),
      leading: const Icon(Icons.delete_forever_outlined,
          color: CustomColors.secondary),
      title: const Text('Eliminar cuenta'),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }
}
