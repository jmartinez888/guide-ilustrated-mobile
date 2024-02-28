// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Specie _$SpecieFromJson(Map<String, dynamic> json) {
  return _Specie.fromJson(json);
}

/// @nodoc
mixin _$Specie {
  @JsonKey(name: 'id_especie')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre_cientifico')
  String? get scientificName => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre_ingles')
  String? get englishName => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_ano')
  String? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_familia')
  int? get familyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_imagen')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxa')
  TypeC? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_sonido')
  String? get sound => throw _privateConstructorUsedError;
  @JsonKey(name: 'te_descripcion')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'estados_conservacion')
  List<StateOfConservation>? get stateOfConservations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'autores')
  List<Author>? get authors => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxonomia')
  Taxonomy? get taxonomy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecieCopyWith<Specie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecieCopyWith<$Res> {
  factory $SpecieCopyWith(Specie value, $Res Function(Specie) then) =
      _$SpecieCopyWithImpl<$Res, Specie>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_especie') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'vc_nombre_cientifico') String? scientificName,
      @JsonKey(name: 'vc_nombre_ingles') String? englishName,
      @JsonKey(name: 'vc_ano') String? year,
      @JsonKey(name: 'id_familia') int? familyId,
      @JsonKey(name: 'vc_imagen') String? image,
      @JsonKey(name: 'taxa') TypeC? type,
      @JsonKey(name: 'vc_sonido') String? sound,
      @JsonKey(name: 'te_descripcion') String? description,
      @JsonKey(name: 'estados_conservacion')
      List<StateOfConservation>? stateOfConservations,
      @JsonKey(name: 'autores') List<Author>? authors,
      @JsonKey(name: 'taxonomia') Taxonomy? taxonomy});

  $TypeCCopyWith<$Res>? get type;
  $TaxonomyCopyWith<$Res>? get taxonomy;
}

/// @nodoc
class _$SpecieCopyWithImpl<$Res, $Val extends Specie>
    implements $SpecieCopyWith<$Res> {
  _$SpecieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? scientificName = freezed,
    Object? englishName = freezed,
    Object? year = freezed,
    Object? familyId = freezed,
    Object? image = freezed,
    Object? type = freezed,
    Object? sound = freezed,
    Object? description = freezed,
    Object? stateOfConservations = freezed,
    Object? authors = freezed,
    Object? taxonomy = freezed,
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
      scientificName: freezed == scientificName
          ? _value.scientificName
          : scientificName // ignore: cast_nullable_to_non_nullable
              as String?,
      englishName: freezed == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      familyId: freezed == familyId
          ? _value.familyId
          : familyId // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeC?,
      sound: freezed == sound
          ? _value.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      stateOfConservations: freezed == stateOfConservations
          ? _value.stateOfConservations
          : stateOfConservations // ignore: cast_nullable_to_non_nullable
              as List<StateOfConservation>?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>?,
      taxonomy: freezed == taxonomy
          ? _value.taxonomy
          : taxonomy // ignore: cast_nullable_to_non_nullable
              as Taxonomy?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TypeCCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $TypeCCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TaxonomyCopyWith<$Res>? get taxonomy {
    if (_value.taxonomy == null) {
      return null;
    }

    return $TaxonomyCopyWith<$Res>(_value.taxonomy!, (value) {
      return _then(_value.copyWith(taxonomy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpecieImplCopyWith<$Res> implements $SpecieCopyWith<$Res> {
  factory _$$SpecieImplCopyWith(
          _$SpecieImpl value, $Res Function(_$SpecieImpl) then) =
      __$$SpecieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_especie') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'vc_nombre_cientifico') String? scientificName,
      @JsonKey(name: 'vc_nombre_ingles') String? englishName,
      @JsonKey(name: 'vc_ano') String? year,
      @JsonKey(name: 'id_familia') int? familyId,
      @JsonKey(name: 'vc_imagen') String? image,
      @JsonKey(name: 'taxa') TypeC? type,
      @JsonKey(name: 'vc_sonido') String? sound,
      @JsonKey(name: 'te_descripcion') String? description,
      @JsonKey(name: 'estados_conservacion')
      List<StateOfConservation>? stateOfConservations,
      @JsonKey(name: 'autores') List<Author>? authors,
      @JsonKey(name: 'taxonomia') Taxonomy? taxonomy});

  @override
  $TypeCCopyWith<$Res>? get type;
  @override
  $TaxonomyCopyWith<$Res>? get taxonomy;
}

/// @nodoc
class __$$SpecieImplCopyWithImpl<$Res>
    extends _$SpecieCopyWithImpl<$Res, _$SpecieImpl>
    implements _$$SpecieImplCopyWith<$Res> {
  __$$SpecieImplCopyWithImpl(
      _$SpecieImpl _value, $Res Function(_$SpecieImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? scientificName = freezed,
    Object? englishName = freezed,
    Object? year = freezed,
    Object? familyId = freezed,
    Object? image = freezed,
    Object? type = freezed,
    Object? sound = freezed,
    Object? description = freezed,
    Object? stateOfConservations = freezed,
    Object? authors = freezed,
    Object? taxonomy = freezed,
  }) {
    return _then(_$SpecieImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      scientificName: freezed == scientificName
          ? _value.scientificName
          : scientificName // ignore: cast_nullable_to_non_nullable
              as String?,
      englishName: freezed == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      familyId: freezed == familyId
          ? _value.familyId
          : familyId // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeC?,
      sound: freezed == sound
          ? _value.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      stateOfConservations: freezed == stateOfConservations
          ? _value._stateOfConservations
          : stateOfConservations // ignore: cast_nullable_to_non_nullable
              as List<StateOfConservation>?,
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>?,
      taxonomy: freezed == taxonomy
          ? _value.taxonomy
          : taxonomy // ignore: cast_nullable_to_non_nullable
              as Taxonomy?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecieImpl implements _Specie {
  _$SpecieImpl(
      {@JsonKey(name: 'id_especie') required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'vc_nombre_cientifico') this.scientificName,
      @JsonKey(name: 'vc_nombre_ingles') this.englishName,
      @JsonKey(name: 'vc_ano') this.year,
      @JsonKey(name: 'id_familia') this.familyId,
      @JsonKey(name: 'vc_imagen') this.image,
      @JsonKey(name: 'taxa') this.type,
      @JsonKey(name: 'vc_sonido') this.sound,
      @JsonKey(name: 'te_descripcion') this.description,
      @JsonKey(name: 'estados_conservacion')
      final List<StateOfConservation>? stateOfConservations,
      @JsonKey(name: 'autores') final List<Author>? authors,
      @JsonKey(name: 'taxonomia') this.taxonomy})
      : _stateOfConservations = stateOfConservations,
        _authors = authors;

  factory _$SpecieImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecieImplFromJson(json);

  @override
  @JsonKey(name: 'id_especie')
  final int id;
  @override
  @JsonKey(name: 'vc_nombre')
  final String? name;
  @override
  @JsonKey(name: 'vc_nombre_cientifico')
  final String? scientificName;
  @override
  @JsonKey(name: 'vc_nombre_ingles')
  final String? englishName;
  @override
  @JsonKey(name: 'vc_ano')
  final String? year;
  @override
  @JsonKey(name: 'id_familia')
  final int? familyId;
  @override
  @JsonKey(name: 'vc_imagen')
  final String? image;
  @override
  @JsonKey(name: 'taxa')
  final TypeC? type;
  @override
  @JsonKey(name: 'vc_sonido')
  final String? sound;
  @override
  @JsonKey(name: 'te_descripcion')
  final String? description;
  final List<StateOfConservation>? _stateOfConservations;
  @override
  @JsonKey(name: 'estados_conservacion')
  List<StateOfConservation>? get stateOfConservations {
    final value = _stateOfConservations;
    if (value == null) return null;
    if (_stateOfConservations is EqualUnmodifiableListView)
      return _stateOfConservations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Author>? _authors;
  @override
  @JsonKey(name: 'autores')
  List<Author>? get authors {
    final value = _authors;
    if (value == null) return null;
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'taxonomia')
  final Taxonomy? taxonomy;

  @override
  String toString() {
    return 'Specie(id: $id, name: $name, scientificName: $scientificName, englishName: $englishName, year: $year, familyId: $familyId, image: $image, type: $type, sound: $sound, description: $description, stateOfConservations: $stateOfConservations, authors: $authors, taxonomy: $taxonomy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecieImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.scientificName, scientificName) ||
                other.scientificName == scientificName) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.familyId, familyId) ||
                other.familyId == familyId) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sound, sound) || other.sound == sound) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._stateOfConservations, _stateOfConservations) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.taxonomy, taxonomy) ||
                other.taxonomy == taxonomy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      scientificName,
      englishName,
      year,
      familyId,
      image,
      type,
      sound,
      description,
      const DeepCollectionEquality().hash(_stateOfConservations),
      const DeepCollectionEquality().hash(_authors),
      taxonomy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecieImplCopyWith<_$SpecieImpl> get copyWith =>
      __$$SpecieImplCopyWithImpl<_$SpecieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecieImplToJson(
      this,
    );
  }
}

abstract class _Specie implements Specie {
  factory _Specie(
      {@JsonKey(name: 'id_especie') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name,
      @JsonKey(name: 'vc_nombre_cientifico') final String? scientificName,
      @JsonKey(name: 'vc_nombre_ingles') final String? englishName,
      @JsonKey(name: 'vc_ano') final String? year,
      @JsonKey(name: 'id_familia') final int? familyId,
      @JsonKey(name: 'vc_imagen') final String? image,
      @JsonKey(name: 'taxa') final TypeC? type,
      @JsonKey(name: 'vc_sonido') final String? sound,
      @JsonKey(name: 'te_descripcion') final String? description,
      @JsonKey(name: 'estados_conservacion')
      final List<StateOfConservation>? stateOfConservations,
      @JsonKey(name: 'autores') final List<Author>? authors,
      @JsonKey(name: 'taxonomia') final Taxonomy? taxonomy}) = _$SpecieImpl;

  factory _Specie.fromJson(Map<String, dynamic> json) = _$SpecieImpl.fromJson;

  @override
  @JsonKey(name: 'id_especie')
  int get id;
  @override
  @JsonKey(name: 'vc_nombre')
  String? get name;
  @override
  @JsonKey(name: 'vc_nombre_cientifico')
  String? get scientificName;
  @override
  @JsonKey(name: 'vc_nombre_ingles')
  String? get englishName;
  @override
  @JsonKey(name: 'vc_ano')
  String? get year;
  @override
  @JsonKey(name: 'id_familia')
  int? get familyId;
  @override
  @JsonKey(name: 'vc_imagen')
  String? get image;
  @override
  @JsonKey(name: 'taxa')
  TypeC? get type;
  @override
  @JsonKey(name: 'vc_sonido')
  String? get sound;
  @override
  @JsonKey(name: 'te_descripcion')
  String? get description;
  @override
  @JsonKey(name: 'estados_conservacion')
  List<StateOfConservation>? get stateOfConservations;
  @override
  @JsonKey(name: 'autores')
  List<Author>? get authors;
  @override
  @JsonKey(name: 'taxonomia')
  Taxonomy? get taxonomy;
  @override
  @JsonKey(ignore: true)
  _$$SpecieImplCopyWith<_$SpecieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
