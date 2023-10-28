import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:species/src/data/repositories_implementation/community_iiap/community_iiap_repository_impl.dart';

final communityRepositoryProvider = Provider((ref) {
  return IndigenousCommunityIiaprepositoryImpl();
});
