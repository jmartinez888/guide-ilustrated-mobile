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
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'scientific_name')
  String? get scientificName => throw _privateConstructorUsedError;
  @JsonKey(name: 'english_name')
  String? get englishName => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_family')
  int? get idFamily => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  @TypeMapIntoClass()
  TypeC? get type => throw _privateConstructorUsedError;
  String? get sound => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @ConservationsStatesMapIntoClass()
  @JsonKey(name: 'conservation_states')
  List<ConservationStates>? get conservationStates =>
      throw _privateConstructorUsedError;
  @AuthorsIntoClassToMap()
  List<Author>? get authors => throw _privateConstructorUsedError;
  @KingdomMapIntoClass()
  Kingdom? get kingdom => throw _privateConstructorUsedError;
  @PhylumMapIntoClass()
  Phylum? get phylum => throw _privateConstructorUsedError;
  @JsonKey(name: 'class')
  @ClassMapIntoClass()
  ClassC? get classC => throw _privateConstructorUsedError;
  @OrderMapIntoClass()
  OrderC? get order => throw _privateConstructorUsedError;
  @FamilyMapIntoClass()
  Family? get family => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;

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
      {int id,
      String? name,
      @JsonKey(name: 'scientific_name') String? scientificName,
      @JsonKey(name: 'english_name') String? englishName,
      String? year,
      @JsonKey(name: 'id_family') int? idFamily,
      List<String>? images,
      @TypeMapIntoClass() TypeC? type,
      String? sound,
      String? description,
      @ConservationsStatesMapIntoClass()
      @JsonKey(name: 'conservation_states')
      List<ConservationStates>? conservationStates,
      @AuthorsIntoClassToMap() List<Author>? authors,
      @KingdomMapIntoClass() Kingdom? kingdom,
      @PhylumMapIntoClass() Phylum? phylum,
      @JsonKey(name: 'class') @ClassMapIntoClass() ClassC? classC,
      @OrderMapIntoClass() OrderC? order,
      @FamilyMapIntoClass() Family? family,
      String? state});

  $TypeCCopyWith<$Res>? get type;
  $KingdomCopyWith<$Res>? get kingdom;
  $PhylumCopyWith<$Res>? get phylum;
  $ClassCCopyWith<$Res>? get classC;
  $OrderCCopyWith<$Res>? get order;
  $FamilyCopyWith<$Res>? get family;
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
    Object? idFamily = freezed,
    Object? images = freezed,
    Object? type = freezed,
    Object? sound = freezed,
    Object? description = freezed,
    Object? conservationStates = freezed,
    Object? authors = freezed,
    Object? kingdom = freezed,
    Object? phylum = freezed,
    Object? classC = freezed,
    Object? order = freezed,
    Object? family = freezed,
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
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      conservationStates: freezed == conservationStates
          ? _value.conservationStates
          : conservationStates // ignore: cast_nullable_to_non_nullable
              as List<ConservationStates>?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>?,
      kingdom: freezed == kingdom
          ? _value.kingdom
          : kingdom // ignore: cast_nullable_to_non_nullable
              as Kingdom?,
      phylum: freezed == phylum
          ? _value.phylum
          : phylum // ignore: cast_nullable_to_non_nullable
              as Phylum?,
      classC: freezed == classC
          ? _value.classC
          : classC // ignore: cast_nullable_to_non_nullable
              as ClassC?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderC?,
      family: freezed == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as Family?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $KingdomCopyWith<$Res>? get kingdom {
    if (_value.kingdom == null) {
      return null;
    }

    return $KingdomCopyWith<$Res>(_value.kingdom!, (value) {
      return _then(_value.copyWith(kingdom: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PhylumCopyWith<$Res>? get phylum {
    if (_value.phylum == null) {
      return null;
    }

    return $PhylumCopyWith<$Res>(_value.phylum!, (value) {
      return _then(_value.copyWith(phylum: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClassCCopyWith<$Res>? get classC {
    if (_value.classC == null) {
      return null;
    }

    return $ClassCCopyWith<$Res>(_value.classC!, (value) {
      return _then(_value.copyWith(classC: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderCCopyWith<$Res>? get order {
    if (_value.order == null) {
      return null;
    }

    return $OrderCCopyWith<$Res>(_value.order!, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FamilyCopyWith<$Res>? get family {
    if (_value.family == null) {
      return null;
    }

    return $FamilyCopyWith<$Res>(_value.family!, (value) {
      return _then(_value.copyWith(family: value) as $Val);
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
      {int id,
      String? name,
      @JsonKey(name: 'scientific_name') String? scientificName,
      @JsonKey(name: 'english_name') String? englishName,
      String? year,
      @JsonKey(name: 'id_family') int? idFamily,
      List<String>? images,
      @TypeMapIntoClass() TypeC? type,
      String? sound,
      String? description,
      @ConservationsStatesMapIntoClass()
      @JsonKey(name: 'conservation_states')
      List<ConservationStates>? conservationStates,
      @AuthorsIntoClassToMap() List<Author>? authors,
      @KingdomMapIntoClass() Kingdom? kingdom,
      @PhylumMapIntoClass() Phylum? phylum,
      @JsonKey(name: 'class') @ClassMapIntoClass() ClassC? classC,
      @OrderMapIntoClass() OrderC? order,
      @FamilyMapIntoClass() Family? family,
      String? state});

  @override
  $TypeCCopyWith<$Res>? get type;
  @override
  $KingdomCopyWith<$Res>? get kingdom;
  @override
  $PhylumCopyWith<$Res>? get phylum;
  @override
  $ClassCCopyWith<$Res>? get classC;
  @override
  $OrderCCopyWith<$Res>? get order;
  @override
  $FamilyCopyWith<$Res>? get family;
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
    Object? idFamily = freezed,
    Object? images = freezed,
    Object? type = freezed,
    Object? sound = freezed,
    Object? description = freezed,
    Object? conservationStates = freezed,
    Object? authors = freezed,
    Object? kingdom = freezed,
    Object? phylum = freezed,
    Object? classC = freezed,
    Object? order = freezed,
    Object? family = freezed,
    Object? state = freezed,
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
      idFamily: freezed == idFamily
          ? _value.idFamily
          : idFamily // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      conservationStates: freezed == conservationStates
          ? _value._conservationStates
          : conservationStates // ignore: cast_nullable_to_non_nullable
              as List<ConservationStates>?,
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>?,
      kingdom: freezed == kingdom
          ? _value.kingdom
          : kingdom // ignore: cast_nullable_to_non_nullable
              as Kingdom?,
      phylum: freezed == phylum
          ? _value.phylum
          : phylum // ignore: cast_nullable_to_non_nullable
              as Phylum?,
      classC: freezed == classC
          ? _value.classC
          : classC // ignore: cast_nullable_to_non_nullable
              as ClassC?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderC?,
      family: freezed == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as Family?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecieImpl implements _Specie {
  _$SpecieImpl(
      {required this.id,
      this.name,
      @JsonKey(name: 'scientific_name') this.scientificName,
      @JsonKey(name: 'english_name') this.englishName,
      this.year,
      @JsonKey(name: 'id_family') this.idFamily,
      final List<String>? images,
      @TypeMapIntoClass() this.type = null,
      this.sound,
      this.description,
      @ConservationsStatesMapIntoClass()
      @JsonKey(name: 'conservation_states')
      final List<ConservationStates>? conservationStates,
      @AuthorsIntoClassToMap() final List<Author>? authors = null,
      @KingdomMapIntoClass() this.kingdom = null,
      @PhylumMapIntoClass() this.phylum = null,
      @JsonKey(name: 'class') @ClassMapIntoClass() this.classC = null,
      @OrderMapIntoClass() this.order = null,
      @FamilyMapIntoClass() this.family = null,
      this.state})
      : _images = images,
        _conservationStates = conservationStates,
        _authors = authors;

  factory _$SpecieImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecieImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'scientific_name')
  final String? scientificName;
  @override
  @JsonKey(name: 'english_name')
  final String? englishName;
  @override
  final String? year;
  @override
  @JsonKey(name: 'id_family')
  final int? idFamily;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  @TypeMapIntoClass()
  final TypeC? type;
  @override
  final String? sound;
  @override
  final String? description;
  final List<ConservationStates>? _conservationStates;
  @override
  @ConservationsStatesMapIntoClass()
  @JsonKey(name: 'conservation_states')
  List<ConservationStates>? get conservationStates {
    final value = _conservationStates;
    if (value == null) return null;
    if (_conservationStates is EqualUnmodifiableListView)
      return _conservationStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Author>? _authors;
  @override
  @JsonKey()
  @AuthorsIntoClassToMap()
  List<Author>? get authors {
    final value = _authors;
    if (value == null) return null;
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  @KingdomMapIntoClass()
  final Kingdom? kingdom;
  @override
  @JsonKey()
  @PhylumMapIntoClass()
  final Phylum? phylum;
  @override
  @JsonKey(name: 'class')
  @ClassMapIntoClass()
  final ClassC? classC;
  @override
  @JsonKey()
  @OrderMapIntoClass()
  final OrderC? order;
  @override
  @JsonKey()
  @FamilyMapIntoClass()
  final Family? family;
  @override
  final String? state;

  @override
  String toString() {
    return 'Specie(id: $id, name: $name, scientificName: $scientificName, englishName: $englishName, year: $year, idFamily: $idFamily, images: $images, type: $type, sound: $sound, description: $description, conservationStates: $conservationStates, authors: $authors, kingdom: $kingdom, phylum: $phylum, classC: $classC, order: $order, family: $family, state: $state)';
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
            (identical(other.idFamily, idFamily) ||
                other.idFamily == idFamily) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sound, sound) || other.sound == sound) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._conservationStates, _conservationStates) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.kingdom, kingdom) || other.kingdom == kingdom) &&
            (identical(other.phylum, phylum) || other.phylum == phylum) &&
            (identical(other.classC, classC) || other.classC == classC) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.family, family) || other.family == family) &&
            (identical(other.state, state) || other.state == state));
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
      idFamily,
      const DeepCollectionEquality().hash(_images),
      type,
      sound,
      description,
      const DeepCollectionEquality().hash(_conservationStates),
      const DeepCollectionEquality().hash(_authors),
      kingdom,
      phylum,
      classC,
      order,
      family,
      state);

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
      {required final int id,
      final String? name,
      @JsonKey(name: 'scientific_name') final String? scientificName,
      @JsonKey(name: 'english_name') final String? englishName,
      final String? year,
      @JsonKey(name: 'id_family') final int? idFamily,
      final List<String>? images,
      @TypeMapIntoClass() final TypeC? type,
      final String? sound,
      final String? description,
      @ConservationsStatesMapIntoClass()
      @JsonKey(name: 'conservation_states')
      final List<ConservationStates>? conservationStates,
      @AuthorsIntoClassToMap() final List<Author>? authors,
      @KingdomMapIntoClass() final Kingdom? kingdom,
      @PhylumMapIntoClass() final Phylum? phylum,
      @JsonKey(name: 'class') @ClassMapIntoClass() final ClassC? classC,
      @OrderMapIntoClass() final OrderC? order,
      @FamilyMapIntoClass() final Family? family,
      final String? state}) = _$SpecieImpl;

  factory _Specie.fromJson(Map<String, dynamic> json) = _$SpecieImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'scientific_name')
  String? get scientificName;
  @override
  @JsonKey(name: 'english_name')
  String? get englishName;
  @override
  String? get year;
  @override
  @JsonKey(name: 'id_family')
  int? get idFamily;
  @override
  List<String>? get images;
  @override
  @TypeMapIntoClass()
  TypeC? get type;
  @override
  String? get sound;
  @override
  String? get description;
  @override
  @ConservationsStatesMapIntoClass()
  @JsonKey(name: 'conservation_states')
  List<ConservationStates>? get conservationStates;
  @override
  @AuthorsIntoClassToMap()
  List<Author>? get authors;
  @override
  @KingdomMapIntoClass()
  Kingdom? get kingdom;
  @override
  @PhylumMapIntoClass()
  Phylum? get phylum;
  @override
  @JsonKey(name: 'class')
  @ClassMapIntoClass()
  ClassC? get classC;
  @override
  @OrderMapIntoClass()
  OrderC? get order;
  @override
  @FamilyMapIntoClass()
  Family? get family;
  @override
  String? get state;
  @override
  @JsonKey(ignore: true)
  _$$SpecieImplCopyWith<_$SpecieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
