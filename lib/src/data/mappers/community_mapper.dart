import 'package:species/src/data/models/indigenous_community_iiap/community_community_iiap.dart';
import 'package:species/src/domain/entities/community.dart';

class CommunityMapper {
  static Community comunityIiapToEntity(CommunityCommunityIiap communityIiap) => Community(
        id: communityIiap.id,
        name: communityIiap.vcNombre,
        description: communityIiap.teDescripcion,
        length: communityIiap.deLongitud,
        latitude: communityIiap.deLatitud,
        image: communityIiap.vcImage,
      );
}
