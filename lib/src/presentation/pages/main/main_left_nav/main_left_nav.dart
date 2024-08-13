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
import 'package:species/src/presentation/global/colors.dart';
import 'package:species/src/presentation/global/widgets/buttons/button_dark_mode.dart'; // Importar el nuevo botón
import 'package:species/src/presentation/global/widgets/buttons/ThemeNotifier.dart';// Importar ThemeNotifier

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
    super.initState();
    // Mover cualquier lógica que dependa del contexto a didChangeDependencies
    leftTabController.changeTab(1);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Acceso a ThemeNotifier aquí es seguro
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final LeftTabController controller = context.watch();
    final position = controller.state.position;
    final theme = Theme.of(context);

    // Configuración de colores según el tema actual
    final Color iconColor = theme.brightness == Brightness.dark 
        ? CustomColors.white 
        : CustomColors.black;
    final Color backgroundColor = theme.brightness == Brightness.dark 
        ? CustomColors.darkSurface 
        : CustomColors.white;

    return Scaffold(
      key: scaffoldKey,
      drawer: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, _) {
          return NavigationDrawer(
            selectedIndex: position,
            onDestinationSelected: (index) {
              switch (index) {
                case 0:
                  context.goNamed(
                    Routes.profile,
                  );
                  leftTabController.changeTab(index);
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
              _title(texts.drawer.account),
              NavigationDrawerDestination(
                selectedIcon: const Icon(Icons.account_circle_rounded),
                label: Text(texts.drawer.profile),
                icon: const Icon(Icons.account_circle_outlined), 
              ),
               const Padding(
                padding: EdgeInsets.symmetric(horizontal: 11.0),
                child: ButtonDarkMode(), //  Usar el nuevo botón 
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
             // _title(texts.drawer.menu),
             // const Padding(
                //padding: EdgeInsets.symmetric(horizontal: 16.0),
                //child: ButtonDarkMode(), //  Usar el nuevo botón
              //),
            ],
          );
        },
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
                iconColor: iconColor,
                onPressed: () => scaffoldKey.currentState?.openDrawer(),
                backgroundColor: backgroundColor,
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