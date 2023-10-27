import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/sub_routes/image_details_favorite/image_details_favorite_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/sub_routes/specie_details_favorite/specie_details_favorite_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/auth/forgot_password/forgot_password_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/auth/sign_in/sign_in_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/auth/sign_up/sign_up_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/image_details/image_details_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/favorites_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/species_page.dart';
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
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/pdf_preview.dart/pdf_preview_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/specie_details/specie_details_page.dart';
import 'package:species/src/presentation/router/routes.dart';

final parentNavigatorKey = GlobalKey<NavigatorState>();
final parentLeftNavigatorKey = GlobalKey<NavigatorState>();
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
              redirect: (context, state) {
                if (_firebaseAuth.currentUser != null) {
                  return null;
                }
                if (_firebaseAuth.currentUser == null) {
                  return '${Routes.species}/${Routes.signIn}';
                }
                return null;
              },
              path: Routes.profile,
              name: Routes.profile,
              builder: (_, __) => const ProfilePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.species,
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
                      routes: [
                        GoRoute(
                          path: '${Routes.specieDetails}/:id',
                          name: Routes.specieDetails,
                          builder: (_, state) {
                            final id = state.pathParameters['id'];
                            return SpecieDetailsPage(id: id.toString());
                          },
                        ),
                        GoRoute(
                          path: '${Routes.specieImage}/:id',
                          name: Routes.specieImage,
                          parentNavigatorKey: parentNavigatorKey,
                          builder: (_, state) {
                            final id = state.pathParameters['id'];
                            return ImageDetailsPage(id: id.toString());
                          },
                        ),
                        GoRoute(
                          redirect: (context, state) {
                            if (_firebaseAuth.currentUser != null) {
                              return Routes.species;
                            }
                            if (_firebaseAuth.currentUser == null) {
                              return '${Routes.species}/${Routes.signIn}';
                            }
                            return null;
                          },
                          path: Routes.signIn,
                          name: Routes.signIn,
                          parentNavigatorKey: parentNavigatorKey,
                          builder: (_, __) => const SignInPage(),
                        ),
                        GoRoute(
                          redirect: (context, state) {
                            if (_firebaseAuth.currentUser != null) {
                              return Routes.species;
                            }
                            if (_firebaseAuth.currentUser == null) {
                              return '${Routes.species}/${Routes.signUp}';
                            }
                            return null;
                          },
                          path: Routes.signUp,
                          name: Routes.signUp,
                          parentNavigatorKey: parentNavigatorKey,
                          builder: (_, __) => const SignUpPage(),
                        ),
                        GoRoute(
                          path: Routes.forgotPassword,
                          name: Routes.forgotPassword,
                          parentNavigatorKey: parentNavigatorKey,
                          builder: (_, __) => const ForgotPasswordPage(),
                        ),
                        GoRoute(
                          path: '${Routes.speciePdfPreview}/:specie',
                          name: Routes.speciePdfPreview,
                          parentNavigatorKey: parentNavigatorKey,
                          builder: (_, state) {
                            final specie = state.pathParameters['specie'];
                            return PdfPreviewPage(specie: specie.toString());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: Routes.specieSearch,
                      name: Routes.specieSearch,
                      builder: (_, __) => const SearchPage(),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      redirect: (context, state) {
                        if (_firebaseAuth.currentUser != null) {
                          return null;
                        }
                        if (_firebaseAuth.currentUser == null) {
                          return '${Routes.species}/${Routes.signIn}';
                        }
                        return null;
                      },
                      path: Routes.specieFavorites,
                      name: Routes.specieFavorites,
                      builder: (_, __) => const FavoritesPage(),
                      routes: [
                        GoRoute(
                          redirect: (context, state) {
                            if (_firebaseAuth.currentUser != null) {
                              return null;
                            }
                            if (_firebaseAuth.currentUser == null) {
                              return '${Routes.species}/${Routes.signIn}';
                            }
                            return null;
                          },
                          path: '${Routes.specieDetailsFavorite}/:specie',
                          name: Routes.specieDetailsFavorite,
                          builder: (_, state) {
                            final specie = state.pathParameters['specie'];
                            return SpecieDetailsFavoritePage(
                                specie: specie.toString());
                          },
                        ),
                        GoRoute(
                          redirect: (context, state) {
                            if (_firebaseAuth.currentUser != null) {
                              return null;
                            }
                            if (_firebaseAuth.currentUser == null) {
                              return '${Routes.species}/${Routes.signIn}';
                            }
                            return null;
                          },
                          path: '${Routes.specieImageFavorite}/:specie',
                          name: Routes.specieImageFavorite,
                          parentNavigatorKey: parentNavigatorKey,
                          builder: (_, state) {
                            final specie = state.pathParameters['specie'];
                            return ImageDetailsFavoritePage(
                                specie: specie.toString());
                          },
                        ),
                      ],
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
