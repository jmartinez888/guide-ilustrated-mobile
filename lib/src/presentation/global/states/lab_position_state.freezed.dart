// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lab_position_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TabPositionState {
  int get position => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabPositionStateCopyWith<TabPositionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabPositionStateCopyWith<$Res> {
  factory $TabPositionStateCopyWith(
          TabPositionState value, $Res Function(TabPositionState) then) =
      _$TabPositionStateCopyWithImpl<$Res, TabPositionState>;
  @useResult
  $Res call({int position});
}

/// @nodoc
class _$TabPositionStateCopyWithImpl<$Res, $Val extends TabPositionState>
    implements $TabPositionStateCopyWith<$Res> {
  _$TabPositionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$TabPositionStateImplCopyWith<$Res>
    implements $TabPositionStateCopyWith<$Res> {
  factory _$$TabPositionStateImplCopyWith(_$TabPositionStateImpl value,
          $Res Function(_$TabPositionStateImpl) then) =
      __$$TabPositionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int position});
}

/// @nodoc
class __$$TabPositionStateImplCopyWithImpl<$Res>
    extends _$TabPositionStateCopyWithImpl<$Res, _$TabPositionStateImpl>
    implements _$$TabPositionStateImplCopyWith<$Res> {
  __$$TabPositionStateImplCopyWithImpl(_$TabPositionStateImpl _value,
      $Res Function(_$TabPositionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_$TabPositionStateImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TabPositionStateImpl implements _TabPositionState {
  _$TabPositionStateImpl({this.position = 0});

  @override
  @JsonKey()
  final int position;

  @override
  String toString() {
    return 'TabPositionState(position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabPositionStateImpl &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabPositionStateImplCopyWith<_$TabPositionStateImpl> get copyWith =>
      __$$TabPositionStateImplCopyWithImpl<_$TabPositionStateImpl>(
          this, _$identity);
}

abstract class _TabPositionState implements TabPositionState {
  factory _TabPositionState({final int position}) = _$TabPositionStateImpl;

  @override
  int get position;
  @override
  @JsonKey(ignore: true)
  _$$TabPositionStateImplCopyWith<_$TabPositionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
