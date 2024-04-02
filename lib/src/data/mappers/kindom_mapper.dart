import 'package:species/src/data/models/classes/kingdom_iiap/kingdom_iiap.dart';
import 'package:species/src/domain/entities/kindom/kindom.dart';

class KingdomMapper {
  Kingdom kingdomIiapTokingdom(KingdomIiap kingdom) {
    return Kingdom(
      id: kingdom.id,
      name: kingdom.name,
    );
  }
}
