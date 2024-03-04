// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/class/class.dart';
import 'package:species/src/domain/entities/family/family.dart';
import 'package:species/src/domain/entities/kingdom/kingdom.dart';
import 'package:species/src/domain/entities/order/order.dart';
import 'package:species/src/domain/entities/phylum/phylum.dart';

part 'taxonomy.freezed.dart';
part 'taxonomy.g.dart';

@freezed
class Taxonomy with _$Taxonomy {

  factory Taxonomy({
    @JsonKey(name: 'reino') Kingdom? kingdom,
    @JsonKey(name: 'filo') Phylum? phylum,
    @JsonKey(name: 'clase') ClassC? classC,
    @JsonKey(name: 'orden') OrderC? order,
    @JsonKey(name: 'familia') Family? family,
  }) = _Taxonomy;

  factory Taxonomy.fromJson(Map<String, dynamic> json) => _$TaxonomyFromJson(json);
}