import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:species/src/presentation/global/widgets/card/custom_list_tile.dart';
import 'package:species/src/presentation/router/routes.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

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
