// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderC _$OrderCFromJson(Map<String, dynamic> json) {
  return _OrderC.fromJson(json);
}

/// @nodoc
mixin _$OrderC {
  @JsonKey(name: 'id_orden')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_clase')
  int? get classId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ch_estado')
  String? get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCCopyWith<OrderC> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCCopyWith<$Res> {
  factory $OrderCCopyWith(OrderC value, $Res Function(OrderC) then) =
      _$OrderCCopyWithImpl<$Res, OrderC>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_orden') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'id_clase') int? classId,
      @JsonKey(name: 'ch_estado') String? state});
}

/// @nodoc
class _$OrderCCopyWithImpl<$Res, $Val extends OrderC>
    implements $OrderCCopyWith<$Res> {
  _$OrderCCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? classId = freezed,
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
      classId: freezed == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderCImplCopyWith<$Res> implements $OrderCCopyWith<$Res> {
  factory _$$OrderCImplCopyWith(
          _$OrderCImpl value, $Res Function(_$OrderCImpl) then) =
      __$$OrderCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_orden') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'id_clase') int? classId,
      @JsonKey(name: 'ch_estado') String? state});
}

/// @nodoc
class __$$OrderCImplCopyWithImpl<$Res>
    extends _$OrderCCopyWithImpl<$Res, _$OrderCImpl>
    implements _$$OrderCImplCopyWith<$Res> {
  __$$OrderCImplCopyWithImpl(
      _$OrderCImpl _value, $Res Function(_$OrderCImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? classId = freezed,
    Object? state = freezed,
  }) {
    return _then(_$OrderCImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      classId: freezed == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
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
class _$OrderCImpl implements _OrderC {
  _$OrderCImpl(
      {@JsonKey(name: 'id_orden') required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'id_clase') this.classId,
      @JsonKey(name: 'ch_estado') this.state});

  factory _$OrderCImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCImplFromJson(json);

  @override
  @JsonKey(name: 'id_orden')
  final int id;
  @override
  @JsonKey(name: 'vc_nombre')
  final String? name;
  @override
  @JsonKey(name: 'id_clase')
  final int? classId;
  @override
  @JsonKey(name: 'ch_estado')
  final String? state;

  @override
  String toString() {
    return 'OrderC(id: $id, name: $name, classId: $classId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.classId, classId) || other.classId == classId) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, classId, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCImplCopyWith<_$OrderCImpl> get copyWith =>
      __$$OrderCImplCopyWithImpl<_$OrderCImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCImplToJson(
      this,
    );
  }
}

abstract class _OrderC implements OrderC {
  factory _OrderC(
      {@JsonKey(name: 'id_orden') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name,
      @JsonKey(name: 'id_clase') final int? classId,
      @JsonKey(name: 'ch_estado') final String? state}) = _$OrderCImpl;

  factory _OrderC.fromJson(Map<String, dynamic> json) = _$OrderCImpl.fromJson;

  @override
  @JsonKey(name: 'id_orden')
  int get id;
  @override
  @JsonKey(name: 'vc_nombre')
  String? get name;
  @override
  @JsonKey(name: 'id_clase')
  int? get classId;
  @override
  @JsonKey(name: 'ch_estado')
  String? get state;
  @override
  @JsonKey(ignore: true)
  _$$OrderCImplCopyWith<_$OrderCImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
