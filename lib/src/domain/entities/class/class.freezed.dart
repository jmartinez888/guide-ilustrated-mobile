// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClassC _$ClassCFromJson(Map<String, dynamic> json) {
  return _ClassC.fromJson(json);
}

/// @nodoc
mixin _$ClassC {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_phylum')
  int? get idPhylum => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;

  /// Serializes this ClassC to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClassC
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassCCopyWith<ClassC> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassCCopyWith<$Res> {
  factory $ClassCCopyWith(ClassC value, $Res Function(ClassC) then) =
      _$ClassCCopyWithImpl<$Res, ClassC>;
  @useResult
  $Res call(
      {int id,
      String? name,
      @JsonKey(name: 'id_phylum') int? idPhylum,
      String? state});
}

/// @nodoc
class _$ClassCCopyWithImpl<$Res, $Val extends ClassC>
    implements $ClassCCopyWith<$Res> {
  _$ClassCCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassC
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? idPhylum = freezed,
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
      idPhylum: freezed == idPhylum
          ? _value.idPhylum
          : idPhylum // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassCImplCopyWith<$Res> implements $ClassCCopyWith<$Res> {
  factory _$$ClassCImplCopyWith(
          _$ClassCImpl value, $Res Function(_$ClassCImpl) then) =
      __$$ClassCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      @JsonKey(name: 'id_phylum') int? idPhylum,
      String? state});
}

/// @nodoc
class __$$ClassCImplCopyWithImpl<$Res>
    extends _$ClassCCopyWithImpl<$Res, _$ClassCImpl>
    implements _$$ClassCImplCopyWith<$Res> {
  __$$ClassCImplCopyWithImpl(
      _$ClassCImpl _value, $Res Function(_$ClassCImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClassC
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? idPhylum = freezed,
    Object? state = freezed,
  }) {
    return _then(_$ClassCImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      idPhylum: freezed == idPhylum
          ? _value.idPhylum
          : idPhylum // ignore: cast_nullable_to_non_nullable
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
class _$ClassCImpl implements _ClassC {
  _$ClassCImpl(
      {required this.id,
      this.name,
      @JsonKey(name: 'id_phylum') this.idPhylum,
      this.state});

  factory _$ClassCImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassCImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'id_phylum')
  final int? idPhylum;
  @override
  final String? state;

  @override
  String toString() {
    return 'ClassC(id: $id, name: $name, idPhylum: $idPhylum, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassCImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.idPhylum, idPhylum) ||
                other.idPhylum == idPhylum) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, idPhylum, state);

  /// Create a copy of ClassC
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassCImplCopyWith<_$ClassCImpl> get copyWith =>
      __$$ClassCImplCopyWithImpl<_$ClassCImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassCImplToJson(
      this,
    );
  }
}

abstract class _ClassC implements ClassC {
  factory _ClassC(
      {required final int id,
      final String? name,
      @JsonKey(name: 'id_phylum') final int? idPhylum,
      final String? state}) = _$ClassCImpl;

  factory _ClassC.fromJson(Map<String, dynamic> json) = _$ClassCImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'id_phylum')
  int? get idPhylum;
  @override
  String? get state;

  /// Create a copy of ClassC
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassCImplCopyWith<_$ClassCImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
