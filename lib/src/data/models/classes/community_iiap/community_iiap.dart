// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_iiap.freezed.dart';
part 'community_iiap.g.dart';

@freezed
class CommunityIiap with _$CommunityIiap {

  factory CommunityIiap({
    @JsonKey(name: 'id_pueblo_indigena') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'te_descripcion') String? description,
    @JsonKey(name: 'de_longitud') double? longitude,
    @JsonKey(name: 'de_latitud') double? latitude,
    @JsonKey(name: 'vc_image') String? image,
    @JsonKey(name: 'ch_estado') String? state,
  }) = _CommunityIiap;

  factory CommunityIiap.fromJson(Map<String, dynamic> json) => _$CommunityIiapFromJson(json);
}

List<CommunityIiap> getCommunityIiapList(List list) {
  return list.map((e) => CommunityIiap.fromJson(e)).toList();
}