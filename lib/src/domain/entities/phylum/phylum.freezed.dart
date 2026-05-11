// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phylum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Phylum _$PhylumFromJson(Map<String, dynamic> json) {
  return _Phylum.fromJson(json);
}

/// @nodoc
mixin _$Phylum {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this Phylum to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Phylum
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhylumCopyWith<Phylum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhylumCopyWith<$Res> {
  factory $PhylumCopyWith(Phylum value, $Res Function(Phylum) then) =
      _$PhylumCopyWithImpl<$Res, Phylum>;
  @useResult
  $Res call({int id, String? name});
}

/// @nodoc
class _$PhylumCopyWithImpl<$Res, $Val extends Phylum>
    implements $PhylumCopyWith<$Res> {
  _$PhylumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Phylum
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
abstract class _$$PhylumImplCopyWith<$Res> implements $PhylumCopyWith<$Res> {
  factory _$$PhylumImplCopyWith(
          _$PhylumImpl value, $Res Function(_$PhylumImpl) then) =
      __$$PhylumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? name});
}

/// @nodoc
class __$$PhylumImplCopyWithImpl<$Res>
    extends _$PhylumCopyWithImpl<$Res, _$PhylumImpl>
    implements _$$PhylumImplCopyWith<$Res> {
  __$$PhylumImplCopyWithImpl(
      _$PhylumImpl _value, $Res Function(_$PhylumImpl) _then)
      : super(_value, _then);

  /// Create a copy of Phylum
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_$PhylumImpl(
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
class _$PhylumImpl implements _Phylum {
  _$PhylumImpl({required this.id, this.name});

  factory _$PhylumImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhylumImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;

  @override
  String toString() {
    return 'Phylum(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhylumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of Phylum
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhylumImplCopyWith<_$PhylumImpl> get copyWith =>
      __$$PhylumImplCopyWithImpl<_$PhylumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhylumImplToJson(
      this,
    );
  }
}

abstract class _Phylum implements Phylum {
  factory _Phylum({required final int id, final String? name}) = _$PhylumImpl;

  factory _Phylum.fromJson(Map<String, dynamic> json) = _$PhylumImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;

  /// Create a copy of Phylum
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhylumImplCopyWith<_$PhylumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
