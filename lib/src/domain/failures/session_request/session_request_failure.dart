import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_request_failure.freezed.dart';

@freezed
class SessionRequestFailure with _$SessionRequestFailure {
  factory SessionRequestFailure.credential() = SessionRequestFailureCredential;
  factory SessionRequestFailure.notRegistered() =
      SessionRequestFailureNotRegistered;
  factory SessionRequestFailure.password() =
      SessionRequestFailurePassword;
      factory SessionRequestFailure.disable() =
      SessionRequestFailureDisable;
      factory SessionRequestFailure.network() =
      SessionRequestFailureNetwork;
      factory SessionRequestFailure.unknown() =
      SessionRequestFailureUnknown;
}
