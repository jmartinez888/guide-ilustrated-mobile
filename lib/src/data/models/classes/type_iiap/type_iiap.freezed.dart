// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_iiap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TypeIiap _$TypeIiapFromJson(Map<String, dynamic> json) {
  return _TypeIiap.fromJson(json);
}

/// @nodoc
mixin _$TypeIiap {
  @JsonKey(name: 'id_taxa')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_color_primario')
  String? get primaryColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_color_secundario')
  String? get secondaryColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_imagen')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'estado')
  String? get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeIiapCopyWith<TypeIiap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeIiapCopyWith<$Res> {
  factory $TypeIiapCopyWith(TypeIiap value, $Res Function(TypeIiap) then) =
      _$TypeIiapCopyWithImpl<$Res, TypeIiap>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_taxa') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'vc_color_primario') String? primaryColor,
      @JsonKey(name: 'vc_color_secundario') String? secondaryColor,
      @JsonKey(name: 'vc_imagen') String? image,
      @JsonKey(name: 'estado') String? state});
}

/// @nodoc
class _$TypeIiapCopyWithImpl<$Res, $Val extends TypeIiap>
    implements $TypeIiapCopyWith<$Res> {
  _$TypeIiapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$TypeIiapImplCopyWith<$Res>
    implements $TypeIiapCopyWith<$Res> {
  factory _$$TypeIiapImplCopyWith(
          _$TypeIiapImpl value, $Res Function(_$TypeIiapImpl) then) =
      __$$TypeIiapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_taxa') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'vc_color_primario') String? primaryColor,
      @JsonKey(name: 'vc_color_secundario') String? secondaryColor,
      @JsonKey(name: 'vc_imagen') String? image,
      @JsonKey(name: 'estado') String? state});
}

/// @nodoc
class __$$TypeIiapImplCopyWithImpl<$Res>
    extends _$TypeIiapCopyWithImpl<$Res, _$TypeIiapImpl>
    implements _$$TypeIiapImplCopyWith<$Res> {
  __$$TypeIiapImplCopyWithImpl(
      _$TypeIiapImpl _value, $Res Function(_$TypeIiapImpl) _then)
      : super(_value, _then);

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
    return _then(_$TypeIiapImpl(
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
class _$TypeIiapImpl implements _TypeIiap {
  _$TypeIiapImpl(
      {@JsonKey(name: 'id_taxa') required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'vc_color_primario') this.primaryColor,
      @JsonKey(name: 'vc_color_secundario') this.secondaryColor,
      @JsonKey(name: 'vc_imagen') this.image,
      @JsonKey(name: 'estado') this.state});

  factory _$TypeIiapImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeIiapImplFromJson(json);

  @override
  @JsonKey(name: 'id_taxa')
  final int id;
  @override
  @JsonKey(name: 'vc_nombre')
  final String? name;
  @override
  @JsonKey(name: 'vc_color_primario')
  final String? primaryColor;
  @override
  @JsonKey(name: 'vc_color_secundario')
  final String? secondaryColor;
  @override
  @JsonKey(name: 'vc_imagen')
  final String? image;
  @override
  @JsonKey(name: 'estado')
  final String? state;

  @override
  String toString() {
    return 'TypeIiap(id: $id, name: $name, primaryColor: $primaryColor, secondaryColor: $secondaryColor, image: $image, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeIiapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.primaryColor, primaryColor) ||
                other.primaryColor == primaryColor) &&
            (identical(other.secondaryColor, secondaryColor) ||
                other.secondaryColor == secondaryColor) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, primaryColor, secondaryColor, image, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeIiapImplCopyWith<_$TypeIiapImpl> get copyWith =>
      __$$TypeIiapImplCopyWithImpl<_$TypeIiapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeIiapImplToJson(
      this,
    );
  }
}

abstract class _TypeIiap implements TypeIiap {
  factory _TypeIiap(
      {@JsonKey(name: 'id_taxa') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name,
      @JsonKey(name: 'vc_color_primario') final String? primaryColor,
      @JsonKey(name: 'vc_color_secundario') final String? secondaryColor,
      @JsonKey(name: 'vc_imagen') final String? image,
      @JsonKey(name: 'estado') final String? state}) = _$TypeIiapImpl;

  factory _TypeIiap.fromJson(Map<String, dynamic> json) =
      _$TypeIiapImpl.fromJson;

  @override
  @JsonKey(name: 'id_taxa')
  int get id;
  @override
  @JsonKey(name: 'vc_nombre')
  String? get name;
  @override
  @JsonKey(name: 'vc_color_primario')
  String? get primaryColor;
  @override
  @JsonKey(name: 'vc_color_secundario')
  String? get secondaryColor;
  @override
  @JsonKey(name: 'vc_imagen')
  String? get image;
  @override
  @JsonKey(name: 'estado')
  String? get state;
  @override
  @JsonKey(ignore: true)
  _$$TypeIiapImplCopyWith<_$TypeIiapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
