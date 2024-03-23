// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoritesState {
  String get searchText => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  List<Specie> get species => throw _privateConstructorUsedError;
  List<SpecieHelper> get speciesHelper => throw _privateConstructorUsedError;
  String get errorMesage => throw _privateConstructorUsedError;
  String get errorMesageHelper => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritesStateCopyWith<FavoritesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesStateCopyWith<$Res> {
  factory $FavoritesStateCopyWith(
          FavoritesState value, $Res Function(FavoritesState) then) =
      _$FavoritesStateCopyWithImpl<$Res, FavoritesState>;
  @useResult
  $Res call(
      {String searchText,
      bool loading,
      List<Specie> species,
      List<SpecieHelper> speciesHelper,
      String errorMesage,
      String errorMesageHelper});
}

/// @nodoc
class _$FavoritesStateCopyWithImpl<$Res, $Val extends FavoritesState>
    implements $FavoritesStateCopyWith<$Res> {
  _$FavoritesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? loading = null,
    Object? species = null,
    Object? speciesHelper = null,
    Object? errorMesage = null,
    Object? errorMesageHelper = null,
  }) {
    return _then(_value.copyWith(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as List<Specie>,
      speciesHelper: null == speciesHelper
          ? _value.speciesHelper
          : speciesHelper // ignore: cast_nullable_to_non_nullable
              as List<SpecieHelper>,
      errorMesage: null == errorMesage
          ? _value.errorMesage
          : errorMesage // ignore: cast_nullable_to_non_nullable
              as String,
      errorMesageHelper: null == errorMesageHelper
          ? _value.errorMesageHelper
          : errorMesageHelper // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoritesStateImplCopyWith<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  factory _$$FavoritesStateImplCopyWith(_$FavoritesStateImpl value,
          $Res Function(_$FavoritesStateImpl) then) =
      __$$FavoritesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchText,
      bool loading,
      List<Specie> species,
      List<SpecieHelper> speciesHelper,
      String errorMesage,
      String errorMesageHelper});
}

/// @nodoc
class __$$FavoritesStateImplCopyWithImpl<$Res>
    extends _$FavoritesStateCopyWithImpl<$Res, _$FavoritesStateImpl>
    implements _$$FavoritesStateImplCopyWith<$Res> {
  __$$FavoritesStateImplCopyWithImpl(
      _$FavoritesStateImpl _value, $Res Function(_$FavoritesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? loading = null,
    Object? species = null,
    Object? speciesHelper = null,
    Object? errorMesage = null,
    Object? errorMesageHelper = null,
  }) {
    return _then(_$FavoritesStateImpl(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      species: null == species
          ? _value._species
          : species // ignore: cast_nullable_to_non_nullable
              as List<Specie>,
      speciesHelper: null == speciesHelper
          ? _value._speciesHelper
          : speciesHelper // ignore: cast_nullable_to_non_nullable
              as List<SpecieHelper>,
      errorMesage: null == errorMesage
          ? _value.errorMesage
          : errorMesage // ignore: cast_nullable_to_non_nullable
              as String,
      errorMesageHelper: null == errorMesageHelper
          ? _value.errorMesageHelper
          : errorMesageHelper // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FavoritesStateImpl implements _FavoritesState {
  _$FavoritesStateImpl(
      {this.searchText = '',
      this.loading = true,
      final List<Specie> species = const [],
      final List<SpecieHelper> speciesHelper = const [],
      this.errorMesage = '',
      this.errorMesageHelper = ''})
      : _species = species,
        _speciesHelper = speciesHelper;

  @override
  @JsonKey()
  final String searchText;
  @override
  @JsonKey()
  final bool loading;
  final List<Specie> _species;
  @override
  @JsonKey()
  List<Specie> get species {
    if (_species is EqualUnmodifiableListView) return _species;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_species);
  }

  final List<SpecieHelper> _speciesHelper;
  @override
  @JsonKey()
  List<SpecieHelper> get speciesHelper {
    if (_speciesHelper is EqualUnmodifiableListView) return _speciesHelper;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_speciesHelper);
  }

  @override
  @JsonKey()
  final String errorMesage;
  @override
  @JsonKey()
  final String errorMesageHelper;

  @override
  String toString() {
    return 'FavoritesState(searchText: $searchText, loading: $loading, species: $species, speciesHelper: $speciesHelper, errorMesage: $errorMesage, errorMesageHelper: $errorMesageHelper)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesStateImpl &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._species, _species) &&
            const DeepCollectionEquality()
                .equals(other._speciesHelper, _speciesHelper) &&
            (identical(other.errorMesage, errorMesage) ||
                other.errorMesage == errorMesage) &&
            (identical(other.errorMesageHelper, errorMesageHelper) ||
                other.errorMesageHelper == errorMesageHelper));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchText,
      loading,
      const DeepCollectionEquality().hash(_species),
      const DeepCollectionEquality().hash(_speciesHelper),
      errorMesage,
      errorMesageHelper);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritesStateImplCopyWith<_$FavoritesStateImpl> get copyWith =>
      __$$FavoritesStateImplCopyWithImpl<_$FavoritesStateImpl>(
          this, _$identity);
}

abstract class _FavoritesState implements FavoritesState {
  factory _FavoritesState(
      {final String searchText,
      final bool loading,
      final List<Specie> species,
      final List<SpecieHelper> speciesHelper,
      final String errorMesage,
      final String errorMesageHelper}) = _$FavoritesStateImpl;

  @override
  String get searchText;
  @override
  bool get loading;
  @override
  List<Specie> get species;
  @override
  List<SpecieHelper> get speciesHelper;
  @override
  String get errorMesage;
  @override
  String get errorMesageHelper;
  @override
  @JsonKey(ignore: true)
  _$$FavoritesStateImplCopyWith<_$FavoritesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
