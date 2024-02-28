import 'package:freezed_annotation/freezed_annotation.dart';

part 'kingdom.freezed.dart';
part 'kingdom.g.dart';

@freezed
class Kingdom with _$Kingdom {

  factory Kingdom({
    @JsonKey(name: 'id_reino') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
  }) = _Kingdom;

  factory Kingdom.fromJson(Map<String, dynamic> json) => _$KingdomFromJson(json);
}