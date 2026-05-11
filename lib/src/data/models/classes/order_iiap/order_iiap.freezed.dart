// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_iiap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderIiap _$OrderIiapFromJson(Map<String, dynamic> json) {
  return _OrderIiap.fromJson(json);
}

/// @nodoc
mixin _$OrderIiap {
  @JsonKey(name: 'id_orden')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_clase')
  int? get idClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'ch_estado')
  String? get state => throw _privateConstructorUsedError;

  /// Serializes this OrderIiap to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderIiapCopyWith<OrderIiap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderIiapCopyWith<$Res> {
  factory $OrderIiapCopyWith(OrderIiap value, $Res Function(OrderIiap) then) =
      _$OrderIiapCopyWithImpl<$Res, OrderIiap>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_orden') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'id_clase') int? idClass,
      @JsonKey(name: 'ch_estado') String? state});
}

/// @nodoc
class _$OrderIiapCopyWithImpl<$Res, $Val extends OrderIiap>
    implements $OrderIiapCopyWith<$Res> {
  _$OrderIiapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? idClass = freezed,
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
      idClass: freezed == idClass
          ? _value.idClass
          : idClass // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderIiapImplCopyWith<$Res>
    implements $OrderIiapCopyWith<$Res> {
  factory _$$OrderIiapImplCopyWith(
          _$OrderIiapImpl value, $Res Function(_$OrderIiapImpl) then) =
      __$$OrderIiapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_orden') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'id_clase') int? idClass,
      @JsonKey(name: 'ch_estado') String? state});
}

/// @nodoc
class __$$OrderIiapImplCopyWithImpl<$Res>
    extends _$OrderIiapCopyWithImpl<$Res, _$OrderIiapImpl>
    implements _$$OrderIiapImplCopyWith<$Res> {
  __$$OrderIiapImplCopyWithImpl(
      _$OrderIiapImpl _value, $Res Function(_$OrderIiapImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? idClass = freezed,
    Object? state = freezed,
  }) {
    return _then(_$OrderIiapImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      idClass: freezed == idClass
          ? _value.idClass
          : idClass // ignore: cast_nullable_to_non_nullable
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
class _$OrderIiapImpl implements _OrderIiap {
  _$OrderIiapImpl(
      {@JsonKey(name: 'id_orden') required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'id_clase') this.idClass,
      @JsonKey(name: 'ch_estado') this.state});

  factory _$OrderIiapImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderIiapImplFromJson(json);

  @override
  @JsonKey(name: 'id_orden')
  final int id;
  @override
  @JsonKey(name: 'vc_nombre')
  final String? name;
  @override
  @JsonKey(name: 'id_clase')
  final int? idClass;
  @override
  @JsonKey(name: 'ch_estado')
  final String? state;

  @override
  String toString() {
    return 'OrderIiap(id: $id, name: $name, idClass: $idClass, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderIiapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.idClass, idClass) || other.idClass == idClass) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, idClass, state);

  /// Create a copy of OrderIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderIiapImplCopyWith<_$OrderIiapImpl> get copyWith =>
      __$$OrderIiapImplCopyWithImpl<_$OrderIiapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderIiapImplToJson(
      this,
    );
  }
}

abstract class _OrderIiap implements OrderIiap {
  factory _OrderIiap(
      {@JsonKey(name: 'id_orden') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name,
      @JsonKey(name: 'id_clase') final int? idClass,
      @JsonKey(name: 'ch_estado') final String? state}) = _$OrderIiapImpl;

  factory _OrderIiap.fromJson(Map<String, dynamic> json) =
      _$OrderIiapImpl.fromJson;

  @override
  @JsonKey(name: 'id_orden')
  int get id;
  @override
  @JsonKey(name: 'vc_nombre')
  String? get name;
  @override
  @JsonKey(name: 'id_clase')
  int? get idClass;
  @override
  @JsonKey(name: 'ch_estado')
  String? get state;

  /// Create a copy of OrderIiap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderIiapImplCopyWith<_$OrderIiapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
