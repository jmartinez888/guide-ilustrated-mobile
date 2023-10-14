import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:species/src/presentation/global/icons/custom_icons.dart';

class MainPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainPage({
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
          'label': 'Comunidad Indígena',
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

  void _goBranch(int index, GlobalKey<ScaffoldState> scaffoldKey) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
    scaffoldKey.currentState?.openEndDrawer();
  }

  List<Widget> _buildNavigationDrawerItems(
    BuildContext context
  ) {
    List<Widget> items = [];

    for (var section in _pageData) {
      final textTheme = Theme.of(context).textTheme;
      final colorScheme = Theme.of(context).colorScheme;
      items.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(section['title'], style: textTheme.titleMedium?.copyWith(
          color: colorScheme.primary,
        ),),
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
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: NavigationDrawer(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => _goBranch(index, scaffoldKey),
        children: _buildNavigationDrawerItems(context),
      ),
      appBar: AppBar(
        title: const Text('Este es un AppBar'),
      ),
      body: navigationShell,
    );
  }
}
