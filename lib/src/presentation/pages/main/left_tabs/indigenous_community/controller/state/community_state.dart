import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/community_iiap/community_iiap.dart';

part 'community_state.freezed.dart';

@freezed
class CommunityState with _$CommunityState {

  factory CommunityState({
    @Default([]) List<CommunityIiap> communities,
  }) = _CommunityState;

}