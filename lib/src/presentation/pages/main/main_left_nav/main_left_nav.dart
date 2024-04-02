import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';

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

  static const List<Map<String, dynamic>> _pageData = [
    {
      'title': 'Cuenta',
      'content': [
        {
          'label': 'Perfil',
          'icon_selected': Icons.account_circle_rounded,
          'icon_unselected': Icons.account_circle_outlined,
        },
      ],
    },
    {
      'title': 'Contenido',
      'content': [
        {
          'label': 'Especies',
          'icon_selected': CustomIcons.mono,
        },
        {
          'label': 'Comunidades Indígenas',
          'icon_selected': CustomIcons.choza,
        },
      ],
    },
    {
      'title': 'Acerca de',
      'content': [
        {
          'label': 'Staff',
          'icon_selected': Icons.groups_rounded,
          'icon_unselected': Icons.groups_outlined,
        },
        {
          'label': 'Sobre la guía',
          'icon_selected': Icons.info_rounded,
          'icon_unselected': Icons.info_outlined,
        },
      ],
    },
  ];

  @override
  State<MainLeftNav> createState() => _MainLeftNavState();
}

class _MainLeftNavState extends State<MainLeftNav> {
  SessionController get sessionController => context.read();
  LeftTabController get leftTabController => context.read();

  List<Widget> _buildNavigationDrawerItems(BuildContext context) {
    List<Widget> items = [];

    for (var section in MainLeftNav._pageData) {
      final textTheme = Theme.of(context).textTheme;
      final colorScheme = Theme.of(context).colorScheme;
      items.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          section['title'],
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.primary,
          ),
        ),
      ));

      for (var content in section['content']) {
        items.add(NavigationDrawerDestination(
          selectedIcon: Icon(content['icon_selected']),
          label: Text(content['label']),
          icon: Icon(content['icon_unselected'] ?? content['icon_selected']),
        ));
      }
    }

    return items;
  }

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
        // selectedIndex: navigationShell.currentIndex,
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
                Routes.indigenousCommunity,
              );
              leftTabController.changeTab(index);

              break;
            case 3:
              context.goNamed(
                Routes.staff,
              );
              leftTabController.changeTab(index);

              break;
            case 4:
              context.goNamed(
                Routes.about,
              );
              leftTabController.changeTab(index);

              break;
          }
          scaffoldKey.currentState?.openEndDrawer();
        },
        children: _buildNavigationDrawerItems(context),
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
}
