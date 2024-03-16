import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/global/widgets/navigations/custom_bottom_nav_bar.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/main_species/controller/bottom_tab_position_controller.dart';
import 'package:species/src/presentation/router/routes.dart';

class MainSpecies extends StatefulWidget {
  final Widget child;

  const MainSpecies({
    super.key,
    required this.child,
  });

  
  

  @override
  State<MainSpecies> createState() => _MainSpeciesState();
}

class _MainSpeciesState extends State<MainSpecies> {
  SessionController get sessionController => context.read();
  BottomTabPositionController get bottomTabPositionController => context.read();
  late List<NavigationDestination> _navigationDestinations;

  final List<Map<String, dynamic>> _pageData = [
      {
        'label': texts.bottomBar.home,
        'icon_selected': Icons.home_rounded,
        'icon_unselected': Icons.home_outlined,
      },
      {
        'label': texts.bottomBar.search,
        'icon_selected': Icons.search_rounded,
      },
      {
        'label': texts.bottomBar.favorites,
        'icon_selected': Icons.favorite_rounded,
        'icon_unselected': Icons.favorite_outline,
      },
    ];
  

  @override
  void initState() {
    bottomTabPositionController.changeTab(0);
    _navigationDestinations = _pageData
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final BottomTabPositionController controller = context.watch();
    final position = controller.state.position;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          child: widget.child,
        ),
        Positioned(
          bottom: 16.0,
          right: size.height > size.width + 32.0 ? null : 16.0,
          child: CustomBottomNavBar(
            selectedIndex: position,
            onDestinationSelected: (index) => onDestinationSelected(index),
            destinations: _navigationDestinations,
          ),
        ),
      ],
    );
  }

  void onDestinationSelected(int index) {
    switch (index) {
      case 0:
        context.goNamed(
          Routes.species,
        );

        bottomTabPositionController.changeTab(index);
        break;
      case 1:
        context.goNamed(
          Routes.specieSearch,
        );
        bottomTabPositionController.changeTab(index);

        break;
      case 2:
        if (sessionController.state != null) {
          context.goNamed(
            Routes.specieFavorites,
          );
          bottomTabPositionController.changeTab(index);
        } else {
          context.goNamed(
            Routes.signIn,
          );
        }
        break;
    }
  }
}
