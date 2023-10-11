import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/pages/main/main_page.dart';
import 'package:species/src/presentation/pages/profile/profile_page.dart';
import 'package:species/src/presentation/pages/species/species_page.dart';
import 'package:species/src/presentation/router/routes.dart';

final parentNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: Routes.species,
  navigatorKey: parentNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainPage(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              name: Routes.profile,
              builder: (_, __) => const ProfilePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.species,
              name: Routes.species,
              builder: (_, __) => const SpeciesPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
