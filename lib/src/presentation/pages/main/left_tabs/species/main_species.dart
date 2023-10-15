import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/global/widgets/navigations/custom_bottom_nav_bar.dart';

class MainSpecies extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainSpecies({
    super.key,
    required this.navigationShell,
  });

  static const List<Map<String, dynamic>> _pageData = [
    {
      'label': 'Inicio',
      'icon_selected': Icons.home_rounded,
      'icon_unselected': Icons.home_outlined,
    },
    {
      'label': 'Buscar',
      'icon_selected': Icons.search_rounded,
    },
    {
      'label': 'Favoritos',
      'icon_selected': Icons.favorite_rounded,
      'icon_unselected': Icons.favorite_outline,
    },
    {
      'label': 'Listas',
      'icon_selected': Icons.list_rounded,
    },
  ];

  static final List<NavigationDestination> _navigationDestinations = _pageData
      .map(
        (navigationDestionation) => NavigationDestination(
          tooltip: navigationDestionation['label'],
          selectedIcon: Icon(navigationDestionation['icon_selected']),
          icon: Icon(navigationDestionation['icon_unselected'] ??
              navigationDestionation['icon_selected']),
          label: navigationDestionation['label'],
        ),
      )
      .toList();

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          child: navigationShell,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomBottomNavBar(
            onDestinationSelected: _goBranch,
            selectedIndex: navigationShell.currentIndex,
            destinations: _navigationDestinations,
          ),
        ),
      ],
    );
  }
}
