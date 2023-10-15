import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/favorites_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/species_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/lists/lists_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/search/search_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/main_species.dart';
import 'package:species/src/presentation/pages/main/main_left_nav.dart';
import 'package:species/src/presentation/pages/main/left_tabs/bardcoding/bardcoding_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/biological_data/biological_data_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/how_to_deposit/how_to_deposit_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/indigenous_community/indigenous_community_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/maps/maps_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/profile_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/scientific_resources/scientific_resources_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/specialists/specialists_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/staff/staff_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/viewfinder/viewfinder_page.dart';
import 'package:species/src/presentation/router/routes.dart';

final parentNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: Routes.species,
  navigatorKey: parentNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainLeftNav(navigationShell: navigationShell),
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
            StatefulShellRoute.indexedStack(
              builder: (context, state, navigationShell) =>
                  MainSpecies(navigationShell: navigationShell),
              branches: [
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
                      path: Routes.generalSearch,
                      name: Routes.generalSearch,
                      builder: (_, __) => const SearchPage(),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: Routes.favorites,
                      name: Routes.favorites,
                      builder: (_, __) => const FavoritesPage(),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: Routes.lists,
                      name: Routes.lists,
                      builder: (_, __) => const ListsPage(),
                    ),
                  ],
                ),
              ],
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
