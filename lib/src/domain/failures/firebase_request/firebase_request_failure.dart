import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_request_failure.freezed.dart';

@freezed
class FirebaseRequestFailure with _$FirebaseRequestFailure {

  factory FirebaseRequestFailure.network(String message) = _FirebaseRequestFailureNetwork;
  factory FirebaseRequestFailure.unknown(String message) = _FirebaseRequestFailureUnknown;
  factory FirebaseRequestFailure.empty(String message) = _FirebaseRequestFailureEmpty;
  factory FirebaseRequestFailure.denied(String message) = _FirebaseRequestFailureDenied;
  factory FirebaseRequestFailure.timeout(String message) = _FirebaseRequestFailureTimeout;
}