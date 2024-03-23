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
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get biography => throw _privateConstructorUsedError;
  @JsonKey(name: 'year_of_birth')
  String? get yearOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'year_of_death')
  String? get yearOfDeath => throw _privateConstructorUsedError;
  String? get profession => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  @SpeciesIntoClassToMap()
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
      {int id,
      String? name,
      String? lastname,
      String? biography,
      @JsonKey(name: 'year_of_birth') String? yearOfBirth,
      @JsonKey(name: 'year_of_death') String? yearOfDeath,
      String? profession,
      String? image,
      String? state,
      @SpeciesIntoClassToMap() List<Specie>? species});
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
      {int id,
      String? name,
      String? lastname,
      String? biography,
      @JsonKey(name: 'year_of_birth') String? yearOfBirth,
      @JsonKey(name: 'year_of_death') String? yearOfDeath,
      String? profession,
      String? image,
      String? state,
      @SpeciesIntoClassToMap() List<Specie>? species});
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
    Object? yearOfDeath = freezed,
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
              as List<Specie>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorImpl implements _Author {
  _$AuthorImpl(
      {required this.id,
      this.name,
      this.lastname,
      this.biography,
      @JsonKey(name: 'year_of_birth') this.yearOfBirth,
      @JsonKey(name: 'year_of_death') this.yearOfDeath,
      this.profession,
      this.image,
      this.state,
      @SpeciesIntoClassToMap() final List<Specie>? species = null})
      : _species = species;

  factory _$AuthorImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? lastname;
  @override
  final String? biography;
  @override
  @JsonKey(name: 'year_of_birth')
  final String? yearOfBirth;
  @override
  @JsonKey(name: 'year_of_death')
  final String? yearOfDeath;
  @override
  final String? profession;
  @override
  final String? image;
  @override
  final String? state;
  final List<Specie>? _species;
  @override
  @JsonKey()
  @SpeciesIntoClassToMap()
  List<Specie>? get species {
    final value = _species;
    if (value == null) return null;
    if (_species is EqualUnmodifiableListView) return _species;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Author(id: $id, name: $name, lastname: $lastname, biography: $biography, yearOfBirth: $yearOfBirth, yearOfDeath: $yearOfDeath, profession: $profession, image: $image, state: $state, species: $species)';
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
            (identical(other.yearOfDeath, yearOfDeath) ||
                other.yearOfDeath == yearOfDeath) &&
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
      yearOfDeath,
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
      {required final int id,
      final String? name,
      final String? lastname,
      final String? biography,
      @JsonKey(name: 'year_of_birth') final String? yearOfBirth,
      @JsonKey(name: 'year_of_death') final String? yearOfDeath,
      final String? profession,
      final String? image,
      final String? state,
      @SpeciesIntoClassToMap() final List<Specie>? species}) = _$AuthorImpl;

  factory _Author.fromJson(Map<String, dynamic> json) = _$AuthorImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get lastname;
  @override
  String? get biography;
  @override
  @JsonKey(name: 'year_of_birth')
  String? get yearOfBirth;
  @override
  @JsonKey(name: 'year_of_death')
  String? get yearOfDeath;
  @override
  String? get profession;
  @override
  String? get image;
  @override
  String? get state;
  @override
  @SpeciesIntoClassToMap()
  List<Specie>? get species;
  @override
  @JsonKey(ignore: true)
  _$$AuthorImplCopyWith<_$AuthorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
