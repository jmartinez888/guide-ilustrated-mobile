// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserC _$UserCFromJson(Map<String, dynamic> json) {
  return _UserC.fromJson(json);
}

/// @nodoc
mixin _$UserC {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime? get created => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;

  /// Serializes this UserC to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserC
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCCopyWith<UserC> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCCopyWith<$Res> {
  factory $UserCCopyWith(UserC value, $Res Function(UserC) then) =
      _$UserCCopyWithImpl<$Res, UserC>;
  @useResult
  $Res call(
      {String id,
      String email,
      String? name,
      String? lastName,
      String? phone,
      @TimestampSerializer() DateTime? created,
      String? profilePicture});
}

/// @nodoc
class _$UserCCopyWithImpl<$Res, $Val extends UserC>
    implements $UserCCopyWith<$Res> {
  _$UserCCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserC
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? created = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCImplCopyWith<$Res> implements $UserCCopyWith<$Res> {
  factory _$$UserCImplCopyWith(
          _$UserCImpl value, $Res Function(_$UserCImpl) then) =
      __$$UserCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String? name,
      String? lastName,
      String? phone,
      @TimestampSerializer() DateTime? created,
      String? profilePicture});
}

/// @nodoc
class __$$UserCImplCopyWithImpl<$Res>
    extends _$UserCCopyWithImpl<$Res, _$UserCImpl>
    implements _$$UserCImplCopyWith<$Res> {
  __$$UserCImplCopyWithImpl(
      _$UserCImpl _value, $Res Function(_$UserCImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserC
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? created = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_$UserCImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserCImpl implements _UserC {
  _$UserCImpl(
      {required this.id,
      required this.email,
      this.name,
      this.lastName,
      this.phone,
      @TimestampSerializer() this.created = null,
      this.profilePicture});

  factory _$UserCImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserCImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String? name;
  @override
  final String? lastName;
  @override
  final String? phone;
  @override
  @JsonKey()
  @TimestampSerializer()
  final DateTime? created;
  @override
  final String? profilePicture;

  @override
  String toString() {
    return 'UserC(id: $id, email: $email, name: $name, lastName: $lastName, phone: $phone, created: $created, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, email, name, lastName, phone, created, profilePicture);

  /// Create a copy of UserC
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCImplCopyWith<_$UserCImpl> get copyWith =>
      __$$UserCImplCopyWithImpl<_$UserCImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCImplToJson(
      this,
    );
  }
}

abstract class _UserC implements UserC {
  factory _UserC(
      {required final String id,
      required final String email,
      final String? name,
      final String? lastName,
      final String? phone,
      @TimestampSerializer() final DateTime? created,
      final String? profilePicture}) = _$UserCImpl;

  factory _UserC.fromJson(Map<String, dynamic> json) = _$UserCImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String? get name;
  @override
  String? get lastName;
  @override
  String? get phone;
  @override
  @TimestampSerializer()
  DateTime? get created;
  @override
  String? get profilePicture;

  /// Create a copy of UserC
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCImplCopyWith<_$UserCImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
