// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_of_conservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StateOfConservation _$StateOfConservationFromJson(Map<String, dynamic> json) {
  return _StateOfConservation.fromJson(json);
}

/// @nodoc
mixin _$StateOfConservation {
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateOfConservationCopyWith<StateOfConservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateOfConservationCopyWith<$Res> {
  factory $StateOfConservationCopyWith(
          StateOfConservation value, $Res Function(StateOfConservation) then) =
      _$StateOfConservationCopyWithImpl<$Res, StateOfConservation>;
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
class _$StateOfConservationCopyWithImpl<$Res, $Val extends StateOfConservation>
    implements $StateOfConservationCopyWith<$Res> {
  _$StateOfConservationCopyWithImpl(this._value, this._then);

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
abstract class _$$StateOfConservationImplCopyWith<$Res>
    implements $StateOfConservationCopyWith<$Res> {
  factory _$$StateOfConservationImplCopyWith(_$StateOfConservationImpl value,
          $Res Function(_$StateOfConservationImpl) then) =
      __$$StateOfConservationImplCopyWithImpl<$Res>;
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
class __$$StateOfConservationImplCopyWithImpl<$Res>
    extends _$StateOfConservationCopyWithImpl<$Res, _$StateOfConservationImpl>
    implements _$$StateOfConservationImplCopyWith<$Res> {
  __$$StateOfConservationImplCopyWithImpl(_$StateOfConservationImpl _value,
      $Res Function(_$StateOfConservationImpl) _then)
      : super(_value, _then);

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
    return _then(_$StateOfConservationImpl(
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
class _$StateOfConservationImpl implements _StateOfConservation {
  _$StateOfConservationImpl(
      {@JsonKey(name: 'id_estado', readValue: readIdValue) required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'te_descripcion') this.description,
      @JsonKey(name: 'iniciales_estado', readValue: readInitStateValue)
      this.initState,
      @JsonKey(name: 'institucion', readValue: readInstitutionValue)
      this.institution,
      @JsonKey(name: 'imagen_estado', readValue: readImageValue) this.image,
      @JsonKey(name: 'estado', readValue: readStateValue) this.state});

  factory _$StateOfConservationImpl.fromJson(Map<String, dynamic> json) =>
      _$$StateOfConservationImplFromJson(json);

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
    return 'StateOfConservation(id: $id, name: $name, description: $description, initState: $initState, institution: $institution, image: $image, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateOfConservationImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, initState, institution, image, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateOfConservationImplCopyWith<_$StateOfConservationImpl> get copyWith =>
      __$$StateOfConservationImplCopyWithImpl<_$StateOfConservationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StateOfConservationImplToJson(
      this,
    );
  }
}

abstract class _StateOfConservation implements StateOfConservation {
  factory _StateOfConservation(
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
      final String? state}) = _$StateOfConservationImpl;

  factory _StateOfConservation.fromJson(Map<String, dynamic> json) =
      _$StateOfConservationImpl.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$$StateOfConservationImplCopyWith<_$StateOfConservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
