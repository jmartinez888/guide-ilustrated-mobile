import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/user/user.dart';
import 'package:species/src/domain/failures/firebase_request/firebase_request_failure.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState.loading() = _ProfileStateLoading;
  factory ProfileState.failed(FirebaseRequestFailure firebaseError) =
      _ProfileStateFailed;
  factory ProfileState.loaded(UserC user) = _ProfileStateLoaded;
}
