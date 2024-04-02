// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phylum_iiap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhylumIiap _$PhylumIiapFromJson(Map<String, dynamic> json) {
  return _PhylumIiap.fromJson(json);
}

/// @nodoc
mixin _$PhylumIiap {
  @JsonKey(name: 'id_filo')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhylumIiapCopyWith<PhylumIiap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhylumIiapCopyWith<$Res> {
  factory $PhylumIiapCopyWith(
          PhylumIiap value, $Res Function(PhylumIiap) then) =
      _$PhylumIiapCopyWithImpl<$Res, PhylumIiap>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_filo') int id,
      @JsonKey(name: 'vc_nombre') String? name});
}

/// @nodoc
class _$PhylumIiapCopyWithImpl<$Res, $Val extends PhylumIiap>
    implements $PhylumIiapCopyWith<$Res> {
  _$PhylumIiapCopyWithImpl(this._value, this._then);

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
abstract class _$$PhylumIiapImplCopyWith<$Res>
    implements $PhylumIiapCopyWith<$Res> {
  factory _$$PhylumIiapImplCopyWith(
          _$PhylumIiapImpl value, $Res Function(_$PhylumIiapImpl) then) =
      __$$PhylumIiapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_filo') int id,
      @JsonKey(name: 'vc_nombre') String? name});
}

/// @nodoc
class __$$PhylumIiapImplCopyWithImpl<$Res>
    extends _$PhylumIiapCopyWithImpl<$Res, _$PhylumIiapImpl>
    implements _$$PhylumIiapImplCopyWith<$Res> {
  __$$PhylumIiapImplCopyWithImpl(
      _$PhylumIiapImpl _value, $Res Function(_$PhylumIiapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_$PhylumIiapImpl(
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
class _$PhylumIiapImpl implements _PhylumIiap {
  _$PhylumIiapImpl(
      {@JsonKey(name: 'id_filo') required this.id,
      @JsonKey(name: 'vc_nombre') this.name});

  factory _$PhylumIiapImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhylumIiapImplFromJson(json);

  @override
  @JsonKey(name: 'id_filo')
  final int id;
  @override
  @JsonKey(name: 'vc_nombre')
  final String? name;

  @override
  String toString() {
    return 'PhylumIiap(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhylumIiapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhylumIiapImplCopyWith<_$PhylumIiapImpl> get copyWith =>
      __$$PhylumIiapImplCopyWithImpl<_$PhylumIiapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhylumIiapImplToJson(
      this,
    );
  }
}

abstract class _PhylumIiap implements PhylumIiap {
  factory _PhylumIiap(
      {@JsonKey(name: 'id_filo') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name}) = _$PhylumIiapImpl;

  factory _PhylumIiap.fromJson(Map<String, dynamic> json) =
      _$PhylumIiapImpl.fromJson;

  @override
  @JsonKey(name: 'id_filo')
  int get id;
  @override
  @JsonKey(name: 'vc_nombre')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$PhylumIiapImplCopyWith<_$PhylumIiapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
