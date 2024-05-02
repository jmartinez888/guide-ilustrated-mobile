import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/icons/custom_icons.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/pages/main/main_left_nav/controller/main_left_nav_controller.dart';
import 'package:species/src/presentation/router/routes.dart';

class MainLeftNav extends StatefulWidget {
  final Widget child;

  const MainLeftNav({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<MainLeftNav> createState() => _MainLeftNavState();
}

class _MainLeftNavState extends State<MainLeftNav> {
  SessionController get sessionController => context.read();
  LeftTabController get leftTabController => context.read();

  @override
  void initState() {
    leftTabController.changeTab(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final LeftTabController controller = context.watch();
    final position = controller.state.position;

    return Scaffold(
      key: scaffoldKey,
      drawer: NavigationDrawer(
        selectedIndex: position,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              if (sessionController.state != null) {
                context.goNamed(
                  Routes.profile,
                );
                leftTabController.changeTab(index);
              }
              break;
            case 1:
              context.goNamed(
                Routes.species,
              );
              leftTabController.changeTab(index);

              break;
            case 2:
              context.goNamed(
                Routes.communities,
              );
              leftTabController.changeTab(index);

              break;
            case 3:
              context.goNamed(
                Routes.authors,
              );
              leftTabController.changeTab(index);

              break;
            case 4:
              context.goNamed(
                Routes.staff,
              );
              leftTabController.changeTab(index);

              break;
            case 5:
              context.goNamed(
                Routes.about,
              );
              leftTabController.changeTab(index);

              break;
          }
          scaffoldKey.currentState?.openEndDrawer();
        },
        children: [
          _title('Cuenta'),
          const NavigationDrawerDestination(
            selectedIcon: Icon(Icons.account_circle_rounded),
            label: Text('Perfil'),
            icon: Icon(Icons.account_circle_outlined),
          ),
          _title('Contenido'),
          const NavigationDrawerDestination(
            label: Text('Especies'),
            icon: Icon(CustomIcons.mono),
          ),
          const NavigationDrawerDestination(
            label: Text('Comunidades Indígenas'),
            icon: Icon(CustomIcons.choza),
          ),
          const NavigationDrawerDestination(
            label: Text('Autores'),
            icon: Icon(Icons.group_rounded),
          ),
          _title('Acerca de'),
          const NavigationDrawerDestination(
            selectedIcon: Icon(Icons.groups_rounded),
            label: Text('Staff'),
            icon: Icon(Icons.groups_outlined),
          ),
          const NavigationDrawerDestination(
            selectedIcon: Icon(Icons.info_rounded),
            label: Text('Sobre la guía'),
            icon: Icon(Icons.info_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            widget.child,
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: CustomIconButton(
                tooltip: 'Menú',
                icon: Icons.menu_rounded,
                onPressed: () => scaffoldKey.currentState?.openDrawer(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: PaddingConfig.asymetrict,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
