// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kingdom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Kingdom _$KingdomFromJson(Map<String, dynamic> json) {
  return _Kingdom.fromJson(json);
}

/// @nodoc
mixin _$Kingdom {
  @JsonKey(name: 'id_reino')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KingdomCopyWith<Kingdom> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KingdomCopyWith<$Res> {
  factory $KingdomCopyWith(Kingdom value, $Res Function(Kingdom) then) =
      _$KingdomCopyWithImpl<$Res, Kingdom>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_reino') int id,
      @JsonKey(name: 'vc_nombre') String? name});
}

/// @nodoc
class _$KingdomCopyWithImpl<$Res, $Val extends Kingdom>
    implements $KingdomCopyWith<$Res> {
  _$KingdomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$KingdomImplCopyWith<$Res> implements $KingdomCopyWith<$Res> {
  factory _$$KingdomImplCopyWith(
          _$KingdomImpl value, $Res Function(_$KingdomImpl) then) =
      __$$KingdomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_reino') int id,
      @JsonKey(name: 'vc_nombre') String? name});
}

/// @nodoc
class __$$KingdomImplCopyWithImpl<$Res>
    extends _$KingdomCopyWithImpl<$Res, _$KingdomImpl>
    implements _$$KingdomImplCopyWith<$Res> {
  __$$KingdomImplCopyWithImpl(
      _$KingdomImpl _value, $Res Function(_$KingdomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_$KingdomImpl(
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
class _$KingdomImpl implements _Kingdom {
  _$KingdomImpl(
      {@JsonKey(name: 'id_reino') required this.id,
      @JsonKey(name: 'vc_nombre') this.name});

  factory _$KingdomImpl.fromJson(Map<String, dynamic> json) =>
      _$$KingdomImplFromJson(json);

  @override
  @JsonKey(name: 'id_reino')
  final int id;
  @override
  @JsonKey(name: 'vc_nombre')
  final String? name;

  @override
  String toString() {
    return 'Kingdom(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KingdomImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KingdomImplCopyWith<_$KingdomImpl> get copyWith =>
      __$$KingdomImplCopyWithImpl<_$KingdomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KingdomImplToJson(
      this,
    );
  }
}

abstract class _Kingdom implements Kingdom {
  factory _Kingdom(
      {@JsonKey(name: 'id_reino') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name}) = _$KingdomImpl;

  factory _Kingdom.fromJson(Map<String, dynamic> json) = _$KingdomImpl.fromJson;

  @override
  @JsonKey(name: 'id_reino')
  int get id;
  @override
  @JsonKey(name: 'vc_nombre')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$KingdomImplCopyWith<_$KingdomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
