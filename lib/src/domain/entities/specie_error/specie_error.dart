import 'package:freezed_annotation/freezed_annotation.dart';

part 'specie_error.freezed.dart';
part 'specie_error.g.dart';

@freezed
class SpecieError with _$SpecieError {

  factory SpecieError({
    required int id,
  }) = _SpecieError;

  factory SpecieError.fromJson(Map<String, dynamic> json) => _$SpecieErrorFromJson(json);
}