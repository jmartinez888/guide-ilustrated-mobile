// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'specie_favorite.freezed.dart';
part 'specie_favorite.g.dart';

@freezed
class SpecieFavorite with _$SpecieFavorite {
  factory SpecieFavorite({
    required int id,
    required String? name,
    required String? scientificName,
    required String? description,
    required List<String>? images,
    required List<String>? authors,
    required String? class_,
    required String? family,
    required String? kingdom,
    required String? order,
    required String? phylum,
    required String? sound,
    required String? type,
    required String? year,
   @JsonKey(name: 'vc_imagenes_estado') required List<String>? vcImagenesEstado,
  }) = _SpecieFavorite;

  factory SpecieFavorite.fromJson(Map<String, dynamic> json) =>
      _$SpecieFavoriteFromJson(json);
}
