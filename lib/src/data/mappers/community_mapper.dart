import 'package:species/src/data/models/classes/community_iiap/community_iiap.dart';
import 'package:species/src/domain/entities/community/community.dart';
import 'package:species/src/presentation/global/functions/generate_search/generate_search.dart';
import 'package:species/src/presentation/global/functions/validate_string/validate_string.dart';

class CommunityMapper {
  Community communityIiapToCommunity(CommunityIiap community) {
    return Community(
      id: community.id,
      name: community.name,
      description: community.description,
      longitude: community.longitude,
      latitude: community.latitude,
      images: community.image != null && community.image!.isNotEmpty
          ? [community.image!]
          : null,
      state: community.state,
      search: GenerateSearch.generarBusquedas(
        [
          if (community.name != null && community.name!.isNotEmpty)
            ValidateString.encode(community.name!)
        ],
      ),
    );
  }
}
