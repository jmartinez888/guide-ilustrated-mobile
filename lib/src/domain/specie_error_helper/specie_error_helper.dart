import 'package:freezed_annotation/freezed_annotation.dart';

part 'specie_error_helper.freezed.dart';
part 'specie_error_helper.g.dart';

@freezed
class SpecieErrorHelper with _$SpecieErrorHelper {

  factory SpecieErrorHelper({
    required String id,
  }) = _SpecieErrorHelper;

  factory SpecieErrorHelper.fromJson(Map<String, dynamic> json) => _$SpecieErrorHelperFromJson(json);
}