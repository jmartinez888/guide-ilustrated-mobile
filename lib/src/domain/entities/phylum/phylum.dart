import 'package:freezed_annotation/freezed_annotation.dart';

part 'phylum.freezed.dart';
part 'phylum.g.dart';

@freezed
class Phylum with _$Phylum {

  factory Phylum({
    @JsonKey(name: 'id_filo') required int id,
    @JsonKey(name: 'vc_nombre') String? name,
  }) = _Phylum;

  factory Phylum.fromJson(Map<String, dynamic> json) => _$PhylumFromJson(json);
}