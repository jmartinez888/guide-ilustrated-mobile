import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/community/community.dart';

part 'community_state.freezed.dart';

@freezed
class CommunityState with _$CommunityState {

  factory CommunityState({
    @Default([]) List<Community> communities,
  }) = _CommunityState;

}