import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:species/firebase_options.dart';
import 'package:species/src/data/repositories_implementation/account/account_repository_impl.dart';
import 'package:species/src/data/repositories_implementation/auth/auth_repository_impl.dart';
import 'package:species/src/data/repositories_implementation/class/class_repository_impl.dart';
import 'package:species/src/data/repositories_implementation/community/community_repository_imp.dart';
import 'package:species/src/data/repositories_implementation/family/family_repository_impl.dart';
import 'package:species/src/data/repositories_implementation/favorite/favorite_repository_impl.dart';
import 'package:species/src/data/repositories_implementation/order/order_repository_impl.dart';
import 'package:species/src/data/repositories_implementation/specie/specie_repository_impl.dart';
import 'package:species/src/data/repositories_implementation/state_of_conservation/state_of_conservation_repository_impl.dart';
import 'package:species/src/data/repositories_implementation/taxonomy/taxonomy_repository_impl.dart';
import 'package:species/src/data/services/remote/account_api.dart';
import 'package:species/src/data/services/remote/auth_api.dart';
import 'package:species/src/data/services/remote/class_api.dart';
import 'package:species/src/data/services/remote/community_api.dart';
import 'package:species/src/data/services/remote/family_api.dart';
import 'package:species/src/data/services/remote/favorites_api.dart';
import 'package:species/src/data/services/remote/order_api.dart';
import 'package:species/src/data/services/remote/specie_api.dart';
import 'package:species/src/data/services/remote/state_of_conservation_api.dart';
import 'package:species/src/data/services/remote/taxonomy_api.dart';
import 'package:species/src/domain/repositories/account/account_repository.dart';
import 'package:species/src/domain/repositories/auth/auth_repository.dart';
import 'package:species/src/domain/repositories/class/class_repository.dart';
import 'package:species/src/domain/repositories/community/community_repository.dart';
import 'package:species/src/domain/repositories/family/family_repository.dart';
import 'package:species/src/domain/repositories/favorite/favorite_repository.dart';
import 'package:species/src/domain/repositories/order/order_repository.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:species/src/domain/repositories/state_of_conservation/state_of_conservation_repository.dart';
import 'package:species/src/domain/repositories/taxonomy/taxonomy_repository.dart';
import 'package:species/src/my_app.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/global/sections/specie_tab/state/specie_tab_state.dart';
import 'package:species/src/presentation/pages/main/left_tabs/indigenous_community/controller/community_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/indigenous_community/controller/state/community_state.dart';
import 'package:species/src/presentation/pages/main/left_tabs/indigenous_community/sub_routes/indigenous_community/controller/community_details_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/indigenous_community/sub_routes/indigenous_community/controller/state/community_details_state.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/controller/favorite_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/favorites/controller/state/favories_state.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/species_details/controller/species_details_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/species_details/controller/state/species_details_state.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/amphibians_tab/controller/amphibians_tab_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/birds_tab/controller/birds_tab_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/fishes_tab/controller/fishes_tab_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/insects_tab/controller/insects_tab_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/mammals_tab/controller/mammals_tab_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/palms_tab/controller/palms_tab_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/reptiles_tab/controller/reptiles_tab_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/trees_tab/controller/trees_tab_controller.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  // if (Platform.isIOS) {
  //   await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform, name: 'iOSApp');
  // } else if (Platform.isAndroid) {
  //   await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform);
  // }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  const String baseUrl = 'https://api.amazonia.iiap.gob.pe/api/v1';

  runApp(
    MultiProvider(
      providers: [
        Provider<AccountRepository>(
          create: (_) => AccountRepositoryImpl(
            accountApi: AccountApi(),
          ),
        ),
        Provider<AuthRepository>(
          create: (_) => AuthRepositoryImpl(
            AuthApi(),
          ),
        ),
        Provider<SpecieRepository>(
          create: (_) => SpecieRepositoryImpl(
            specieApi: SpecieApi(
              baseUrl: baseUrl,
            ),
          ),
        ),
        Provider<ClassRepository>(
          create: (_) => ClassRepositoryImpl(
            classApi: ClassApi(
              baseUrl: baseUrl,
            ),
          ),
        ),
        Provider<OrderRepository>(
          create: (_) => OrderRepositoryImpl(
            orderApi: OrderApi(
              baseUrl: baseUrl,
            ),
          ),
        ),
        Provider<FamilyRepository>(
          create: (_) => FamilyRepositoryImpl(
            familyApi: FamilyApi(
              baseUrl: baseUrl,
            ),
          ),
        ),
        Provider<StateOfConservationRepository>(
          create: (_) => StateOfConservationRepositoryImpl(
            stateOfConservationApi: StateOfConservationApi(
              baseUrl: baseUrl,
            ),
          ),
        ),
        Provider<TaxonomyRepository>(
          create: (_) => TaxonomyRepositoryImpl(
            taxonomyApi: TaxonomyApi(
              baseUrl: baseUrl,
            ),
          ),
        ),
        Provider<FavoriteRepository>(
          create: (_) => FavoriteRepositoryImpl(
            favoriteApi: FavoriteApi(),
          ),
        ),
        Provider<CommunityRepository>(
          create: (_) => CommunityRositoryImpl(
            communityApi: CommunityApi(
              baseUrl: baseUrl,
            ),
          ),
        ),
        ChangeNotifierProvider<BirdsTabController>(
          create: (context) => BirdsTabController(
            SpecieTabState(),
            specieRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<MammalsTabController>(
          create: (context) => MammalsTabController(
            SpecieTabState(),
            specieRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<ReptilesTabController>(
          create: (context) => ReptilesTabController(
            SpecieTabState(),
            specieRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<AmphibiansTabController>(
          create: (context) => AmphibiansTabController(
            SpecieTabState(),
            specieRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<FishesTabController>(
          create: (context) => FishesTabController(
            SpecieTabState(),
            specieRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<InsectsTabController>(
          create: (context) => InsectsTabController(
            SpecieTabState(),
            specieRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<TreesTabController>(
          create: (context) => TreesTabController(
            SpecieTabState(),
            specieRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<PalmsTabController>(
          create: (context) => PalmsTabController(
            SpecieTabState(),
            specieRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<SpeciesDetailsController>(
          create: (context) => SpeciesDetailsController(
            SpeciesDetailsState(),
            specieRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<SessionController>(
          create: (context) => SessionController(context.read()),
        ),
        ChangeNotifierProvider<FavoriteController>(
          create: (context) => FavoriteController(
            FavoritesState(),
            favoriteRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<CommunityController>(
          create: (context) => CommunityController(
            CommunityState(),
            communityRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<CommunityDetailsController>(
          create: (context) => CommunityDetailsController(
            CommunityDetailsState(),
            communityRepository: context.read(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
