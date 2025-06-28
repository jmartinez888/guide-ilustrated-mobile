// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthorDetailsState {
  Map<String, Author> get mapOfId => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  /// Create a copy of AuthorDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorDetailsStateCopyWith<AuthorDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorDetailsStateCopyWith<$Res> {
  factory $AuthorDetailsStateCopyWith(
          AuthorDetailsState value, $Res Function(AuthorDetailsState) then) =
      _$AuthorDetailsStateCopyWithImpl<$Res, AuthorDetailsState>;
  @useResult
  $Res call({Map<String, Author> mapOfId, bool loading});
}

/// @nodoc
class _$AuthorDetailsStateCopyWithImpl<$Res, $Val extends AuthorDetailsState>
    implements $AuthorDetailsStateCopyWith<$Res> {
  _$AuthorDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthorDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapOfId = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      mapOfId: null == mapOfId
          ? _value.mapOfId
          : mapOfId // ignore: cast_nullable_to_non_nullable
              as Map<String, Author>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorDetailsStateImplCopyWith<$Res>
    implements $AuthorDetailsStateCopyWith<$Res> {
  factory _$$AuthorDetailsStateImplCopyWith(_$AuthorDetailsStateImpl value,
          $Res Function(_$AuthorDetailsStateImpl) then) =
      __$$AuthorDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, Author> mapOfId, bool loading});
}

/// @nodoc
class __$$AuthorDetailsStateImplCopyWithImpl<$Res>
    extends _$AuthorDetailsStateCopyWithImpl<$Res, _$AuthorDetailsStateImpl>
    implements _$$AuthorDetailsStateImplCopyWith<$Res> {
  __$$AuthorDetailsStateImplCopyWithImpl(_$AuthorDetailsStateImpl _value,
      $Res Function(_$AuthorDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthorDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapOfId = null,
    Object? loading = null,
  }) {
    return _then(_$AuthorDetailsStateImpl(
      mapOfId: null == mapOfId
          ? _value._mapOfId
          : mapOfId // ignore: cast_nullable_to_non_nullable
              as Map<String, Author>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthorDetailsStateImpl implements _AuthorDetailsState {
  _$AuthorDetailsStateImpl(
      {final Map<String, Author> mapOfId = const {}, this.loading = true})
      : _mapOfId = mapOfId;

  final Map<String, Author> _mapOfId;
  @override
  @JsonKey()
  Map<String, Author> get mapOfId {
    if (_mapOfId is EqualUnmodifiableMapView) return _mapOfId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mapOfId);
  }

  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'AuthorDetailsState(mapOfId: $mapOfId, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorDetailsStateImpl &&
            const DeepCollectionEquality().equals(other._mapOfId, _mapOfId) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_mapOfId), loading);

  /// Create a copy of AuthorDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorDetailsStateImplCopyWith<_$AuthorDetailsStateImpl> get copyWith =>
      __$$AuthorDetailsStateImplCopyWithImpl<_$AuthorDetailsStateImpl>(
          this, _$identity);
}

abstract class _AuthorDetailsState implements AuthorDetailsState {
  factory _AuthorDetailsState(
      {final Map<String, Author> mapOfId,
      final bool loading}) = _$AuthorDetailsStateImpl;

  @override
  Map<String, Author> get mapOfId;
  @override
  bool get loading;

  /// Create a copy of AuthorDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorDetailsStateImplCopyWith<_$AuthorDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
