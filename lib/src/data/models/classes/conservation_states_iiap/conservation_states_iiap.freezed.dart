// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conservation_states_iiap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConservationStatesIiap _$ConservationStatesIiapFromJson(
    Map<String, dynamic> json) {
  return _ConservationStatesIiap.fromJson(json);
}

/// @nodoc
mixin _$ConservationStatesIiap {
  @JsonKey(name: 'id_estado', readValue: readIdValue)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'te_descripcion')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'iniciales_estado', readValue: readInitStateValue)
  String? get initState => throw _privateConstructorUsedError;
  @JsonKey(name: 'institucion', readValue: readInstitutionValue)
  String? get institution => throw _privateConstructorUsedError;
  @JsonKey(name: 'imagen_estado', readValue: readImageValue)
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'estado', readValue: readStateValue)
  String? get state => throw _privateConstructorUsedError;

  /// Serializes this ConservationStatesIiap to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConservationStatesIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConservationStatesIiapCopyWith<ConservationStatesIiap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConservationStatesIiapCopyWith<$Res> {
  factory $ConservationStatesIiapCopyWith(ConservationStatesIiap value,
          $Res Function(ConservationStatesIiap) then) =
      _$ConservationStatesIiapCopyWithImpl<$Res, ConservationStatesIiap>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_estado', readValue: readIdValue) int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'te_descripcion') String? description,
      @JsonKey(name: 'iniciales_estado', readValue: readInitStateValue)
      String? initState,
      @JsonKey(name: 'institucion', readValue: readInstitutionValue)
      String? institution,
      @JsonKey(name: 'imagen_estado', readValue: readImageValue) String? image,
      @JsonKey(name: 'estado', readValue: readStateValue) String? state});
}

/// @nodoc
class _$ConservationStatesIiapCopyWithImpl<$Res,
        $Val extends ConservationStatesIiap>
    implements $ConservationStatesIiapCopyWith<$Res> {
  _$ConservationStatesIiapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConservationStatesIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? initState = freezed,
    Object? institution = freezed,
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
      initState: freezed == initState
          ? _value.initState
          : initState // ignore: cast_nullable_to_non_nullable
              as String?,
      institution: freezed == institution
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ConservationStatesIiapImplCopyWith<$Res>
    implements $ConservationStatesIiapCopyWith<$Res> {
  factory _$$ConservationStatesIiapImplCopyWith(
          _$ConservationStatesIiapImpl value,
          $Res Function(_$ConservationStatesIiapImpl) then) =
      __$$ConservationStatesIiapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_estado', readValue: readIdValue) int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'te_descripcion') String? description,
      @JsonKey(name: 'iniciales_estado', readValue: readInitStateValue)
      String? initState,
      @JsonKey(name: 'institucion', readValue: readInstitutionValue)
      String? institution,
      @JsonKey(name: 'imagen_estado', readValue: readImageValue) String? image,
      @JsonKey(name: 'estado', readValue: readStateValue) String? state});
}

/// @nodoc
class __$$ConservationStatesIiapImplCopyWithImpl<$Res>
    extends _$ConservationStatesIiapCopyWithImpl<$Res,
        _$ConservationStatesIiapImpl>
    implements _$$ConservationStatesIiapImplCopyWith<$Res> {
  __$$ConservationStatesIiapImplCopyWithImpl(
      _$ConservationStatesIiapImpl _value,
      $Res Function(_$ConservationStatesIiapImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConservationStatesIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? initState = freezed,
    Object? institution = freezed,
    Object? image = freezed,
    Object? state = freezed,
  }) {
    return _then(_$ConservationStatesIiapImpl(
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
      initState: freezed == initState
          ? _value.initState
          : initState // ignore: cast_nullable_to_non_nullable
              as String?,
      institution: freezed == institution
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
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
class _$ConservationStatesIiapImpl implements _ConservationStatesIiap {
  _$ConservationStatesIiapImpl(
      {@JsonKey(name: 'id_estado', readValue: readIdValue) required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'te_descripcion') this.description,
      @JsonKey(name: 'iniciales_estado', readValue: readInitStateValue)
      this.initState,
      @JsonKey(name: 'institucion', readValue: readInstitutionValue)
      this.institution,
      @JsonKey(name: 'imagen_estado', readValue: readImageValue) this.image,
      @JsonKey(name: 'estado', readValue: readStateValue) this.state});

  factory _$ConservationStatesIiapImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConservationStatesIiapImplFromJson(json);

  @override
  @JsonKey(name: 'id_estado', readValue: readIdValue)
  final int id;
  @override
  @JsonKey(name: 'vc_nombre')
  final String? name;
  @override
  @JsonKey(name: 'te_descripcion')
  final String? description;
  @override
  @JsonKey(name: 'iniciales_estado', readValue: readInitStateValue)
  final String? initState;
  @override
  @JsonKey(name: 'institucion', readValue: readInstitutionValue)
  final String? institution;
  @override
  @JsonKey(name: 'imagen_estado', readValue: readImageValue)
  final String? image;
  @override
  @JsonKey(name: 'estado', readValue: readStateValue)
  final String? state;

  @override
  String toString() {
    return 'ConservationStatesIiap(id: $id, name: $name, description: $description, initState: $initState, institution: $institution, image: $image, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConservationStatesIiapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.initState, initState) ||
                other.initState == initState) &&
            (identical(other.institution, institution) ||
                other.institution == institution) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, initState, institution, image, state);

  /// Create a copy of ConservationStatesIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConservationStatesIiapImplCopyWith<_$ConservationStatesIiapImpl>
      get copyWith => __$$ConservationStatesIiapImplCopyWithImpl<
          _$ConservationStatesIiapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConservationStatesIiapImplToJson(
      this,
    );
  }
}

abstract class _ConservationStatesIiap implements ConservationStatesIiap {
  factory _ConservationStatesIiap(
      {@JsonKey(name: 'id_estado', readValue: readIdValue)
      required final int id,
      @JsonKey(name: 'vc_nombre') final String? name,
      @JsonKey(name: 'te_descripcion') final String? description,
      @JsonKey(name: 'iniciales_estado', readValue: readInitStateValue)
      final String? initState,
      @JsonKey(name: 'institucion', readValue: readInstitutionValue)
      final String? institution,
      @JsonKey(name: 'imagen_estado', readValue: readImageValue)
      final String? image,
      @JsonKey(name: 'estado', readValue: readStateValue)
      final String? state}) = _$ConservationStatesIiapImpl;

  factory _ConservationStatesIiap.fromJson(Map<String, dynamic> json) =
      _$ConservationStatesIiapImpl.fromJson;

  @override
  @JsonKey(name: 'id_estado', readValue: readIdValue)
  int get id;
  @override
  @JsonKey(name: 'vc_nombre')
  String? get name;
  @override
  @JsonKey(name: 'te_descripcion')
  String? get description;
  @override
  @JsonKey(name: 'iniciales_estado', readValue: readInitStateValue)
  String? get initState;
  @override
  @JsonKey(name: 'institucion', readValue: readInstitutionValue)
  String? get institution;
  @override
  @JsonKey(name: 'imagen_estado', readValue: readImageValue)
  String? get image;
  @override
  @JsonKey(name: 'estado', readValue: readStateValue)
  String? get state;

  /// Create a copy of ConservationStatesIiap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConservationStatesIiapImplCopyWith<_$ConservationStatesIiapImpl>
      get copyWith => throw _privateConstructorUsedError;
}
