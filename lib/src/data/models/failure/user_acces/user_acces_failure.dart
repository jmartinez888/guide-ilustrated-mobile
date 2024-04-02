import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_acces_failure.freezed.dart';

@freezed
class UserAccesFailure with _$UserAccesFailure {
  factory UserAccesFailure.emailIsNotVerified() =
      UserAccesFailureEmailIsNotVerified;
  factory UserAccesFailure.empty() =
      UserAccesFailureEmpty;
}
