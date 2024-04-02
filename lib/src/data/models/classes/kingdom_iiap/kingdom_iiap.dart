// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'kingdom_iiap.freezed.dart';
part 'kingdom_iiap.g.dart';

@freezed
class KingdomIiap with _$KingdomIiap {

  factory KingdomIiap({
    @JsonKey(name: 'id_reino') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
  }) = _KingdomIiap;

  factory KingdomIiap.fromJson(Map<String, dynamic> json) => _$KingdomIiapFromJson(json);
}