import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:species/src/presentation/global/icons/custom_icons.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
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
        // {
        //   'label': 'Bardcoding',
        //   'icon_selected': Icons.code_rounded,
        // },
      ],
    },
    // {
    //   'title': 'Mapas',
    //   'content': [
    //     {
    //       'label': 'Visor',
    //       'icon_selected': Icons.location_on_rounded,
    //       'icon_unselected': Icons.location_on_outlined,
    //     },
    //     {
    //       'label': 'Mapas',
    //       'icon_selected': Icons.map_rounded,
    //       'icon_unselected': Icons.map_outlined,
    //     },
    //   ],
    // },
    // {
    //   'title': 'Más Información',
    //   'content': [
    //     {
    //       'label': 'Datos Biológicos',
    //       'icon_selected': Icons.dataset_rounded,
    //       'icon_unselected': Icons.dataset_outlined,
    //     },
    //     {
    //       'label': 'Recursos Científicos',
    //       'icon_selected': Icons.science_rounded,
    //       'icon_unselected': Icons.science_outlined,
    //     },
    //     {
    //       'label': 'Especialistas',
    //       'icon_selected': Icons.biotech_rounded,
    //       'icon_unselected': Icons.biotech_outlined,
    //     },
    //     {
    //       'label': '¿Cómo depositar?',
    //       'icon_selected': Icons.question_mark_rounded,
    //     },
    //   ],
    // },
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
  int selectedIndex = 0;

  void _goBranch({
    required int index,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required BuildContext context,
  }) {
    setState(() {
      selectedIndex = index;
    });
    switch (selectedIndex) {
      case 0:
        context.goNamed(
          Routes.profile,
        );
        break;
      case 1:
        context.goNamed(
          Routes.species,
        );
        break;
      case 2:
        context.goNamed(
          Routes.indigenousCommunity,
        );
        break;
      case 3:
        context.goNamed(
          Routes.staff,
        );
        break;
      case 4:
        context.goNamed(
          Routes.about,
        );
        break;
    }
    scaffoldKey.currentState?.openEndDrawer();
  }

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
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: NavigationDrawer(
        // selectedIndex: navigationShell.currentIndex,
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => _goBranch(
          index: index,
          scaffoldKey: scaffoldKey,
          context: context,
        ),
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
