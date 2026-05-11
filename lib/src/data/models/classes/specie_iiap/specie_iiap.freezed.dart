// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specie_iiap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpecieIiap _$SpecieIiapFromJson(Map<String, dynamic> json) {
  return _SpecieIiap.fromJson(json);
}

/// @nodoc
mixin _$SpecieIiap {
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
  int? get idFamily => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_imagen')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxa')
  @TypeIiapMapIntoClass()
  TypeIiap? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_sonido')
  String? get sound => throw _privateConstructorUsedError;
  @JsonKey(name: 'te_descripcion')
  String? get description => throw _privateConstructorUsedError;
  @ConservationsStatesIiapMapIntoClass()
  @JsonKey(name: 'estados_conservacion')
  List<ConservationStatesIiap>? get conservationStates =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'autores')
  @AuthorsIiapmapIntoClass()
  List<AuthorIiap>? get authors => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxonomia')
  @TaxonomyIiapMapIntoClass()
  TaxonomyIiap? get taxonomy => throw _privateConstructorUsedError;
  @JsonKey(name: 'ch_estado')
  String? get state => throw _privateConstructorUsedError;

  /// Serializes this SpecieIiap to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecieIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecieIiapCopyWith<SpecieIiap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecieIiapCopyWith<$Res> {
  factory $SpecieIiapCopyWith(
          SpecieIiap value, $Res Function(SpecieIiap) then) =
      _$SpecieIiapCopyWithImpl<$Res, SpecieIiap>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_especie') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'vc_nombre_cientifico') String? scientificName,
      @JsonKey(name: 'vc_nombre_ingles') String? englishName,
      @JsonKey(name: 'vc_ano') String? year,
      @JsonKey(name: 'id_familia') int? idFamily,
      @JsonKey(name: 'vc_imagen') String? image,
      @JsonKey(name: 'taxa') @TypeIiapMapIntoClass() TypeIiap? type,
      @JsonKey(name: 'vc_sonido') String? sound,
      @JsonKey(name: 'te_descripcion') String? description,
      @ConservationsStatesIiapMapIntoClass()
      @JsonKey(name: 'estados_conservacion')
      List<ConservationStatesIiap>? conservationStates,
      @JsonKey(name: 'autores')
      @AuthorsIiapmapIntoClass()
      List<AuthorIiap>? authors,
      @JsonKey(name: 'taxonomia')
      @TaxonomyIiapMapIntoClass()
      TaxonomyIiap? taxonomy,
      @JsonKey(name: 'ch_estado') String? state});

  $TypeIiapCopyWith<$Res>? get type;
  $TaxonomyIiapCopyWith<$Res>? get taxonomy;
}

/// @nodoc
class _$SpecieIiapCopyWithImpl<$Res, $Val extends SpecieIiap>
    implements $SpecieIiapCopyWith<$Res> {
  _$SpecieIiapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecieIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? scientificName = freezed,
    Object? englishName = freezed,
    Object? year = freezed,
    Object? idFamily = freezed,
    Object? image = freezed,
    Object? type = freezed,
    Object? sound = freezed,
    Object? description = freezed,
    Object? conservationStates = freezed,
    Object? authors = freezed,
    Object? taxonomy = freezed,
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
      idFamily: freezed == idFamily
          ? _value.idFamily
          : idFamily // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeIiap?,
      sound: freezed == sound
          ? _value.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      conservationStates: freezed == conservationStates
          ? _value.conservationStates
          : conservationStates // ignore: cast_nullable_to_non_nullable
              as List<ConservationStatesIiap>?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<AuthorIiap>?,
      taxonomy: freezed == taxonomy
          ? _value.taxonomy
          : taxonomy // ignore: cast_nullable_to_non_nullable
              as TaxonomyIiap?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of SpecieIiap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TypeIiapCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $TypeIiapCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  /// Create a copy of SpecieIiap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaxonomyIiapCopyWith<$Res>? get taxonomy {
    if (_value.taxonomy == null) {
      return null;
    }

    return $TaxonomyIiapCopyWith<$Res>(_value.taxonomy!, (value) {
      return _then(_value.copyWith(taxonomy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpecieIiapImplCopyWith<$Res>
    implements $SpecieIiapCopyWith<$Res> {
  factory _$$SpecieIiapImplCopyWith(
          _$SpecieIiapImpl value, $Res Function(_$SpecieIiapImpl) then) =
      __$$SpecieIiapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_especie') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'vc_nombre_cientifico') String? scientificName,
      @JsonKey(name: 'vc_nombre_ingles') String? englishName,
      @JsonKey(name: 'vc_ano') String? year,
      @JsonKey(name: 'id_familia') int? idFamily,
      @JsonKey(name: 'vc_imagen') String? image,
      @JsonKey(name: 'taxa') @TypeIiapMapIntoClass() TypeIiap? type,
      @JsonKey(name: 'vc_sonido') String? sound,
      @JsonKey(name: 'te_descripcion') String? description,
      @ConservationsStatesIiapMapIntoClass()
      @JsonKey(name: 'estados_conservacion')
      List<ConservationStatesIiap>? conservationStates,
      @JsonKey(name: 'autores')
      @AuthorsIiapmapIntoClass()
      List<AuthorIiap>? authors,
      @JsonKey(name: 'taxonomia')
      @TaxonomyIiapMapIntoClass()
      TaxonomyIiap? taxonomy,
      @JsonKey(name: 'ch_estado') String? state});

  @override
  $TypeIiapCopyWith<$Res>? get type;
  @override
  $TaxonomyIiapCopyWith<$Res>? get taxonomy;
}

/// @nodoc
class __$$SpecieIiapImplCopyWithImpl<$Res>
    extends _$SpecieIiapCopyWithImpl<$Res, _$SpecieIiapImpl>
    implements _$$SpecieIiapImplCopyWith<$Res> {
  __$$SpecieIiapImplCopyWithImpl(
      _$SpecieIiapImpl _value, $Res Function(_$SpecieIiapImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpecieIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? scientificName = freezed,
    Object? englishName = freezed,
    Object? year = freezed,
    Object? idFamily = freezed,
    Object? image = freezed,
    Object? type = freezed,
    Object? sound = freezed,
    Object? description = freezed,
    Object? conservationStates = freezed,
    Object? authors = freezed,
    Object? taxonomy = freezed,
    Object? state = freezed,
  }) {
    return _then(_$SpecieIiapImpl(
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
      idFamily: freezed == idFamily
          ? _value.idFamily
          : idFamily // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeIiap?,
      sound: freezed == sound
          ? _value.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      conservationStates: freezed == conservationStates
          ? _value._conservationStates
          : conservationStates // ignore: cast_nullable_to_non_nullable
              as List<ConservationStatesIiap>?,
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<AuthorIiap>?,
      taxonomy: freezed == taxonomy
          ? _value.taxonomy
          : taxonomy // ignore: cast_nullable_to_non_nullable
              as TaxonomyIiap?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecieIiapImpl implements _SpecieIiap {
  _$SpecieIiapImpl(
      {@JsonKey(name: 'id_especie') required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'vc_nombre_cientifico') this.scientificName,
      @JsonKey(name: 'vc_nombre_ingles') this.englishName,
      @JsonKey(name: 'vc_ano') this.year,
      @JsonKey(name: 'id_familia') this.idFamily,
      @JsonKey(name: 'vc_imagen') this.image,
      @JsonKey(name: 'taxa') @TypeIiapMapIntoClass() this.type = null,
      @JsonKey(name: 'vc_sonido') this.sound,
      @JsonKey(name: 'te_descripcion') this.description,
      @ConservationsStatesIiapMapIntoClass()
      @JsonKey(name: 'estados_conservacion')
      final List<ConservationStatesIiap>? conservationStates,
      @JsonKey(name: 'autores')
      @AuthorsIiapmapIntoClass()
      final List<AuthorIiap>? authors = null,
      @JsonKey(name: 'taxonomia')
      @TaxonomyIiapMapIntoClass()
      this.taxonomy = null,
      @JsonKey(name: 'ch_estado') this.state})
      : _conservationStates = conservationStates,
        _authors = authors;

  factory _$SpecieIiapImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecieIiapImplFromJson(json);

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
  final int? idFamily;
  @override
  @JsonKey(name: 'vc_imagen')
  final String? image;
  @override
  @JsonKey(name: 'taxa')
  @TypeIiapMapIntoClass()
  final TypeIiap? type;
  @override
  @JsonKey(name: 'vc_sonido')
  final String? sound;
  @override
  @JsonKey(name: 'te_descripcion')
  final String? description;
  final List<ConservationStatesIiap>? _conservationStates;
  @override
  @ConservationsStatesIiapMapIntoClass()
  @JsonKey(name: 'estados_conservacion')
  List<ConservationStatesIiap>? get conservationStates {
    final value = _conservationStates;
    if (value == null) return null;
    if (_conservationStates is EqualUnmodifiableListView)
      return _conservationStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AuthorIiap>? _authors;
  @override
  @JsonKey(name: 'autores')
  @AuthorsIiapmapIntoClass()
  List<AuthorIiap>? get authors {
    final value = _authors;
    if (value == null) return null;
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'taxonomia')
  @TaxonomyIiapMapIntoClass()
  final TaxonomyIiap? taxonomy;
  @override
  @JsonKey(name: 'ch_estado')
  final String? state;

  @override
  String toString() {
    return 'SpecieIiap(id: $id, name: $name, scientificName: $scientificName, englishName: $englishName, year: $year, idFamily: $idFamily, image: $image, type: $type, sound: $sound, description: $description, conservationStates: $conservationStates, authors: $authors, taxonomy: $taxonomy, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecieIiapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.scientificName, scientificName) ||
                other.scientificName == scientificName) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.idFamily, idFamily) ||
                other.idFamily == idFamily) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sound, sound) || other.sound == sound) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._conservationStates, _conservationStates) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.taxonomy, taxonomy) ||
                other.taxonomy == taxonomy) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      scientificName,
      englishName,
      year,
      idFamily,
      image,
      type,
      sound,
      description,
      const DeepCollectionEquality().hash(_conservationStates),
      const DeepCollectionEquality().hash(_authors),
      taxonomy,
      state);

  /// Create a copy of SpecieIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecieIiapImplCopyWith<_$SpecieIiapImpl> get copyWith =>
      __$$SpecieIiapImplCopyWithImpl<_$SpecieIiapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecieIiapImplToJson(
      this,
    );
  }
}

abstract class _SpecieIiap implements SpecieIiap {
  factory _SpecieIiap(
      {@JsonKey(name: 'id_especie') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name,
      @JsonKey(name: 'vc_nombre_cientifico') final String? scientificName,
      @JsonKey(name: 'vc_nombre_ingles') final String? englishName,
      @JsonKey(name: 'vc_ano') final String? year,
      @JsonKey(name: 'id_familia') final int? idFamily,
      @JsonKey(name: 'vc_imagen') final String? image,
      @JsonKey(name: 'taxa') @TypeIiapMapIntoClass() final TypeIiap? type,
      @JsonKey(name: 'vc_sonido') final String? sound,
      @JsonKey(name: 'te_descripcion') final String? description,
      @ConservationsStatesIiapMapIntoClass()
      @JsonKey(name: 'estados_conservacion')
      final List<ConservationStatesIiap>? conservationStates,
      @JsonKey(name: 'autores')
      @AuthorsIiapmapIntoClass()
      final List<AuthorIiap>? authors,
      @JsonKey(name: 'taxonomia')
      @TaxonomyIiapMapIntoClass()
      final TaxonomyIiap? taxonomy,
      @JsonKey(name: 'ch_estado') final String? state}) = _$SpecieIiapImpl;

  factory _SpecieIiap.fromJson(Map<String, dynamic> json) =
      _$SpecieIiapImpl.fromJson;

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
  int? get idFamily;
  @override
  @JsonKey(name: 'vc_imagen')
  String? get image;
  @override
  @JsonKey(name: 'taxa')
  @TypeIiapMapIntoClass()
  TypeIiap? get type;
  @override
  @JsonKey(name: 'vc_sonido')
  String? get sound;
  @override
  @JsonKey(name: 'te_descripcion')
  String? get description;
  @override
  @ConservationsStatesIiapMapIntoClass()
  @JsonKey(name: 'estados_conservacion')
  List<ConservationStatesIiap>? get conservationStates;
  @override
  @JsonKey(name: 'autores')
  @AuthorsIiapmapIntoClass()
  List<AuthorIiap>? get authors;
  @override
  @JsonKey(name: 'taxonomia')
  @TaxonomyIiapMapIntoClass()
  TaxonomyIiap? get taxonomy;
  @override
  @JsonKey(name: 'ch_estado')
  String? get state;

  /// Create a copy of SpecieIiap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecieIiapImplCopyWith<_$SpecieIiapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
