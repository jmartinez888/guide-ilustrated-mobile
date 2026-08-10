import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:species/src/generated/translations.g.dart';
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

    // Obtener la ubicación actual
    final currentLocation = GoRouter.of(context).location;

    // Actualizar la pestaña seleccionada en función de la ruta
    if (currentLocation.startsWith('/profile')) {
      controller.changeTab(0);
    } else if (currentLocation.startsWith('/species')) {
      controller.changeTab(1);
    } else if (currentLocation.startsWith('/communities')) {
      controller.changeTab(2);
    } else if (currentLocation.startsWith('/authors')) {
      controller.changeTab(3);
    } else if (currentLocation.startsWith('/staff')) {
      controller.changeTab(4);
    } else if (currentLocation.startsWith('/about')) {
      controller.changeTab(5);
    } else if (currentLocation.startsWith('/game')) {
      controller.changeTab(6); // Nueva pestaña para el juego de trivia
    } else if (currentLocation.startsWith('/puzzle')) {
      controller.changeTab(7); // Nueva pestaña para el juego de rompecabezas
    } /*else if (currentLocation.startsWith('/wordsearch')) {
      controller.changeTab(8); // Nueva pestaña para el juego de sopa de letras
    }*/ else if (currentLocation.startsWith('/memory')) { 
      controller.changeTab(8); // Nueva ruta para el juego de memoria
    } else if (currentLocation.startsWith('/relationship')) { 
      controller.changeTab(9); // Nueva ruta para el juego de relación de palabras
    }

    final position = controller.state.position;

    return Scaffold(
      key: scaffoldKey,
      drawer: NavigationDrawer(
        selectedIndex: position,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.goNamed(Routes.profile);
              leftTabController.changeTab(index);
              break;
            case 1:
              context.goNamed(Routes.species);
              leftTabController.changeTab(index);
              break;
            case 2:
              context.goNamed(Routes.communities);
              leftTabController.changeTab(index);
              break;
            case 3:
              context.goNamed(Routes.authors);
              leftTabController.changeTab(index);
              break;
            case 4:
              context.goNamed(Routes.staff);
              leftTabController.changeTab(index);
              break;
            case 5:
              context.goNamed(Routes.about);
              leftTabController.changeTab(index);
              break;
            case 6:
              context.goNamed(Routes.game); // Redirigir a la página del juego de trivia
              leftTabController.changeTab(index);
              break;
            case 7:
              context.goNamed(Routes.puzzle); // Redirigir a la página del juego de rompecabezas
              leftTabController.changeTab(index);
              break;
            /*case 8:
              context.goNamed(Routes.wordSearch); // Nueva ruta para el juego de sopa de letras
              leftTabController.changeTab(index);
              break;*/
            case 8:
              context.goNamed(Routes.memory); // Nueva ruta para el juego de memoria
              leftTabController.changeTab(index);
              break;
            case 9:
              context.goNamed(Routes.relationship); // Nueva ruta para el juego de relación de palabras
              leftTabController.changeTab(index);
              break;
          }
          scaffoldKey.currentState?.openEndDrawer();
        },
        children: [
          _title(texts.drawer.account),
          NavigationDrawerDestination(
            selectedIcon: const Icon(Icons.account_circle_rounded),
            label: Text(texts.drawer.profile),
            icon: const Icon(Icons.account_circle_outlined),
          ),
          _title(texts.drawer.content),
          NavigationDrawerDestination(
            label: Text(texts.drawer.species),
            icon: const Icon(CustomIcons.mono),
          ),
          NavigationDrawerDestination(
            label: Text(texts.drawer.communities),
            icon: const Icon(CustomIcons.choza),
          ),
          NavigationDrawerDestination(
            label: Text(texts.drawer.authors),
            icon: const Icon(Icons.group_rounded),
          ),
          _title(texts.drawer.about),
          NavigationDrawerDestination(
            selectedIcon: const Icon(Icons.groups_rounded),
            label: Text(texts.drawer.staff),
            icon: const Icon(Icons.groups_outlined),
          ),
          NavigationDrawerDestination(
            selectedIcon: const Icon(Icons.info_rounded),
            label: Text(texts.drawer.aboutGuide),
            icon: const Icon(Icons.info_outlined),
          ),
          _title('Juegos Interactivos'), // Sección para los juegos
          const NavigationDrawerDestination(
            selectedIcon: Icon(Icons.videogame_asset_rounded),
            label: Text('Trivia de Especies'),
            icon: Icon(Icons.videogame_asset_outlined),
          ),
          const NavigationDrawerDestination(
            selectedIcon: Icon(Icons.extension_rounded),
            label: Text('Juego de Rompecabezas'), // Nueva opción para el juego de rompecabezas
            icon: Icon(Icons.extension_outlined),
          ),
          /*const NavigationDrawerDestination(
            selectedIcon: Icon(Icons.grid_on_rounded), // Icono para la sopa de letras
            label: Text('Sopa de Letras'), // Nueva opción para la sopa de letras
            icon: Icon(Icons.grid_on_outlined),
          ),*/
          const NavigationDrawerDestination(
            selectedIcon: Icon(Icons.memory_rounded), // Icono para el juego de memoria
            label: Text('Juego de Memoria'), // Nueva opción para el juego de memoria
            icon: Icon(Icons.memory_outlined),
          ),
          const NavigationDrawerDestination(
            selectedIcon: Icon(Icons.link), // Icono para el juego de relación de palabras
            label: Text('Relaciona las Especies'), // Nueva opción para el juego de relación de palabras
            icon: Icon(Icons.link_outlined),
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
                tooltip: texts.drawer.menu,
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
