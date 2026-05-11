// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kingdom_iiap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KingdomIiap _$KingdomIiapFromJson(Map<String, dynamic> json) {
  return _KingdomIiap.fromJson(json);
}

/// @nodoc
mixin _$KingdomIiap {
  @JsonKey(name: 'id_reino')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this KingdomIiap to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KingdomIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KingdomIiapCopyWith<KingdomIiap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KingdomIiapCopyWith<$Res> {
  factory $KingdomIiapCopyWith(
          KingdomIiap value, $Res Function(KingdomIiap) then) =
      _$KingdomIiapCopyWithImpl<$Res, KingdomIiap>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_reino') int id,
      @JsonKey(name: 'vc_nombre') String? name});
}

/// @nodoc
class _$KingdomIiapCopyWithImpl<$Res, $Val extends KingdomIiap>
    implements $KingdomIiapCopyWith<$Res> {
  _$KingdomIiapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KingdomIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KingdomIiapImplCopyWith<$Res>
    implements $KingdomIiapCopyWith<$Res> {
  factory _$$KingdomIiapImplCopyWith(
          _$KingdomIiapImpl value, $Res Function(_$KingdomIiapImpl) then) =
      __$$KingdomIiapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_reino') int id,
      @JsonKey(name: 'vc_nombre') String? name});
}

/// @nodoc
class __$$KingdomIiapImplCopyWithImpl<$Res>
    extends _$KingdomIiapCopyWithImpl<$Res, _$KingdomIiapImpl>
    implements _$$KingdomIiapImplCopyWith<$Res> {
  __$$KingdomIiapImplCopyWithImpl(
      _$KingdomIiapImpl _value, $Res Function(_$KingdomIiapImpl) _then)
      : super(_value, _then);

  /// Create a copy of KingdomIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_$KingdomIiapImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KingdomIiapImpl implements _KingdomIiap {
  _$KingdomIiapImpl(
      {@JsonKey(name: 'id_reino') required this.id,
      @JsonKey(name: 'vc_nombre') this.name});

  factory _$KingdomIiapImpl.fromJson(Map<String, dynamic> json) =>
      _$$KingdomIiapImplFromJson(json);

  @override
  @JsonKey(name: 'id_reino')
  final int id;
  @override
  @JsonKey(name: 'vc_nombre')
  final String? name;

  @override
  String toString() {
    return 'KingdomIiap(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KingdomIiapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of KingdomIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KingdomIiapImplCopyWith<_$KingdomIiapImpl> get copyWith =>
      __$$KingdomIiapImplCopyWithImpl<_$KingdomIiapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KingdomIiapImplToJson(
      this,
    );
  }
}

abstract class _KingdomIiap implements KingdomIiap {
  factory _KingdomIiap(
      {@JsonKey(name: 'id_reino') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name}) = _$KingdomIiapImpl;

  factory _KingdomIiap.fromJson(Map<String, dynamic> json) =
      _$KingdomIiapImpl.fromJson;

  @override
  @JsonKey(name: 'id_reino')
  int get id;
  @override
  @JsonKey(name: 'vc_nombre')
  String? get name;

  /// Create a copy of KingdomIiap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KingdomIiapImplCopyWith<_$KingdomIiapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
