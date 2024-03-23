// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/author/author.dart';
import 'package:species/src/domain/entities/class/class.dart';
import 'package:species/src/domain/entities/conservation_states/conservation_states.dart';
import 'package:species/src/domain/entities/family/family.dart';
import 'package:species/src/domain/entities/kindom/kindom.dart';
import 'package:species/src/domain/entities/order/order.dart';
import 'package:species/src/domain/entities/phylum/phylum.dart';
import 'package:species/src/domain/entities/type/type.dart';
import 'package:species/src/presentation/global/utils/serializers/for_entities/authors_map_into_class.dart';
import 'package:species/src/presentation/global/utils/serializers/for_entities/class_map_into_class.dart';
import 'package:species/src/presentation/global/utils/serializers/for_entities/conservations_state_map_into_class.dart';
import 'package:species/src/presentation/global/utils/serializers/for_entities/family_map_into_class.dart';
import 'package:species/src/presentation/global/utils/serializers/for_entities/kingdom_map_into_class.dart';
import 'package:species/src/presentation/global/utils/serializers/for_entities/order_map_into_class.dart';
import 'package:species/src/presentation/global/utils/serializers/for_entities/phylum_map_inot_class.dart';
import 'package:species/src/presentation/global/utils/serializers/for_entities/type_map_into_class.dart';

part 'specie.freezed.dart';
part 'specie.g.dart';

@freezed
class Specie with _$Specie {
  factory Specie({
    required int id,
    String? name,
    @JsonKey(name: 'scientific_name') String? scientificName,
    @JsonKey(name: 'english_name') String? englishName,
    String? year,
    @JsonKey(name: 'id_family') int? idFamily,
    List<String>? images,
    @TypeMapIntoClass() @Default(null) TypeC? type,
    String? sound,
    String? description,
    @ConservationsStatesMapIntoClass()
    @JsonKey(name: 'conservation_states')
    List<ConservationStates>? conservationStates,
    @AuthorsIntoClassToMap() @Default(null) List<Author>? authors,
    @KingdomMapIntoClass() @Default(null) Kingdom? kingdom,
    @PhylumMapIntoClass() @Default(null) Phylum? phylum,
    @ClassMapIntoClass() @Default(null) ClassC? classC,
    @OrderMapIntoClass()
    @Default(null) OrderC? order,
    @FamilyMapIntoClass()
    @Default(null) Family? family,
    String? state,
  }) = _Specie;

  factory Specie.fromJson(Map<String, dynamic> json) => _$SpecieFromJson(json);
}


List<Specie> getSpecieList(List list) {
  return list.map((e) => Specie.fromJson(e)).toList();
}