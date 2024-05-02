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

  @override
  void initState() {
    bottomTabPositionController.changeTab(0);
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
            destinations: [
              NavigationDestination(
                tooltip: texts.bottomBar.home,
                label: texts.bottomBar.home,
                selectedIcon: const Icon(Icons.home_rounded),
                icon: const Icon(Icons.home_outlined),
              ),
              NavigationDestination(
                tooltip: texts.bottomBar.search,
                label: texts.bottomBar.search,
                icon: const Icon(Icons.search_rounded),
              ),
              NavigationDestination(
                tooltip: texts.bottomBar.favorites,
                label: texts.bottomBar.favorites,
                selectedIcon: const Icon(Icons.favorite_rounded),
                icon: const Icon(Icons.favorite_outline),
              ),
            ],
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
