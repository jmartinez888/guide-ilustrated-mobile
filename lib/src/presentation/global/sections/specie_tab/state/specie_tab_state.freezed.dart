// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specie_tab_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpecieTabState {
  List<Specie> get species => throw _privateConstructorUsedError;
  bool get orderByName => throw _privateConstructorUsedError;
  bool get orderAsc => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpecieTabStateCopyWith<SpecieTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecieTabStateCopyWith<$Res> {
  factory $SpecieTabStateCopyWith(
          SpecieTabState value, $Res Function(SpecieTabState) then) =
      _$SpecieTabStateCopyWithImpl<$Res, SpecieTabState>;
  @useResult
  $Res call({List<Specie> species, bool orderByName, bool orderAsc});
}

/// @nodoc
class _$SpecieTabStateCopyWithImpl<$Res, $Val extends SpecieTabState>
    implements $SpecieTabStateCopyWith<$Res> {
  _$SpecieTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? species = null,
    Object? orderByName = null,
    Object? orderAsc = null,
  }) {
    return _then(_value.copyWith(
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as List<Specie>,
      orderByName: null == orderByName
          ? _value.orderByName
          : orderByName // ignore: cast_nullable_to_non_nullable
              as bool,
      orderAsc: null == orderAsc
          ? _value.orderAsc
          : orderAsc // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecieTabStateImplCopyWith<$Res>
    implements $SpecieTabStateCopyWith<$Res> {
  factory _$$SpecieTabStateImplCopyWith(_$SpecieTabStateImpl value,
          $Res Function(_$SpecieTabStateImpl) then) =
      __$$SpecieTabStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Specie> species, bool orderByName, bool orderAsc});
}

/// @nodoc
class __$$SpecieTabStateImplCopyWithImpl<$Res>
    extends _$SpecieTabStateCopyWithImpl<$Res, _$SpecieTabStateImpl>
    implements _$$SpecieTabStateImplCopyWith<$Res> {
  __$$SpecieTabStateImplCopyWithImpl(
      _$SpecieTabStateImpl _value, $Res Function(_$SpecieTabStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? species = null,
    Object? orderByName = null,
    Object? orderAsc = null,
  }) {
    return _then(_$SpecieTabStateImpl(
      species: null == species
          ? _value._species
          : species // ignore: cast_nullable_to_non_nullable
              as List<Specie>,
      orderByName: null == orderByName
          ? _value.orderByName
          : orderByName // ignore: cast_nullable_to_non_nullable
              as bool,
      orderAsc: null == orderAsc
          ? _value.orderAsc
          : orderAsc // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SpecieTabStateImpl implements _SpecieTabState {
  _$SpecieTabStateImpl(
      {final List<Specie> species = const [],
      this.orderByName = true,
      this.orderAsc = true})
      : _species = species;

  final List<Specie> _species;
  @override
  @JsonKey()
  List<Specie> get species {
    if (_species is EqualUnmodifiableListView) return _species;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_species);
  }

  @override
  @JsonKey()
  final bool orderByName;
  @override
  @JsonKey()
  final bool orderAsc;

  @override
  String toString() {
    return 'SpecieTabState(species: $species, orderByName: $orderByName, orderAsc: $orderAsc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecieTabStateImpl &&
            const DeepCollectionEquality().equals(other._species, _species) &&
            (identical(other.orderByName, orderByName) ||
                other.orderByName == orderByName) &&
            (identical(other.orderAsc, orderAsc) ||
                other.orderAsc == orderAsc));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_species), orderByName, orderAsc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecieTabStateImplCopyWith<_$SpecieTabStateImpl> get copyWith =>
      __$$SpecieTabStateImplCopyWithImpl<_$SpecieTabStateImpl>(
          this, _$identity);
}

abstract class _SpecieTabState implements SpecieTabState {
  factory _SpecieTabState(
      {final List<Specie> species,
      final bool orderByName,
      final bool orderAsc}) = _$SpecieTabStateImpl;

  @override
  List<Specie> get species;
  @override
  bool get orderByName;
  @override
  bool get orderAsc;
  @override
  @JsonKey(ignore: true)
  _$$SpecieTabStateImplCopyWith<_$SpecieTabStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
