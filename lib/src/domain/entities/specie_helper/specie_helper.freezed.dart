// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specie_helper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpecieHelper _$SpecieHelperFromJson(Map<String, dynamic> json) {
  return _SpecieHelper.fromJson(json);
}

/// @nodoc
mixin _$SpecieHelper {
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecieHelperCopyWith<SpecieHelper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecieHelperCopyWith<$Res> {
  factory $SpecieHelperCopyWith(
          SpecieHelper value, $Res Function(SpecieHelper) then) =
      _$SpecieHelperCopyWithImpl<$Res, SpecieHelper>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$SpecieHelperCopyWithImpl<$Res, $Val extends SpecieHelper>
    implements $SpecieHelperCopyWith<$Res> {
  _$SpecieHelperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecieHelperImplCopyWith<$Res>
    implements $SpecieHelperCopyWith<$Res> {
  factory _$$SpecieHelperImplCopyWith(
          _$SpecieHelperImpl value, $Res Function(_$SpecieHelperImpl) then) =
      __$$SpecieHelperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$SpecieHelperImplCopyWithImpl<$Res>
    extends _$SpecieHelperCopyWithImpl<$Res, _$SpecieHelperImpl>
    implements _$$SpecieHelperImplCopyWith<$Res> {
  __$$SpecieHelperImplCopyWithImpl(
      _$SpecieHelperImpl _value, $Res Function(_$SpecieHelperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$SpecieHelperImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecieHelperImpl implements _SpecieHelper {
  _$SpecieHelperImpl({required this.id});

  factory _$SpecieHelperImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecieHelperImplFromJson(json);

  @override
  final int id;

  @override
  String toString() {
    return 'SpecieHelper(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecieHelperImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecieHelperImplCopyWith<_$SpecieHelperImpl> get copyWith =>
      __$$SpecieHelperImplCopyWithImpl<_$SpecieHelperImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecieHelperImplToJson(
      this,
    );
  }
}

abstract class _SpecieHelper implements SpecieHelper {
  factory _SpecieHelper({required final int id}) = _$SpecieHelperImpl;

  factory _SpecieHelper.fromJson(Map<String, dynamic> json) =
      _$SpecieHelperImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$SpecieHelperImplCopyWith<_$SpecieHelperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
