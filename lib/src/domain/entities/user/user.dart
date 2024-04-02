import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserC with _$UserC {
  factory UserC({
    required String id,
    required String email,
    String? name,
    String? lastName,
    String? phone,
    DateTime? created,
    String? profilePicture,
  }) = _UserC;

  factory UserC.fromJson(Map<String, dynamic> json) => _$UserCFromJson(json);
}
