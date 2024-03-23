import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/community_iiap/community_iiap.dart';
import 'package:species/src/domain/entities/community/community.dart';

part 'community_details_state.freezed.dart';

@freezed
class CommunityDetailsState with _$CommunityDetailsState {

  factory CommunityDetailsState({
    @Default({}) Map<String, Community> mapOfId,
    @Default(true) bool loading,
  }) = _CommunityDetailsState;

}