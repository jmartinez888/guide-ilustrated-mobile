import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_request_failure.freezed.dart';

@freezed
class HttpRequestFailure with _$HttpRequestFailure {
  factory HttpRequestFailure.network() = HttpRequestFailureNetwork;
  factory HttpRequestFailure.unknown() = HttpRequestFailureUnknown;
  factory HttpRequestFailure.notFound() = HttpRequestFailureNotFound;
}