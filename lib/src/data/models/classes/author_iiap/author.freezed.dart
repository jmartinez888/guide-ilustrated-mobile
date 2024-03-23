// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return _Author.fromJson(json);
}

/// @nodoc
mixin _$Author {
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
  String? get yearofDeath => throw _privateConstructorUsedError;
  @JsonKey(name: 'profesion_autor', readValue: readProfession)
  String? get profession => throw _privateConstructorUsedError;
  @JsonKey(name: 'imagen_autor', readValue: readImage)
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'estado_autor', readValue: readState)
  String? get state => throw _privateConstructorUsedError;
  @SpeciesIiapIntoClassToMap()
  List<Specie>? get species => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorCopyWith<Author> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) then) =
      _$AuthorCopyWithImpl<$Res, Author>;
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
      String? yearofDeath,
      @JsonKey(name: 'profesion_autor', readValue: readProfession)
      String? profession,
      @JsonKey(name: 'imagen_autor', readValue: readImage) String? image,
      @JsonKey(name: 'estado_autor', readValue: readState) String? state,
      @SpeciesIiapIntoClassToMap() List<Specie>? species});
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res, $Val extends Author>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? lastname = freezed,
    Object? biography = freezed,
    Object? yearOfBirth = freezed,
    Object? yearofDeath = freezed,
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
      yearofDeath: freezed == yearofDeath
          ? _value.yearofDeath
          : yearofDeath // ignore: cast_nullable_to_non_nullable
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
              as List<Specie>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorImplCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$$AuthorImplCopyWith(
          _$AuthorImpl value, $Res Function(_$AuthorImpl) then) =
      __$$AuthorImplCopyWithImpl<$Res>;
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
      String? yearofDeath,
      @JsonKey(name: 'profesion_autor', readValue: readProfession)
      String? profession,
      @JsonKey(name: 'imagen_autor', readValue: readImage) String? image,
      @JsonKey(name: 'estado_autor', readValue: readState) String? state,
      @SpeciesIiapIntoClassToMap() List<Specie>? species});
}

/// @nodoc
class __$$AuthorImplCopyWithImpl<$Res>
    extends _$AuthorCopyWithImpl<$Res, _$AuthorImpl>
    implements _$$AuthorImplCopyWith<$Res> {
  __$$AuthorImplCopyWithImpl(
      _$AuthorImpl _value, $Res Function(_$AuthorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? lastname = freezed,
    Object? biography = freezed,
    Object? yearOfBirth = freezed,
    Object? yearofDeath = freezed,
    Object? profession = freezed,
    Object? image = freezed,
    Object? state = freezed,
    Object? species = freezed,
  }) {
    return _then(_$AuthorImpl(
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
      yearofDeath: freezed == yearofDeath
          ? _value.yearofDeath
          : yearofDeath // ignore: cast_nullable_to_non_nullable
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
              as List<Specie>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorImpl implements _Author {
  _$AuthorImpl(
      {@JsonKey(name: 'id_autor') required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'vc_apellido') this.lastname,
      @JsonKey(name: 'biografia_autor', readValue: readBiographyValue)
      this.biography,
      @JsonKey(name: 'ano_nacimiento_autor', readValue: readYearOfBirth)
      this.yearOfBirth,
      @JsonKey(name: 'ano_deceso_autor', readValue: readYearOfDeath)
      this.yearofDeath,
      @JsonKey(name: 'profesion_autor', readValue: readProfession)
      this.profession,
      @JsonKey(name: 'imagen_autor', readValue: readImage) this.image,
      @JsonKey(name: 'estado_autor', readValue: readState) this.state,
      @SpeciesIiapIntoClassToMap() final List<Specie>? species = null})
      : _species = species;

  factory _$AuthorImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorImplFromJson(json);

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
  final String? yearofDeath;
  @override
  @JsonKey(name: 'profesion_autor', readValue: readProfession)
  final String? profession;
  @override
  @JsonKey(name: 'imagen_autor', readValue: readImage)
  final String? image;
  @override
  @JsonKey(name: 'estado_autor', readValue: readState)
  final String? state;
  final List<Specie>? _species;
  @override
  @JsonKey()
  @SpeciesIiapIntoClassToMap()
  List<Specie>? get species {
    final value = _species;
    if (value == null) return null;
    if (_species is EqualUnmodifiableListView) return _species;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Author(id: $id, name: $name, lastname: $lastname, biography: $biography, yearOfBirth: $yearOfBirth, yearofDeath: $yearofDeath, profession: $profession, image: $image, state: $state, species: $species)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.biography, biography) ||
                other.biography == biography) &&
            (identical(other.yearOfBirth, yearOfBirth) ||
                other.yearOfBirth == yearOfBirth) &&
            (identical(other.yearofDeath, yearofDeath) ||
                other.yearofDeath == yearofDeath) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._species, _species));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      lastname,
      biography,
      yearOfBirth,
      yearofDeath,
      profession,
      image,
      state,
      const DeepCollectionEquality().hash(_species));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorImplCopyWith<_$AuthorImpl> get copyWith =>
      __$$AuthorImplCopyWithImpl<_$AuthorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorImplToJson(
      this,
    );
  }
}

abstract class _Author implements Author {
  factory _Author(
      {@JsonKey(name: 'id_autor') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name,
      @JsonKey(name: 'vc_apellido') final String? lastname,
      @JsonKey(name: 'biografia_autor', readValue: readBiographyValue)
      final String? biography,
      @JsonKey(name: 'ano_nacimiento_autor', readValue: readYearOfBirth)
      final String? yearOfBirth,
      @JsonKey(name: 'ano_deceso_autor', readValue: readYearOfDeath)
      final String? yearofDeath,
      @JsonKey(name: 'profesion_autor', readValue: readProfession)
      final String? profession,
      @JsonKey(name: 'imagen_autor', readValue: readImage) final String? image,
      @JsonKey(name: 'estado_autor', readValue: readState) final String? state,
      @SpeciesIiapIntoClassToMap() final List<Specie>? species}) = _$AuthorImpl;

  factory _Author.fromJson(Map<String, dynamic> json) = _$AuthorImpl.fromJson;

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
  String? get yearofDeath;
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
  List<Specie>? get species;
  @override
  @JsonKey(ignore: true)
  _$$AuthorImplCopyWith<_$AuthorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
