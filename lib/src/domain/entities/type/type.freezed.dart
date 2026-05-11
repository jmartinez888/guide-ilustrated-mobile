// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TypeC _$TypeCFromJson(Map<String, dynamic> json) {
  return _TypeC.fromJson(json);
}

/// @nodoc
mixin _$TypeC {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'primary_color')
  String? get primaryColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'secondary_color')
  String? get secondaryColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String? get state => throw _privateConstructorUsedError;

  /// Serializes this TypeC to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypeC
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypeCCopyWith<TypeC> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeCCopyWith<$Res> {
  factory $TypeCCopyWith(TypeC value, $Res Function(TypeC) then) =
      _$TypeCCopyWithImpl<$Res, TypeC>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'primary_color') String? primaryColor,
      @JsonKey(name: 'secondary_color') String? secondaryColor,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'state') String? state});
}

/// @nodoc
class _$TypeCCopyWithImpl<$Res, $Val extends TypeC>
    implements $TypeCCopyWith<$Res> {
  _$TypeCCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeC
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? primaryColor = freezed,
    Object? secondaryColor = freezed,
    Object? image = freezed,
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
      primaryColor: freezed == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryColor: freezed == secondaryColor
          ? _value.secondaryColor
          : secondaryColor // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeCImplCopyWith<$Res> implements $TypeCCopyWith<$Res> {
  factory _$$TypeCImplCopyWith(
          _$TypeCImpl value, $Res Function(_$TypeCImpl) then) =
      __$$TypeCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'primary_color') String? primaryColor,
      @JsonKey(name: 'secondary_color') String? secondaryColor,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'state') String? state});
}

/// @nodoc
class __$$TypeCImplCopyWithImpl<$Res>
    extends _$TypeCCopyWithImpl<$Res, _$TypeCImpl>
    implements _$$TypeCImplCopyWith<$Res> {
  __$$TypeCImplCopyWithImpl(
      _$TypeCImpl _value, $Res Function(_$TypeCImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypeC
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? primaryColor = freezed,
    Object? secondaryColor = freezed,
    Object? image = freezed,
    Object? state = freezed,
  }) {
    return _then(_$TypeCImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryColor: freezed == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryColor: freezed == secondaryColor
          ? _value.secondaryColor
          : secondaryColor // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeCImpl implements _TypeC {
  _$TypeCImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'primary_color') this.primaryColor,
      @JsonKey(name: 'secondary_color') this.secondaryColor,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'state') this.state});

  factory _$TypeCImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeCImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'primary_color')
  final String? primaryColor;
  @override
  @JsonKey(name: 'secondary_color')
  final String? secondaryColor;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'state')
  final String? state;

  @override
  String toString() {
    return 'TypeC(id: $id, name: $name, primaryColor: $primaryColor, secondaryColor: $secondaryColor, image: $image, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeCImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.primaryColor, primaryColor) ||
                other.primaryColor == primaryColor) &&
            (identical(other.secondaryColor, secondaryColor) ||
                other.secondaryColor == secondaryColor) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, primaryColor, secondaryColor, image, state);

  /// Create a copy of TypeC
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeCImplCopyWith<_$TypeCImpl> get copyWith =>
      __$$TypeCImplCopyWithImpl<_$TypeCImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeCImplToJson(
      this,
    );
  }
}

abstract class _TypeC implements TypeC {
  factory _TypeC(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'primary_color') final String? primaryColor,
      @JsonKey(name: 'secondary_color') final String? secondaryColor,
      @JsonKey(name: 'image') final String? image,
      @JsonKey(name: 'state') final String? state}) = _$TypeCImpl;

  factory _TypeC.fromJson(Map<String, dynamic> json) = _$TypeCImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'primary_color')
  String? get primaryColor;
  @override
  @JsonKey(name: 'secondary_color')
  String? get secondaryColor;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'state')
  String? get state;

  /// Create a copy of TypeC
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeCImplCopyWith<_$TypeCImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
