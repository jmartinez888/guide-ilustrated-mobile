import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/pages/bardcoding/bardcoding_page.dart';
import 'package:species/src/presentation/pages/biological_data/biological_data_page.dart';
import 'package:species/src/presentation/pages/how_to_deposit/how_to_deposit_page.dart';
import 'package:species/src/presentation/pages/indigenous_community/indigenous_community_page.dart';
import 'package:species/src/presentation/pages/main/main_page.dart';
import 'package:species/src/presentation/pages/maps/maps_page.dart';
import 'package:species/src/presentation/pages/profile/profile_page.dart';
import 'package:species/src/presentation/pages/scientific_resources/scientific_resources_page.dart';
import 'package:species/src/presentation/pages/specialists/specialists_page.dart';
import 'package:species/src/presentation/pages/species/species_page.dart';
import 'package:species/src/presentation/pages/staff/staff_page.dart';
import 'package:species/src/presentation/pages/viewfinder/viewfinder_page.dart';
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
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.indigenousCommunity,
              name: Routes.indigenousCommunity,
              builder: (_, __) => const IndigenousCommunityPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.bardcoding,
              name: Routes.bardcoding,
              builder: (_, __) => const BardcodingPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.viewfinder,
              name: Routes.viewfinder,
              builder: (_, __) => const ViewfinderPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.maps,
              name: Routes.maps,
              builder: (_, __) => const MapsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.biologicalData,
              name: Routes.biologicalData,
              builder: (_, __) => const BiologicalDataPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.scientificResources,
              name: Routes.scientificResources,
              builder: (_, __) => const ScientificResourcesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.specialists,
              name: Routes.specialists,
              builder: (_, __) => const SpecialistsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.howToDeposit,
              name: Routes.howToDeposit,
              builder: (_, __) => const HowToDepositPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.staff,
              name: Routes.staff,
              builder: (_, __) => const StaffPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
