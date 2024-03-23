import 'package:freezed_annotation/freezed_annotation.dart';

part 'phylum.freezed.dart';
part 'phylum.g.dart';

@freezed
class Phylum with _$Phylum {
  factory Phylum({
    required int id,
    String? name,
  }) = _Phylum;

  factory Phylum.fromJson(Map<String, dynamic> json) => _$PhylumFromJson(json);
}
