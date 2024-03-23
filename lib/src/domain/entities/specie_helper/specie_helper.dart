import 'package:freezed_annotation/freezed_annotation.dart';

part 'specie_helper.freezed.dart';
part 'specie_helper.g.dart';

@freezed
class SpecieHelper with _$SpecieHelper {

  factory SpecieHelper({
    required int id,
  }) = _SpecieHelper;

  factory SpecieHelper.fromJson(Map<String, dynamic> json) => _$SpecieHelperFromJson(json);
}