// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_request_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FirebaseRequestFailure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) unknown,
    required TResult Function(String message) empty,
    required TResult Function(String message) denied,
    required TResult Function(String message) timeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? unknown,
    TResult? Function(String message)? empty,
    TResult? Function(String message)? denied,
    TResult? Function(String message)? timeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? unknown,
    TResult Function(String message)? empty,
    TResult Function(String message)? denied,
    TResult Function(String message)? timeout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseRequestFailureNetwork value) network,
    required TResult Function(_FirebaseRequestFailureUnknown value) unknown,
    required TResult Function(_FirebaseRequestFailureEmpty value) empty,
    required TResult Function(_FirebaseRequestFailureDenied value) denied,
    required TResult Function(_FirebaseRequestFailureTimeout value) timeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirebaseRequestFailureNetwork value)? network,
    TResult? Function(_FirebaseRequestFailureUnknown value)? unknown,
    TResult? Function(_FirebaseRequestFailureEmpty value)? empty,
    TResult? Function(_FirebaseRequestFailureDenied value)? denied,
    TResult? Function(_FirebaseRequestFailureTimeout value)? timeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseRequestFailureNetwork value)? network,
    TResult Function(_FirebaseRequestFailureUnknown value)? unknown,
    TResult Function(_FirebaseRequestFailureEmpty value)? empty,
    TResult Function(_FirebaseRequestFailureDenied value)? denied,
    TResult Function(_FirebaseRequestFailureTimeout value)? timeout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FirebaseRequestFailureCopyWith<FirebaseRequestFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseRequestFailureCopyWith<$Res> {
  factory $FirebaseRequestFailureCopyWith(FirebaseRequestFailure value,
          $Res Function(FirebaseRequestFailure) then) =
      _$FirebaseRequestFailureCopyWithImpl<$Res, FirebaseRequestFailure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FirebaseRequestFailureCopyWithImpl<$Res,
        $Val extends FirebaseRequestFailure>
    implements $FirebaseRequestFailureCopyWith<$Res> {
  _$FirebaseRequestFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirebaseRequestFailureNetworkImplCopyWith<$Res>
    implements $FirebaseRequestFailureCopyWith<$Res> {
  factory _$$FirebaseRequestFailureNetworkImplCopyWith(
          _$FirebaseRequestFailureNetworkImpl value,
          $Res Function(_$FirebaseRequestFailureNetworkImpl) then) =
      __$$FirebaseRequestFailureNetworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FirebaseRequestFailureNetworkImplCopyWithImpl<$Res>
    extends _$FirebaseRequestFailureCopyWithImpl<$Res,
        _$FirebaseRequestFailureNetworkImpl>
    implements _$$FirebaseRequestFailureNetworkImplCopyWith<$Res> {
  __$$FirebaseRequestFailureNetworkImplCopyWithImpl(
      _$FirebaseRequestFailureNetworkImpl _value,
      $Res Function(_$FirebaseRequestFailureNetworkImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FirebaseRequestFailureNetworkImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirebaseRequestFailureNetworkImpl
    implements _FirebaseRequestFailureNetwork {
  _$FirebaseRequestFailureNetworkImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FirebaseRequestFailure.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseRequestFailureNetworkImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseRequestFailureNetworkImplCopyWith<
          _$FirebaseRequestFailureNetworkImpl>
      get copyWith => __$$FirebaseRequestFailureNetworkImplCopyWithImpl<
          _$FirebaseRequestFailureNetworkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) unknown,
    required TResult Function(String message) empty,
    required TResult Function(String message) denied,
    required TResult Function(String message) timeout,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? unknown,
    TResult? Function(String message)? empty,
    TResult? Function(String message)? denied,
    TResult? Function(String message)? timeout,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? unknown,
    TResult Function(String message)? empty,
    TResult Function(String message)? denied,
    TResult Function(String message)? timeout,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseRequestFailureNetwork value) network,
    required TResult Function(_FirebaseRequestFailureUnknown value) unknown,
    required TResult Function(_FirebaseRequestFailureEmpty value) empty,
    required TResult Function(_FirebaseRequestFailureDenied value) denied,
    required TResult Function(_FirebaseRequestFailureTimeout value) timeout,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirebaseRequestFailureNetwork value)? network,
    TResult? Function(_FirebaseRequestFailureUnknown value)? unknown,
    TResult? Function(_FirebaseRequestFailureEmpty value)? empty,
    TResult? Function(_FirebaseRequestFailureDenied value)? denied,
    TResult? Function(_FirebaseRequestFailureTimeout value)? timeout,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseRequestFailureNetwork value)? network,
    TResult Function(_FirebaseRequestFailureUnknown value)? unknown,
    TResult Function(_FirebaseRequestFailureEmpty value)? empty,
    TResult Function(_FirebaseRequestFailureDenied value)? denied,
    TResult Function(_FirebaseRequestFailureTimeout value)? timeout,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class _FirebaseRequestFailureNetwork
    implements FirebaseRequestFailure {
  factory _FirebaseRequestFailureNetwork(final String message) =
      _$FirebaseRequestFailureNetworkImpl;

  @override
  String get message;

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseRequestFailureNetworkImplCopyWith<
          _$FirebaseRequestFailureNetworkImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirebaseRequestFailureUnknownImplCopyWith<$Res>
    implements $FirebaseRequestFailureCopyWith<$Res> {
  factory _$$FirebaseRequestFailureUnknownImplCopyWith(
          _$FirebaseRequestFailureUnknownImpl value,
          $Res Function(_$FirebaseRequestFailureUnknownImpl) then) =
      __$$FirebaseRequestFailureUnknownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FirebaseRequestFailureUnknownImplCopyWithImpl<$Res>
    extends _$FirebaseRequestFailureCopyWithImpl<$Res,
        _$FirebaseRequestFailureUnknownImpl>
    implements _$$FirebaseRequestFailureUnknownImplCopyWith<$Res> {
  __$$FirebaseRequestFailureUnknownImplCopyWithImpl(
      _$FirebaseRequestFailureUnknownImpl _value,
      $Res Function(_$FirebaseRequestFailureUnknownImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FirebaseRequestFailureUnknownImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirebaseRequestFailureUnknownImpl
    implements _FirebaseRequestFailureUnknown {
  _$FirebaseRequestFailureUnknownImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FirebaseRequestFailure.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseRequestFailureUnknownImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseRequestFailureUnknownImplCopyWith<
          _$FirebaseRequestFailureUnknownImpl>
      get copyWith => __$$FirebaseRequestFailureUnknownImplCopyWithImpl<
          _$FirebaseRequestFailureUnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) unknown,
    required TResult Function(String message) empty,
    required TResult Function(String message) denied,
    required TResult Function(String message) timeout,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? unknown,
    TResult? Function(String message)? empty,
    TResult? Function(String message)? denied,
    TResult? Function(String message)? timeout,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? unknown,
    TResult Function(String message)? empty,
    TResult Function(String message)? denied,
    TResult Function(String message)? timeout,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseRequestFailureNetwork value) network,
    required TResult Function(_FirebaseRequestFailureUnknown value) unknown,
    required TResult Function(_FirebaseRequestFailureEmpty value) empty,
    required TResult Function(_FirebaseRequestFailureDenied value) denied,
    required TResult Function(_FirebaseRequestFailureTimeout value) timeout,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirebaseRequestFailureNetwork value)? network,
    TResult? Function(_FirebaseRequestFailureUnknown value)? unknown,
    TResult? Function(_FirebaseRequestFailureEmpty value)? empty,
    TResult? Function(_FirebaseRequestFailureDenied value)? denied,
    TResult? Function(_FirebaseRequestFailureTimeout value)? timeout,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseRequestFailureNetwork value)? network,
    TResult Function(_FirebaseRequestFailureUnknown value)? unknown,
    TResult Function(_FirebaseRequestFailureEmpty value)? empty,
    TResult Function(_FirebaseRequestFailureDenied value)? denied,
    TResult Function(_FirebaseRequestFailureTimeout value)? timeout,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _FirebaseRequestFailureUnknown
    implements FirebaseRequestFailure {
  factory _FirebaseRequestFailureUnknown(final String message) =
      _$FirebaseRequestFailureUnknownImpl;

  @override
  String get message;

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseRequestFailureUnknownImplCopyWith<
          _$FirebaseRequestFailureUnknownImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirebaseRequestFailureEmptyImplCopyWith<$Res>
    implements $FirebaseRequestFailureCopyWith<$Res> {
  factory _$$FirebaseRequestFailureEmptyImplCopyWith(
          _$FirebaseRequestFailureEmptyImpl value,
          $Res Function(_$FirebaseRequestFailureEmptyImpl) then) =
      __$$FirebaseRequestFailureEmptyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FirebaseRequestFailureEmptyImplCopyWithImpl<$Res>
    extends _$FirebaseRequestFailureCopyWithImpl<$Res,
        _$FirebaseRequestFailureEmptyImpl>
    implements _$$FirebaseRequestFailureEmptyImplCopyWith<$Res> {
  __$$FirebaseRequestFailureEmptyImplCopyWithImpl(
      _$FirebaseRequestFailureEmptyImpl _value,
      $Res Function(_$FirebaseRequestFailureEmptyImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FirebaseRequestFailureEmptyImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirebaseRequestFailureEmptyImpl
    implements _FirebaseRequestFailureEmpty {
  _$FirebaseRequestFailureEmptyImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FirebaseRequestFailure.empty(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseRequestFailureEmptyImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseRequestFailureEmptyImplCopyWith<_$FirebaseRequestFailureEmptyImpl>
      get copyWith => __$$FirebaseRequestFailureEmptyImplCopyWithImpl<
          _$FirebaseRequestFailureEmptyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) unknown,
    required TResult Function(String message) empty,
    required TResult Function(String message) denied,
    required TResult Function(String message) timeout,
  }) {
    return empty(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? unknown,
    TResult? Function(String message)? empty,
    TResult? Function(String message)? denied,
    TResult? Function(String message)? timeout,
  }) {
    return empty?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? unknown,
    TResult Function(String message)? empty,
    TResult Function(String message)? denied,
    TResult Function(String message)? timeout,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseRequestFailureNetwork value) network,
    required TResult Function(_FirebaseRequestFailureUnknown value) unknown,
    required TResult Function(_FirebaseRequestFailureEmpty value) empty,
    required TResult Function(_FirebaseRequestFailureDenied value) denied,
    required TResult Function(_FirebaseRequestFailureTimeout value) timeout,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirebaseRequestFailureNetwork value)? network,
    TResult? Function(_FirebaseRequestFailureUnknown value)? unknown,
    TResult? Function(_FirebaseRequestFailureEmpty value)? empty,
    TResult? Function(_FirebaseRequestFailureDenied value)? denied,
    TResult? Function(_FirebaseRequestFailureTimeout value)? timeout,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseRequestFailureNetwork value)? network,
    TResult Function(_FirebaseRequestFailureUnknown value)? unknown,
    TResult Function(_FirebaseRequestFailureEmpty value)? empty,
    TResult Function(_FirebaseRequestFailureDenied value)? denied,
    TResult Function(_FirebaseRequestFailureTimeout value)? timeout,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _FirebaseRequestFailureEmpty implements FirebaseRequestFailure {
  factory _FirebaseRequestFailureEmpty(final String message) =
      _$FirebaseRequestFailureEmptyImpl;

  @override
  String get message;

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseRequestFailureEmptyImplCopyWith<_$FirebaseRequestFailureEmptyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirebaseRequestFailureDeniedImplCopyWith<$Res>
    implements $FirebaseRequestFailureCopyWith<$Res> {
  factory _$$FirebaseRequestFailureDeniedImplCopyWith(
          _$FirebaseRequestFailureDeniedImpl value,
          $Res Function(_$FirebaseRequestFailureDeniedImpl) then) =
      __$$FirebaseRequestFailureDeniedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FirebaseRequestFailureDeniedImplCopyWithImpl<$Res>
    extends _$FirebaseRequestFailureCopyWithImpl<$Res,
        _$FirebaseRequestFailureDeniedImpl>
    implements _$$FirebaseRequestFailureDeniedImplCopyWith<$Res> {
  __$$FirebaseRequestFailureDeniedImplCopyWithImpl(
      _$FirebaseRequestFailureDeniedImpl _value,
      $Res Function(_$FirebaseRequestFailureDeniedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FirebaseRequestFailureDeniedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirebaseRequestFailureDeniedImpl
    implements _FirebaseRequestFailureDenied {
  _$FirebaseRequestFailureDeniedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FirebaseRequestFailure.denied(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseRequestFailureDeniedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseRequestFailureDeniedImplCopyWith<
          _$FirebaseRequestFailureDeniedImpl>
      get copyWith => __$$FirebaseRequestFailureDeniedImplCopyWithImpl<
          _$FirebaseRequestFailureDeniedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) unknown,
    required TResult Function(String message) empty,
    required TResult Function(String message) denied,
    required TResult Function(String message) timeout,
  }) {
    return denied(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? unknown,
    TResult? Function(String message)? empty,
    TResult? Function(String message)? denied,
    TResult? Function(String message)? timeout,
  }) {
    return denied?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? unknown,
    TResult Function(String message)? empty,
    TResult Function(String message)? denied,
    TResult Function(String message)? timeout,
    required TResult orElse(),
  }) {
    if (denied != null) {
      return denied(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseRequestFailureNetwork value) network,
    required TResult Function(_FirebaseRequestFailureUnknown value) unknown,
    required TResult Function(_FirebaseRequestFailureEmpty value) empty,
    required TResult Function(_FirebaseRequestFailureDenied value) denied,
    required TResult Function(_FirebaseRequestFailureTimeout value) timeout,
  }) {
    return denied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirebaseRequestFailureNetwork value)? network,
    TResult? Function(_FirebaseRequestFailureUnknown value)? unknown,
    TResult? Function(_FirebaseRequestFailureEmpty value)? empty,
    TResult? Function(_FirebaseRequestFailureDenied value)? denied,
    TResult? Function(_FirebaseRequestFailureTimeout value)? timeout,
  }) {
    return denied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseRequestFailureNetwork value)? network,
    TResult Function(_FirebaseRequestFailureUnknown value)? unknown,
    TResult Function(_FirebaseRequestFailureEmpty value)? empty,
    TResult Function(_FirebaseRequestFailureDenied value)? denied,
    TResult Function(_FirebaseRequestFailureTimeout value)? timeout,
    required TResult orElse(),
  }) {
    if (denied != null) {
      return denied(this);
    }
    return orElse();
  }
}

abstract class _FirebaseRequestFailureDenied implements FirebaseRequestFailure {
  factory _FirebaseRequestFailureDenied(final String message) =
      _$FirebaseRequestFailureDeniedImpl;

  @override
  String get message;

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseRequestFailureDeniedImplCopyWith<
          _$FirebaseRequestFailureDeniedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirebaseRequestFailureTimeoutImplCopyWith<$Res>
    implements $FirebaseRequestFailureCopyWith<$Res> {
  factory _$$FirebaseRequestFailureTimeoutImplCopyWith(
          _$FirebaseRequestFailureTimeoutImpl value,
          $Res Function(_$FirebaseRequestFailureTimeoutImpl) then) =
      __$$FirebaseRequestFailureTimeoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FirebaseRequestFailureTimeoutImplCopyWithImpl<$Res>
    extends _$FirebaseRequestFailureCopyWithImpl<$Res,
        _$FirebaseRequestFailureTimeoutImpl>
    implements _$$FirebaseRequestFailureTimeoutImplCopyWith<$Res> {
  __$$FirebaseRequestFailureTimeoutImplCopyWithImpl(
      _$FirebaseRequestFailureTimeoutImpl _value,
      $Res Function(_$FirebaseRequestFailureTimeoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FirebaseRequestFailureTimeoutImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirebaseRequestFailureTimeoutImpl
    implements _FirebaseRequestFailureTimeout {
  _$FirebaseRequestFailureTimeoutImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FirebaseRequestFailure.timeout(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseRequestFailureTimeoutImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseRequestFailureTimeoutImplCopyWith<
          _$FirebaseRequestFailureTimeoutImpl>
      get copyWith => __$$FirebaseRequestFailureTimeoutImplCopyWithImpl<
          _$FirebaseRequestFailureTimeoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) unknown,
    required TResult Function(String message) empty,
    required TResult Function(String message) denied,
    required TResult Function(String message) timeout,
  }) {
    return timeout(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? unknown,
    TResult? Function(String message)? empty,
    TResult? Function(String message)? denied,
    TResult? Function(String message)? timeout,
  }) {
    return timeout?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? unknown,
    TResult Function(String message)? empty,
    TResult Function(String message)? denied,
    TResult Function(String message)? timeout,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseRequestFailureNetwork value) network,
    required TResult Function(_FirebaseRequestFailureUnknown value) unknown,
    required TResult Function(_FirebaseRequestFailureEmpty value) empty,
    required TResult Function(_FirebaseRequestFailureDenied value) denied,
    required TResult Function(_FirebaseRequestFailureTimeout value) timeout,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirebaseRequestFailureNetwork value)? network,
    TResult? Function(_FirebaseRequestFailureUnknown value)? unknown,
    TResult? Function(_FirebaseRequestFailureEmpty value)? empty,
    TResult? Function(_FirebaseRequestFailureDenied value)? denied,
    TResult? Function(_FirebaseRequestFailureTimeout value)? timeout,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseRequestFailureNetwork value)? network,
    TResult Function(_FirebaseRequestFailureUnknown value)? unknown,
    TResult Function(_FirebaseRequestFailureEmpty value)? empty,
    TResult Function(_FirebaseRequestFailureDenied value)? denied,
    TResult Function(_FirebaseRequestFailureTimeout value)? timeout,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class _FirebaseRequestFailureTimeout
    implements FirebaseRequestFailure {
  factory _FirebaseRequestFailureTimeout(final String message) =
      _$FirebaseRequestFailureTimeoutImpl;

  @override
  String get message;

  /// Create a copy of FirebaseRequestFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseRequestFailureTimeoutImplCopyWith<
          _$FirebaseRequestFailureTimeoutImpl>
      get copyWith => throw _privateConstructorUsedError;
}
