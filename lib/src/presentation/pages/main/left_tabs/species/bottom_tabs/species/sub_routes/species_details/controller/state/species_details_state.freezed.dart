// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'species_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpeciesDetailsState {
  Map<String, Specie> get mapOfId => throw _privateConstructorUsedError;
  bool get expanded => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpeciesDetailsStateCopyWith<SpeciesDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeciesDetailsStateCopyWith<$Res> {
  factory $SpeciesDetailsStateCopyWith(
          SpeciesDetailsState value, $Res Function(SpeciesDetailsState) then) =
      _$SpeciesDetailsStateCopyWithImpl<$Res, SpeciesDetailsState>;
  @useResult
  $Res call({Map<String, Specie> mapOfId, bool expanded, bool loading});
}

/// @nodoc
class _$SpeciesDetailsStateCopyWithImpl<$Res, $Val extends SpeciesDetailsState>
    implements $SpeciesDetailsStateCopyWith<$Res> {
  _$SpeciesDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapOfId = null,
    Object? expanded = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      mapOfId: null == mapOfId
          ? _value.mapOfId
          : mapOfId // ignore: cast_nullable_to_non_nullable
              as Map<String, Specie>,
      expanded: null == expanded
          ? _value.expanded
          : expanded // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpeciesDetailsStateImplCopyWith<$Res>
    implements $SpeciesDetailsStateCopyWith<$Res> {
  factory _$$SpeciesDetailsStateImplCopyWith(_$SpeciesDetailsStateImpl value,
          $Res Function(_$SpeciesDetailsStateImpl) then) =
      __$$SpeciesDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, Specie> mapOfId, bool expanded, bool loading});
}

/// @nodoc
class __$$SpeciesDetailsStateImplCopyWithImpl<$Res>
    extends _$SpeciesDetailsStateCopyWithImpl<$Res, _$SpeciesDetailsStateImpl>
    implements _$$SpeciesDetailsStateImplCopyWith<$Res> {
  __$$SpeciesDetailsStateImplCopyWithImpl(_$SpeciesDetailsStateImpl _value,
      $Res Function(_$SpeciesDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapOfId = null,
    Object? expanded = null,
    Object? loading = null,
  }) {
    return _then(_$SpeciesDetailsStateImpl(
      mapOfId: null == mapOfId
          ? _value._mapOfId
          : mapOfId // ignore: cast_nullable_to_non_nullable
              as Map<String, Specie>,
      expanded: null == expanded
          ? _value.expanded
          : expanded // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SpeciesDetailsStateImpl implements _SpeciesDetailsState {
  _$SpeciesDetailsStateImpl(
      {final Map<String, Specie> mapOfId = const {},
      this.expanded = false,
      this.loading = true})
      : _mapOfId = mapOfId;

  final Map<String, Specie> _mapOfId;
  @override
  @JsonKey()
  Map<String, Specie> get mapOfId {
    if (_mapOfId is EqualUnmodifiableMapView) return _mapOfId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mapOfId);
  }

  @override
  @JsonKey()
  final bool expanded;
  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'SpeciesDetailsState(mapOfId: $mapOfId, expanded: $expanded, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeciesDetailsStateImpl &&
            const DeepCollectionEquality().equals(other._mapOfId, _mapOfId) &&
            (identical(other.expanded, expanded) ||
                other.expanded == expanded) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_mapOfId), expanded, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeciesDetailsStateImplCopyWith<_$SpeciesDetailsStateImpl> get copyWith =>
      __$$SpeciesDetailsStateImplCopyWithImpl<_$SpeciesDetailsStateImpl>(
          this, _$identity);
}

abstract class _SpeciesDetailsState implements SpeciesDetailsState {
  factory _SpeciesDetailsState(
      {final Map<String, Specie> mapOfId,
      final bool expanded,
      final bool loading}) = _$SpeciesDetailsStateImpl;

  @override
  Map<String, Specie> get mapOfId;
  @override
  bool get expanded;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$SpeciesDetailsStateImplCopyWith<_$SpeciesDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
