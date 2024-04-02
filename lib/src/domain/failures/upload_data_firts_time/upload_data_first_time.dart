import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_data_first_time.freezed.dart';

@freezed
class UploadDataForFirstTimeFailure with _$UploadDataForFirstTimeFailure {

  factory UploadDataForFirstTimeFailure.network() = UploadDataForFirstTimeFailureNetwork;
  factory UploadDataForFirstTimeFailure.unknow() = UploadDataForFirstTimeFailureUnknow;

}