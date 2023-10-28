import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:species/src/presentation/global/icons/custom_icons.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/router/routes.dart';

class MainLeftNav extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainLeftNav({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  static const List<Map<String, dynamic>> _pageData = [
    {
      'title': 'Perfil',
      'content': [
        {
          'label': 'Usuario',
          'icon_selected': Icons.account_circle_rounded,
          'icon_unselected': Icons.account_circle_outlined,
        },
      ],
    },
    {
      'title': 'Principal',
      'content': [
        {
          'label': 'Especies',
          'icon_selected': CustomIcons.bird,
        },
        {
          'label': 'Comunidades Indígenas',
          'icon_selected': CustomIcons.tree,
        },
        {
          'label': 'Bardcoding',
          'icon_selected': Icons.code_rounded,
        },
      ],
    },
    {
      'title': 'Mapas',
      'content': [
        {
          'label': 'Visor',
          'icon_selected': Icons.location_on_rounded,
          'icon_unselected': Icons.location_on_outlined,
        },
        {
          'label': 'Mapas',
          'icon_selected': Icons.map_rounded,
          'icon_unselected': Icons.map_outlined,
        },
      ],
    },
    {
      'title': 'Más Información',
      'content': [
        {
          'label': 'Datos Biológicos',
          'icon_selected': Icons.dataset_rounded,
          'icon_unselected': Icons.dataset_outlined,
        },
        {
          'label': 'Recursos Científicos',
          'icon_selected': Icons.science_rounded,
          'icon_unselected': Icons.science_outlined,
        },
        {
          'label': 'Especialistas',
          'icon_selected': Icons.biotech_rounded,
          'icon_unselected': Icons.biotech_outlined,
        },
        {
          'label': '¿Cómo depositar?',
          'icon_selected': Icons.question_mark_rounded,
        },
      ],
    },
    {
      'title': 'Desarrolladores',
      'content': [
        {
          'label': 'Staff',
          'icon_selected': Icons.groups_rounded,
          'icon_unselected': Icons.groups_outlined,
        },
      ],
    },
  ];

  void _goBranch({
    required int index,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required BuildContext context,
    required FirebaseAuth firebaseAuthInstance,
  }) {
    if ((index == 0) &&
        (firebaseAuthInstance.currentUser == null ||
            !firebaseAuthInstance.currentUser!.emailVerified)) {
      context.pushNamed(Routes.signIn);
    } else {
      navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );
    }
    scaffoldKey.currentState?.openEndDrawer();
  }

  List<Widget> _buildNavigationDrawerItems(BuildContext context) {
    List<Widget> items = [];

    for (var section in _pageData) {
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
  Widget build(BuildContext context) {
    final firebaseAuthInstance = FirebaseAuth.instance;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: NavigationDrawer(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => _goBranch(
          index: index,
          scaffoldKey: scaffoldKey,
          context: context,
          firebaseAuthInstance: firebaseAuthInstance,
        ),
        children: _buildNavigationDrawerItems(context),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            navigationShell,
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
