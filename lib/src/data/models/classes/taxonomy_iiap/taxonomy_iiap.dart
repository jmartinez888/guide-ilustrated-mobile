// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/class_iiap/class_iiap.dart';
import 'package:species/src/data/models/classes/family_iiap/family_iiap.dart';
import 'package:species/src/data/models/classes/kingdom_iiap/kingdom_iiap.dart';
import 'package:species/src/data/models/classes/order_iiap/order_iiap.dart';
import 'package:species/src/data/models/classes/phylum_iiap/phylum_iiap.dart';
import 'package:species/src/presentation/global/utils/serializers/for_api/class_iiap_map_into_class.dart';
import 'package:species/src/presentation/global/utils/serializers/for_api/family_iiap_map_into_class.dart';
import 'package:species/src/presentation/global/utils/serializers/for_api/kingdom_iiap_map_into_class.dart';
import 'package:species/src/presentation/global/utils/serializers/for_api/order_iiap_map_into_class.dart';
import 'package:species/src/presentation/global/utils/serializers/for_api/phylum_iiap_map_inot_class.dart';

part 'taxonomy_iiap.freezed.dart';
part 'taxonomy_iiap.g.dart';

@freezed
class TaxonomyIiap with _$TaxonomyIiap {
  factory TaxonomyIiap({
    @KingdomIiapMapIntoClass()
    @Default(null)
    @JsonKey(name: 'reino')
    KingdomIiap? kingdom,
    @PhylumIiapMapIntoClass()
    @Default(null)
    @JsonKey(name: 'filo')
    PhylumIiap? phylum,
    @ClassIiapMapIntoClass()
    @Default(null)
    @JsonKey(name: 'clase')
    ClassIiap? classC,
    @OrderIiapMapIntoClass()
    @Default(null)
    @JsonKey(name: 'orden')
    OrderIiap? order,
    @FamilyIiapMapIntoClass()
    @Default(null)
    @JsonKey(name: 'familia')
    FamilyIiap? family,
  }) = _TaxonomyIiap;

  factory TaxonomyIiap.fromJson(Map<String, dynamic> json) =>
      _$TaxonomyIiapFromJson(json);
}
