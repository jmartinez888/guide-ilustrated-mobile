// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Community _$CommunityFromJson(Map<String, dynamic> json) {
  return _Community.fromJson(json);
}

/// @nodoc
mixin _$Community {
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunityCopyWith<Community> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityCopyWith<$Res> {
  factory $CommunityCopyWith(Community value, $Res Function(Community) then) =
      _$CommunityCopyWithImpl<$Res, Community>;
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
class _$CommunityCopyWithImpl<$Res, $Val extends Community>
    implements $CommunityCopyWith<$Res> {
  _$CommunityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$CommunityImplCopyWith<$Res>
    implements $CommunityCopyWith<$Res> {
  factory _$$CommunityImplCopyWith(
          _$CommunityImpl value, $Res Function(_$CommunityImpl) then) =
      __$$CommunityImplCopyWithImpl<$Res>;
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
class __$$CommunityImplCopyWithImpl<$Res>
    extends _$CommunityCopyWithImpl<$Res, _$CommunityImpl>
    implements _$$CommunityImplCopyWith<$Res> {
  __$$CommunityImplCopyWithImpl(
      _$CommunityImpl _value, $Res Function(_$CommunityImpl) _then)
      : super(_value, _then);

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
    return _then(_$CommunityImpl(
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
class _$CommunityImpl implements _Community {
  _$CommunityImpl(
      {@JsonKey(name: 'id_pueblo_indigena') required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'te_descripcion') this.description,
      @JsonKey(name: 'de_longitud') this.longitude,
      @JsonKey(name: 'de_latitud') this.latitude,
      @JsonKey(name: 'vc_image') this.image,
      @JsonKey(name: 'ch_estado') this.state});

  factory _$CommunityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityImplFromJson(json);

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
    return 'Community(id: $id, name: $name, description: $description, longitude: $longitude, latitude: $latitude, image: $image, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, longitude, latitude, image, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityImplCopyWith<_$CommunityImpl> get copyWith =>
      __$$CommunityImplCopyWithImpl<_$CommunityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityImplToJson(
      this,
    );
  }
}

abstract class _Community implements Community {
  factory _Community(
      {@JsonKey(name: 'id_pueblo_indigena') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name,
      @JsonKey(name: 'te_descripcion') final String? description,
      @JsonKey(name: 'de_longitud') final double? longitude,
      @JsonKey(name: 'de_latitud') final double? latitude,
      @JsonKey(name: 'vc_image') final String? image,
      @JsonKey(name: 'ch_estado') final String? state}) = _$CommunityImpl;

  factory _Community.fromJson(Map<String, dynamic> json) =
      _$CommunityImpl.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$$CommunityImplCopyWith<_$CommunityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
