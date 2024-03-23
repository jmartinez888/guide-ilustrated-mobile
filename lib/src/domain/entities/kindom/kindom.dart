import 'package:freezed_annotation/freezed_annotation.dart';

part 'kindom.freezed.dart';
part 'kindom.g.dart';

@freezed
class Kingdom with _$Kingdom {

  factory Kingdom({
    required int id,
     String? name,
  }) = _Kingdom;

  factory Kingdom.fromJson(Map<String, dynamic> json) => _$KingdomFromJson(json);
}