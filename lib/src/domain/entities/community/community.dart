import 'package:freezed_annotation/freezed_annotation.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
class Community with _$Community {

  factory Community({
    required int id,
    String? name,
    String? description,
    double? longitude,
    double? latitude,
    List<String>? images,
    String? state,
    @Default([]) List<String> search,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) => _$CommunityFromJson(json);
}