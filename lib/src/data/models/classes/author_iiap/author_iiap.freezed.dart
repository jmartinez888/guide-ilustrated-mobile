// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author_iiap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthorIiap _$AuthorIiapFromJson(Map<String, dynamic> json) {
  return _AuthorIiap.fromJson(json);
}

/// @nodoc
mixin _$AuthorIiap {
  @JsonKey(name: 'id_autor')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_apellido')
  String? get lastname => throw _privateConstructorUsedError;
  @JsonKey(name: 'biografia_autor', readValue: readBiographyValue)
  String? get biography => throw _privateConstructorUsedError;
  @JsonKey(name: 'ano_nacimiento_autor', readValue: readYearOfBirth)
  String? get yearOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'ano_deceso_autor', readValue: readYearOfDeath)
  String? get yearOfDeath => throw _privateConstructorUsedError;
  @JsonKey(name: 'profesion_autor', readValue: readProfession)
  String? get profession => throw _privateConstructorUsedError;
  @JsonKey(name: 'imagen_autor', readValue: readImage)
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'estado_autor', readValue: readState)
  String? get state => throw _privateConstructorUsedError;
  @SpeciesIiapIntoClassToMap()
  List<SpecieIiap>? get species => throw _privateConstructorUsedError;

  /// Serializes this AuthorIiap to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthorIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorIiapCopyWith<AuthorIiap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorIiapCopyWith<$Res> {
  factory $AuthorIiapCopyWith(
          AuthorIiap value, $Res Function(AuthorIiap) then) =
      _$AuthorIiapCopyWithImpl<$Res, AuthorIiap>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_autor') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'vc_apellido') String? lastname,
      @JsonKey(name: 'biografia_autor', readValue: readBiographyValue)
      String? biography,
      @JsonKey(name: 'ano_nacimiento_autor', readValue: readYearOfBirth)
      String? yearOfBirth,
      @JsonKey(name: 'ano_deceso_autor', readValue: readYearOfDeath)
      String? yearOfDeath,
      @JsonKey(name: 'profesion_autor', readValue: readProfession)
      String? profession,
      @JsonKey(name: 'imagen_autor', readValue: readImage) String? image,
      @JsonKey(name: 'estado_autor', readValue: readState) String? state,
      @SpeciesIiapIntoClassToMap() List<SpecieIiap>? species});
}

/// @nodoc
class _$AuthorIiapCopyWithImpl<$Res, $Val extends AuthorIiap>
    implements $AuthorIiapCopyWith<$Res> {
  _$AuthorIiapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthorIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? lastname = freezed,
    Object? biography = freezed,
    Object? yearOfBirth = freezed,
    Object? yearOfDeath = freezed,
    Object? profession = freezed,
    Object? image = freezed,
    Object? state = freezed,
    Object? species = freezed,
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
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      yearOfBirth: freezed == yearOfBirth
          ? _value.yearOfBirth
          : yearOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      yearOfDeath: freezed == yearOfDeath
          ? _value.yearOfDeath
          : yearOfDeath // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as List<SpecieIiap>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorIiapImplCopyWith<$Res>
    implements $AuthorIiapCopyWith<$Res> {
  factory _$$AuthorIiapImplCopyWith(
          _$AuthorIiapImpl value, $Res Function(_$AuthorIiapImpl) then) =
      __$$AuthorIiapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_autor') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'vc_apellido') String? lastname,
      @JsonKey(name: 'biografia_autor', readValue: readBiographyValue)
      String? biography,
      @JsonKey(name: 'ano_nacimiento_autor', readValue: readYearOfBirth)
      String? yearOfBirth,
      @JsonKey(name: 'ano_deceso_autor', readValue: readYearOfDeath)
      String? yearOfDeath,
      @JsonKey(name: 'profesion_autor', readValue: readProfession)
      String? profession,
      @JsonKey(name: 'imagen_autor', readValue: readImage) String? image,
      @JsonKey(name: 'estado_autor', readValue: readState) String? state,
      @SpeciesIiapIntoClassToMap() List<SpecieIiap>? species});
}

/// @nodoc
class __$$AuthorIiapImplCopyWithImpl<$Res>
    extends _$AuthorIiapCopyWithImpl<$Res, _$AuthorIiapImpl>
    implements _$$AuthorIiapImplCopyWith<$Res> {
  __$$AuthorIiapImplCopyWithImpl(
      _$AuthorIiapImpl _value, $Res Function(_$AuthorIiapImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthorIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? lastname = freezed,
    Object? biography = freezed,
    Object? yearOfBirth = freezed,
    Object? yearOfDeath = freezed,
    Object? profession = freezed,
    Object? image = freezed,
    Object? state = freezed,
    Object? species = freezed,
  }) {
    return _then(_$AuthorIiapImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      yearOfBirth: freezed == yearOfBirth
          ? _value.yearOfBirth
          : yearOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      yearOfDeath: freezed == yearOfDeath
          ? _value.yearOfDeath
          : yearOfDeath // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      species: freezed == species
          ? _value._species
          : species // ignore: cast_nullable_to_non_nullable
              as List<SpecieIiap>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorIiapImpl implements _AuthorIiap {
  _$AuthorIiapImpl(
      {@JsonKey(name: 'id_autor') required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'vc_apellido') this.lastname,
      @JsonKey(name: 'biografia_autor', readValue: readBiographyValue)
      this.biography,
      @JsonKey(name: 'ano_nacimiento_autor', readValue: readYearOfBirth)
      this.yearOfBirth,
      @JsonKey(name: 'ano_deceso_autor', readValue: readYearOfDeath)
      this.yearOfDeath,
      @JsonKey(name: 'profesion_autor', readValue: readProfession)
      this.profession,
      @JsonKey(name: 'imagen_autor', readValue: readImage) this.image,
      @JsonKey(name: 'estado_autor', readValue: readState) this.state,
      @SpeciesIiapIntoClassToMap() final List<SpecieIiap>? species = null})
      : _species = species;

  factory _$AuthorIiapImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorIiapImplFromJson(json);

  @override
  @JsonKey(name: 'id_autor')
  final int id;
  @override
  @JsonKey(name: 'vc_nombre')
  final String? name;
  @override
  @JsonKey(name: 'vc_apellido')
  final String? lastname;
  @override
  @JsonKey(name: 'biografia_autor', readValue: readBiographyValue)
  final String? biography;
  @override
  @JsonKey(name: 'ano_nacimiento_autor', readValue: readYearOfBirth)
  final String? yearOfBirth;
  @override
  @JsonKey(name: 'ano_deceso_autor', readValue: readYearOfDeath)
  final String? yearOfDeath;
  @override
  @JsonKey(name: 'profesion_autor', readValue: readProfession)
  final String? profession;
  @override
  @JsonKey(name: 'imagen_autor', readValue: readImage)
  final String? image;
  @override
  @JsonKey(name: 'estado_autor', readValue: readState)
  final String? state;
  final List<SpecieIiap>? _species;
  @override
  @JsonKey()
  @SpeciesIiapIntoClassToMap()
  List<SpecieIiap>? get species {
    final value = _species;
    if (value == null) return null;
    if (_species is EqualUnmodifiableListView) return _species;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AuthorIiap(id: $id, name: $name, lastname: $lastname, biography: $biography, yearOfBirth: $yearOfBirth, yearOfDeath: $yearOfDeath, profession: $profession, image: $image, state: $state, species: $species)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorIiapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.biography, biography) ||
                other.biography == biography) &&
            (identical(other.yearOfBirth, yearOfBirth) ||
                other.yearOfBirth == yearOfBirth) &&
            (identical(other.yearOfDeath, yearOfDeath) ||
                other.yearOfDeath == yearOfDeath) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._species, _species));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      lastname,
      biography,
      yearOfBirth,
      yearOfDeath,
      profession,
      image,
      state,
      const DeepCollectionEquality().hash(_species));

  /// Create a copy of AuthorIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorIiapImplCopyWith<_$AuthorIiapImpl> get copyWith =>
      __$$AuthorIiapImplCopyWithImpl<_$AuthorIiapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorIiapImplToJson(
      this,
    );
  }
}

abstract class _AuthorIiap implements AuthorIiap {
  factory _AuthorIiap(
      {@JsonKey(name: 'id_autor') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name,
      @JsonKey(name: 'vc_apellido') final String? lastname,
      @JsonKey(name: 'biografia_autor', readValue: readBiographyValue)
      final String? biography,
      @JsonKey(name: 'ano_nacimiento_autor', readValue: readYearOfBirth)
      final String? yearOfBirth,
      @JsonKey(name: 'ano_deceso_autor', readValue: readYearOfDeath)
      final String? yearOfDeath,
      @JsonKey(name: 'profesion_autor', readValue: readProfession)
      final String? profession,
      @JsonKey(name: 'imagen_autor', readValue: readImage) final String? image,
      @JsonKey(name: 'estado_autor', readValue: readState) final String? state,
      @SpeciesIiapIntoClassToMap()
      final List<SpecieIiap>? species}) = _$AuthorIiapImpl;

  factory _AuthorIiap.fromJson(Map<String, dynamic> json) =
      _$AuthorIiapImpl.fromJson;

  @override
  @JsonKey(name: 'id_autor')
  int get id;
  @override
  @JsonKey(name: 'vc_nombre')
  String? get name;
  @override
  @JsonKey(name: 'vc_apellido')
  String? get lastname;
  @override
  @JsonKey(name: 'biografia_autor', readValue: readBiographyValue)
  String? get biography;
  @override
  @JsonKey(name: 'ano_nacimiento_autor', readValue: readYearOfBirth)
  String? get yearOfBirth;
  @override
  @JsonKey(name: 'ano_deceso_autor', readValue: readYearOfDeath)
  String? get yearOfDeath;
  @override
  @JsonKey(name: 'profesion_autor', readValue: readProfession)
  String? get profession;
  @override
  @JsonKey(name: 'imagen_autor', readValue: readImage)
  String? get image;
  @override
  @JsonKey(name: 'estado_autor', readValue: readState)
  String? get state;
  @override
  @SpeciesIiapIntoClassToMap()
  List<SpecieIiap>? get species;

  /// Create a copy of AuthorIiap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorIiapImplCopyWith<_$AuthorIiapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
