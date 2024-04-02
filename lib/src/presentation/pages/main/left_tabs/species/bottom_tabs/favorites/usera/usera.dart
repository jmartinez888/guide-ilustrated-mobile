import 'package:freezed_annotation/freezed_annotation.dart';

part 'usera.freezed.dart';
part 'usera.g.dart';

@freezed
class Usera with _$Usera {

  factory Usera({
    required int id,
    required String name,
  }) = _Usera;

  factory Usera.fromJson(Map<String, dynamic> json) => _$UseraFromJson(json);
}

