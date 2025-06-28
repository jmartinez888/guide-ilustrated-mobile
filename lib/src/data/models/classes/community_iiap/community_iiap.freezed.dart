// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_iiap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommunityIiap _$CommunityIiapFromJson(Map<String, dynamic> json) {
  return _CommunityIiap.fromJson(json);
}

/// @nodoc
mixin _$CommunityIiap {
  @JsonKey(name: 'id_pueblo_indigena')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'te_descripcion')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'de_longitud')
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'de_latitud')
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'ch_estado')
  String? get state => throw _privateConstructorUsedError;

  /// Serializes this CommunityIiap to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommunityIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityIiapCopyWith<CommunityIiap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityIiapCopyWith<$Res> {
  factory $CommunityIiapCopyWith(
          CommunityIiap value, $Res Function(CommunityIiap) then) =
      _$CommunityIiapCopyWithImpl<$Res, CommunityIiap>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_pueblo_indigena') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'te_descripcion') String? description,
      @JsonKey(name: 'de_longitud') double? longitude,
      @JsonKey(name: 'de_latitud') double? latitude,
      @JsonKey(name: 'vc_image') String? image,
      @JsonKey(name: 'ch_estado') String? state});
}

/// @nodoc
class _$CommunityIiapCopyWithImpl<$Res, $Val extends CommunityIiap>
    implements $CommunityIiapCopyWith<$Res> {
  _$CommunityIiapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
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
abstract class _$$CommunityIiapImplCopyWith<$Res>
    implements $CommunityIiapCopyWith<$Res> {
  factory _$$CommunityIiapImplCopyWith(
          _$CommunityIiapImpl value, $Res Function(_$CommunityIiapImpl) then) =
      __$$CommunityIiapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_pueblo_indigena') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'te_descripcion') String? description,
      @JsonKey(name: 'de_longitud') double? longitude,
      @JsonKey(name: 'de_latitud') double? latitude,
      @JsonKey(name: 'vc_image') String? image,
      @JsonKey(name: 'ch_estado') String? state});
}

/// @nodoc
class __$$CommunityIiapImplCopyWithImpl<$Res>
    extends _$CommunityIiapCopyWithImpl<$Res, _$CommunityIiapImpl>
    implements _$$CommunityIiapImplCopyWith<$Res> {
  __$$CommunityIiapImplCopyWithImpl(
      _$CommunityIiapImpl _value, $Res Function(_$CommunityIiapImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? image = freezed,
    Object? state = freezed,
  }) {
    return _then(_$CommunityIiapImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
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
class _$CommunityIiapImpl implements _CommunityIiap {
  _$CommunityIiapImpl(
      {@JsonKey(name: 'id_pueblo_indigena') required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'te_descripcion') this.description,
      @JsonKey(name: 'de_longitud') this.longitude,
      @JsonKey(name: 'de_latitud') this.latitude,
      @JsonKey(name: 'vc_image') this.image,
      @JsonKey(name: 'ch_estado') this.state});

  factory _$CommunityIiapImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityIiapImplFromJson(json);

  @override
  @JsonKey(name: 'id_pueblo_indigena')
  final int id;
  @override
  @JsonKey(name: 'vc_nombre')
  final String? name;
  @override
  @JsonKey(name: 'te_descripcion')
  final String? description;
  @override
  @JsonKey(name: 'de_longitud')
  final double? longitude;
  @override
  @JsonKey(name: 'de_latitud')
  final double? latitude;
  @override
  @JsonKey(name: 'vc_image')
  final String? image;
  @override
  @JsonKey(name: 'ch_estado')
  final String? state;

  @override
  String toString() {
    return 'CommunityIiap(id: $id, name: $name, description: $description, longitude: $longitude, latitude: $latitude, image: $image, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityIiapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, longitude, latitude, image, state);

  /// Create a copy of CommunityIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityIiapImplCopyWith<_$CommunityIiapImpl> get copyWith =>
      __$$CommunityIiapImplCopyWithImpl<_$CommunityIiapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityIiapImplToJson(
      this,
    );
  }
}

abstract class _CommunityIiap implements CommunityIiap {
  factory _CommunityIiap(
      {@JsonKey(name: 'id_pueblo_indigena') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name,
      @JsonKey(name: 'te_descripcion') final String? description,
      @JsonKey(name: 'de_longitud') final double? longitude,
      @JsonKey(name: 'de_latitud') final double? latitude,
      @JsonKey(name: 'vc_image') final String? image,
      @JsonKey(name: 'ch_estado') final String? state}) = _$CommunityIiapImpl;

  factory _CommunityIiap.fromJson(Map<String, dynamic> json) =
      _$CommunityIiapImpl.fromJson;

  @override
  @JsonKey(name: 'id_pueblo_indigena')
  int get id;
  @override
  @JsonKey(name: 'vc_nombre')
  String? get name;
  @override
  @JsonKey(name: 'te_descripcion')
  String? get description;
  @override
  @JsonKey(name: 'de_longitud')
  double? get longitude;
  @override
  @JsonKey(name: 'de_latitud')
  double? get latitude;
  @override
  @JsonKey(name: 'vc_image')
  String? get image;
  @override
  @JsonKey(name: 'ch_estado')
  String? get state;

  /// Create a copy of CommunityIiap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityIiapImplCopyWith<_$CommunityIiapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
