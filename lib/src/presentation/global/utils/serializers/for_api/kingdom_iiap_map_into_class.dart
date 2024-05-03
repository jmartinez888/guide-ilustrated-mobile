import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/kingdom_iiap/kingdom_iiap.dart';

class KingdomIiapMapIntoClass implements JsonConverter<KingdomIiap, dynamic> {
  const KingdomIiapMapIntoClass();

  @override
  KingdomIiap fromJson(dynamic kingdom) => KingdomIiap.fromJson(kingdom);

  @override
  Map<String, dynamic> toJson(KingdomIiap kingdom) => kingdom.toJson();
}