// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'family_iiap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FamilyIiap _$FamilyIiapFromJson(Map<String, dynamic> json) {
  return _FamilyIiap.fromJson(json);
}

/// @nodoc
mixin _$FamilyIiap {
  @JsonKey(name: 'id_familia')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_orden')
  int? get idOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'ch_estado')
  String? get state => throw _privateConstructorUsedError;

  /// Serializes this FamilyIiap to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FamilyIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FamilyIiapCopyWith<FamilyIiap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyIiapCopyWith<$Res> {
  factory $FamilyIiapCopyWith(
          FamilyIiap value, $Res Function(FamilyIiap) then) =
      _$FamilyIiapCopyWithImpl<$Res, FamilyIiap>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_familia') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'id_orden') int? idOrder,
      @JsonKey(name: 'ch_estado') String? state});
}

/// @nodoc
class _$FamilyIiapCopyWithImpl<$Res, $Val extends FamilyIiap>
    implements $FamilyIiapCopyWith<$Res> {
  _$FamilyIiapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FamilyIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? idOrder = freezed,
    Object? state = freezed,
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
      idOrder: freezed == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FamilyIiapImplCopyWith<$Res>
    implements $FamilyIiapCopyWith<$Res> {
  factory _$$FamilyIiapImplCopyWith(
          _$FamilyIiapImpl value, $Res Function(_$FamilyIiapImpl) then) =
      __$$FamilyIiapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_familia') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'id_orden') int? idOrder,
      @JsonKey(name: 'ch_estado') String? state});
}

/// @nodoc
class __$$FamilyIiapImplCopyWithImpl<$Res>
    extends _$FamilyIiapCopyWithImpl<$Res, _$FamilyIiapImpl>
    implements _$$FamilyIiapImplCopyWith<$Res> {
  __$$FamilyIiapImplCopyWithImpl(
      _$FamilyIiapImpl _value, $Res Function(_$FamilyIiapImpl) _then)
      : super(_value, _then);

  /// Create a copy of FamilyIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? idOrder = freezed,
    Object? state = freezed,
  }) {
    return _then(_$FamilyIiapImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      idOrder: freezed == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FamilyIiapImpl implements _FamilyIiap {
  _$FamilyIiapImpl(
      {@JsonKey(name: 'id_familia') required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'id_orden') this.idOrder,
      @JsonKey(name: 'ch_estado') this.state});

  factory _$FamilyIiapImpl.fromJson(Map<String, dynamic> json) =>
      _$$FamilyIiapImplFromJson(json);

  @override
  @JsonKey(name: 'id_familia')
  final int id;
  @override
  @JsonKey(name: 'vc_nombre')
  final String? name;
  @override
  @JsonKey(name: 'id_orden')
  final int? idOrder;
  @override
  @JsonKey(name: 'ch_estado')
  final String? state;

  @override
  String toString() {
    return 'FamilyIiap(id: $id, name: $name, idOrder: $idOrder, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FamilyIiapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, idOrder, state);

  /// Create a copy of FamilyIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FamilyIiapImplCopyWith<_$FamilyIiapImpl> get copyWith =>
      __$$FamilyIiapImplCopyWithImpl<_$FamilyIiapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FamilyIiapImplToJson(
      this,
    );
  }
}

abstract class _FamilyIiap implements FamilyIiap {
  factory _FamilyIiap(
      {@JsonKey(name: 'id_familia') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name,
      @JsonKey(name: 'id_orden') final int? idOrder,
      @JsonKey(name: 'ch_estado') final String? state}) = _$FamilyIiapImpl;

  factory _FamilyIiap.fromJson(Map<String, dynamic> json) =
      _$FamilyIiapImpl.fromJson;

  @override
  @JsonKey(name: 'id_familia')
  int get id;
  @override
  @JsonKey(name: 'vc_nombre')
  String? get name;
  @override
  @JsonKey(name: 'id_orden')
  int? get idOrder;
  @override
  @JsonKey(name: 'ch_estado')
  String? get state;

  /// Create a copy of FamilyIiap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FamilyIiapImplCopyWith<_$FamilyIiapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
