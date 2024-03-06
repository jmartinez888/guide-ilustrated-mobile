// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
class Community with _$Community {

  factory Community({
    @JsonKey(name: 'id_pueblo_indigena') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
    @JsonKey(name: 'te_descripcion') String? description,
    @JsonKey(name: 'de_longitud') double? longitude,
    @JsonKey(name: 'de_latitud') double? latitude,
    @JsonKey(name: 'vc_image') String? image,
    @JsonKey(name: 'ch_estado') String? state,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) => _$CommunityFromJson(json);
}

List<Community> getCommunityList(List list) {
  return list.map((e) => Community.fromJson(e)).toList();
}