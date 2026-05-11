// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommunityDetailsState {
  Map<String, Community> get mapOfId => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  /// Create a copy of CommunityDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityDetailsStateCopyWith<CommunityDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityDetailsStateCopyWith<$Res> {
  factory $CommunityDetailsStateCopyWith(CommunityDetailsState value,
          $Res Function(CommunityDetailsState) then) =
      _$CommunityDetailsStateCopyWithImpl<$Res, CommunityDetailsState>;
  @useResult
  $Res call({Map<String, Community> mapOfId, bool loading});
}

/// @nodoc
class _$CommunityDetailsStateCopyWithImpl<$Res,
        $Val extends CommunityDetailsState>
    implements $CommunityDetailsStateCopyWith<$Res> {
  _$CommunityDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityDetailsState
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
              as Map<String, Community>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityDetailsStateImplCopyWith<$Res>
    implements $CommunityDetailsStateCopyWith<$Res> {
  factory _$$CommunityDetailsStateImplCopyWith(
          _$CommunityDetailsStateImpl value,
          $Res Function(_$CommunityDetailsStateImpl) then) =
      __$$CommunityDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, Community> mapOfId, bool loading});
}

/// @nodoc
class __$$CommunityDetailsStateImplCopyWithImpl<$Res>
    extends _$CommunityDetailsStateCopyWithImpl<$Res,
        _$CommunityDetailsStateImpl>
    implements _$$CommunityDetailsStateImplCopyWith<$Res> {
  __$$CommunityDetailsStateImplCopyWithImpl(_$CommunityDetailsStateImpl _value,
      $Res Function(_$CommunityDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapOfId = null,
    Object? loading = null,
  }) {
    return _then(_$CommunityDetailsStateImpl(
      mapOfId: null == mapOfId
          ? _value._mapOfId
          : mapOfId // ignore: cast_nullable_to_non_nullable
              as Map<String, Community>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CommunityDetailsStateImpl implements _CommunityDetailsState {
  _$CommunityDetailsStateImpl(
      {final Map<String, Community> mapOfId = const {}, this.loading = true})
      : _mapOfId = mapOfId;

  final Map<String, Community> _mapOfId;
  @override
  @JsonKey()
  Map<String, Community> get mapOfId {
    if (_mapOfId is EqualUnmodifiableMapView) return _mapOfId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mapOfId);
  }

  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'CommunityDetailsState(mapOfId: $mapOfId, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityDetailsStateImpl &&
            const DeepCollectionEquality().equals(other._mapOfId, _mapOfId) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_mapOfId), loading);

  /// Create a copy of CommunityDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityDetailsStateImplCopyWith<_$CommunityDetailsStateImpl>
      get copyWith => __$$CommunityDetailsStateImplCopyWithImpl<
          _$CommunityDetailsStateImpl>(this, _$identity);
}

abstract class _CommunityDetailsState implements CommunityDetailsState {
  factory _CommunityDetailsState(
      {final Map<String, Community> mapOfId,
      final bool loading}) = _$CommunityDetailsStateImpl;

  @override
  Map<String, Community> get mapOfId;
  @override
  bool get loading;

  /// Create a copy of CommunityDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityDetailsStateImplCopyWith<_$CommunityDetailsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
