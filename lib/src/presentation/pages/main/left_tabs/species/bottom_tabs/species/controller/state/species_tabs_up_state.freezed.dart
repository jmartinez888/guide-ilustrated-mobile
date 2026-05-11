// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'species_tabs_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpeciesTabsUpState {
  int get position => throw _privateConstructorUsedError;

  /// Create a copy of SpeciesTabsUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpeciesTabsUpStateCopyWith<SpeciesTabsUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeciesTabsUpStateCopyWith<$Res> {
  factory $SpeciesTabsUpStateCopyWith(
          SpeciesTabsUpState value, $Res Function(SpeciesTabsUpState) then) =
      _$SpeciesTabsUpStateCopyWithImpl<$Res, SpeciesTabsUpState>;
  @useResult
  $Res call({int position});
}

/// @nodoc
class _$SpeciesTabsUpStateCopyWithImpl<$Res, $Val extends SpeciesTabsUpState>
    implements $SpeciesTabsUpStateCopyWith<$Res> {
  _$SpeciesTabsUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpeciesTabsUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpeciesPageTabsUpStateImplCopyWith<$Res>
    implements $SpeciesTabsUpStateCopyWith<$Res> {
  factory _$$SpeciesPageTabsUpStateImplCopyWith(
          _$SpeciesPageTabsUpStateImpl value,
          $Res Function(_$SpeciesPageTabsUpStateImpl) then) =
      __$$SpeciesPageTabsUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int position});
}

/// @nodoc
class __$$SpeciesPageTabsUpStateImplCopyWithImpl<$Res>
    extends _$SpeciesTabsUpStateCopyWithImpl<$Res, _$SpeciesPageTabsUpStateImpl>
    implements _$$SpeciesPageTabsUpStateImplCopyWith<$Res> {
  __$$SpeciesPageTabsUpStateImplCopyWithImpl(
      _$SpeciesPageTabsUpStateImpl _value,
      $Res Function(_$SpeciesPageTabsUpStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeciesTabsUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_$SpeciesPageTabsUpStateImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SpeciesPageTabsUpStateImpl implements _SpeciesPageTabsUpState {
  _$SpeciesPageTabsUpStateImpl({this.position = 0});

  @override
  @JsonKey()
  final int position;

  @override
  String toString() {
    return 'SpeciesTabsUpState(position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeciesPageTabsUpStateImpl &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  /// Create a copy of SpeciesTabsUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeciesPageTabsUpStateImplCopyWith<_$SpeciesPageTabsUpStateImpl>
      get copyWith => __$$SpeciesPageTabsUpStateImplCopyWithImpl<
          _$SpeciesPageTabsUpStateImpl>(this, _$identity);
}

abstract class _SpeciesPageTabsUpState implements SpeciesTabsUpState {
  factory _SpeciesPageTabsUpState({final int position}) =
      _$SpeciesPageTabsUpStateImpl;

  @override
  int get position;

  /// Create a copy of SpeciesTabsUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeciesPageTabsUpStateImplCopyWith<_$SpeciesPageTabsUpStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
