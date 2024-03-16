import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/repositories/account/account_repository.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/pages/error/error_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/about/about_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/indigenous_community/indigenous_community_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/indigenous_community/sub_routes/indigenous_community_details/indigenous_community_details_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/indigenous_community/sub_routes/indigenous_community_search_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/delete_account_page/delete_account_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/edit_profile_page/edit_profile_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/sub_routes/specie_details_favorite/specie_details_favorite_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/auth/forgot_password/forgot_password_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/auth/sign_in/sign_in_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/auth/sign_up/sign_up_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/image_details/image_details_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/favorites_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/species_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/search/search_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/main_species/main_species.dart';
import 'package:species/src/presentation/pages/main/main_left_nav/main_left_nav.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/profile_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/staff/staff_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/pdf_preview.dart/pdf_preview_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/species_details/specie_details_page.dart';
import 'package:species/src/presentation/pages/splash/splash_page.dart';
import 'package:species/src/presentation/router/routes.dart';

final parentNavigatorKey = GlobalKey<NavigatorState>();
final parentLeftNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: Routes.splash,
  navigatorKey: parentNavigatorKey,
  errorBuilder: (context, state) => const ErrorPage(),
  routes: [
    GoRoute(
      path: Routes.splash,
      name: Routes.splash,
      builder: (_, __) => const SplashPage(),
    ),
    ShellRoute(
      builder: (context, state, child) => MainLeftNav(child: child),
      routes: [
        GoRoute(
          path: Routes.profile,
          name: Routes.profile,
          builder: (_, __) => const ProfilePage(),
          redirect: (context, state) {
            SessionController sessionController = context.read();

            final uid = sessionController.state;

            if (uid != null) {
              return null;
            } else {
              return '${Routes.species}/${Routes.signIn}';
            }
          },
          routes: [
            GoRoute(
              path: '${Routes.editProfile}/:userId',
              name: Routes.editProfile,
              builder: (_, state) {
                final userId = state.pathParameters['userId'];
                return EditProfile(userId: userId.toString());
              },
              redirect: (context, state) {
                SessionController sessionController = context.read();

                final uid = sessionController.state;

                if (uid != null) {
                  return null;
                } else {
                  return '${Routes.species}/${Routes.signIn}';
                }
              },
              parentNavigatorKey: parentNavigatorKey,
            ),
            GoRoute(
              path: '${Routes.deleteAccount}/:userId',
              name: Routes.deleteAccount,
              builder: (_, state) {
                final userId = state.pathParameters['userId'];
                return DeleteAccountPage(userId: userId.toString());
              },
              redirect: (context, state) {
                SessionController sessionController = context.read();

                final uid = sessionController.state;

                if (uid != null) {
                  return null;
                } else {
                  return Routes.species;
                }
              },
              parentNavigatorKey: parentNavigatorKey,
            ),
          ],
        ),
        ShellRoute(
            builder: (context, state, child) => MainSpecies(child: child),
            routes: [
              GoRoute(
                path: Routes.species,
                name: Routes.species,
                builder: (_, __) => const SpeciesPage(),
                routes: [
                  GoRoute(
                    path: '${Routes.specieImage}/:specie',
                    name: Routes.specieImage,
                    parentNavigatorKey: parentNavigatorKey,
                    builder: (_, state) {
                      final specie = state.pathParameters['specie'];
                      return ImageDetailsPage(specie: specie!.toString());
                    },
                  ),
                  GoRoute(
                    path: Routes.signIn,
                    name: Routes.signIn,
                    builder: (_, __) => const SignInPage(),
                    redirect: (context, state) {
                      SessionController sessionController = context.read();

                      final uid = sessionController.state;

                      if (uid != null) {
                        return Routes.species;
                      } else {
                        return null;
                      }
                    },
                    parentNavigatorKey: parentNavigatorKey,
                  ),
                  GoRoute(
                    path: Routes.signUp,
                    name: Routes.signUp,
                    builder: (_, __) => const SignUpPage(),
                    redirect: (context, state) {
                      SessionController sessionController = context.read();

                      final uid = sessionController.state;

                      if (uid != null) {
                        return Routes.species;
                      } else {
                        return null;
                      }
                    },
                    parentNavigatorKey: parentNavigatorKey,
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
                  GoRoute(
                    path: ':id',
                    name: Routes.specieDetails,
                    builder: (_, state) {
                      final id = state.pathParameters['id'];
                      return SpecieDetailsPage(id: id.toString());
                    },
                  ),
                ],
              ),
              GoRoute(
                path: Routes.specieSearch,
                name: Routes.specieSearch,
                builder: (_, __) => const SearchPage(),
              ),
              GoRoute(
                path: Routes.specieFavorites,
                name: Routes.specieFavorites,
                builder: (_, __) => const FavoritesPage(),
                redirect: (context, state) {
                  SessionController sessionController = context.read();

                  final uid = sessionController.state;

                  if (uid != null) {
                    return null;
                  } else {
                    return '${Routes.species}/${Routes.signIn}';
                  }
                },
                routes: [
                  GoRoute(
                    redirect: (context, state) {
                      AccountRepository accountRepository = context.read();
                      final result = accountRepository.acces();

                      if (result) {
                        return null;
                      } else {
                        return '${Routes.species}/${Routes.signIn}';
                      }
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
                      AccountRepository accountRepository = context.read();
                      final result = accountRepository.acces();

                      if (result) {
                        return null;
                      } else {
                        return '${Routes.species}/${Routes.signIn}';
                      }
                    },
                    path: '${Routes.specieImageFavorite}/:specie',
                    name: Routes.specieImageFavorite,
                    parentNavigatorKey: parentNavigatorKey,
                    builder: (_, state) {
                      final specie = state.pathParameters['specie'];
                      /* return ImageDetailsFavoritePage(
                                specie: specie.toString()); */
                      return SizedBox();
                    },
                  ),
                ],
              ),
            ]),
        GoRoute(
          path: Routes.indigenousCommunity,
          name: Routes.indigenousCommunity,
          builder: (_, __) => const IndigenousCommunityPage(),
          routes: [
            GoRoute(
              path: Routes.indigenousCommunitySearch,
              name: Routes.indigenousCommunitySearch,
              parentNavigatorKey: parentNavigatorKey,
              builder: (_, __) => const IndigenousCommunitySearchPage(),
            ),
            GoRoute(
              path: ':id',
              name: Routes.indigenousCommunityDetails,
              builder: (_, state) {
                final id = state.pathParameters['id'];
                return IndigenousCommunityDetailsPage(id: id.toString());
              },
            ),
          ],
        ),
        GoRoute(
          path: Routes.staff,
          name: Routes.staff,
          builder: (_, __) => const StaffPage(),
        ),
        GoRoute(
          path: Routes.about,
          name: Routes.about,
          builder: (_, __) => const AboutPage(),
        ),
      ],
    ),
  ],
);
