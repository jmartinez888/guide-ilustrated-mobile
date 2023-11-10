import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/global/widgets/navigations/custom_bottom_nav_bar.dart';

class MainSpecies extends ConsumerWidget {
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

  void _goBranch(
      int index, BuildContext context, FirebaseAuth firebaseAuthInstance) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuthInstance = FirebaseAuth.instance;
    final Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          child: navigationShell,
        ),
        Positioned(
          bottom: 16.0,
          right: size.height > size.width + 32.0 ? null : 16.0,
          child: CustomBottomNavBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: (index) => _goBranch(
              index,
              context,
              firebaseAuthInstance,
            ),
            destinations: _navigationDestinations,
          ),
        ),
      ],
    );
  }
}
