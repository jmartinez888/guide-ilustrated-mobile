import 'package:species/src/data/models/classes/community_iiap/community_iiap.dart';
import 'package:species/src/domain/entities/community/community.dart';

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
    );
  }
}
