// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(FirebaseRequestFailure firebaseError) failed,
    required TResult Function(UserC user) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FirebaseRequestFailure firebaseError)? failed,
    TResult? Function(UserC user)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FirebaseRequestFailure firebaseError)? failed,
    TResult Function(UserC user)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProfileStateLoading value) loading,
    required TResult Function(_ProfileStateFailed value) failed,
    required TResult Function(_ProfileStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProfileStateLoading value)? loading,
    TResult? Function(_ProfileStateFailed value)? failed,
    TResult? Function(_ProfileStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileStateLoading value)? loading,
    TResult Function(_ProfileStateFailed value)? failed,
    TResult Function(_ProfileStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProfileStateLoadingImplCopyWith<$Res> {
  factory _$$ProfileStateLoadingImplCopyWith(_$ProfileStateLoadingImpl value,
          $Res Function(_$ProfileStateLoadingImpl) then) =
      __$$ProfileStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileStateLoadingImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateLoadingImpl>
    implements _$$ProfileStateLoadingImplCopyWith<$Res> {
  __$$ProfileStateLoadingImplCopyWithImpl(_$ProfileStateLoadingImpl _value,
      $Res Function(_$ProfileStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileStateLoadingImpl implements _ProfileStateLoading {
  _$ProfileStateLoadingImpl();

  @override
  String toString() {
    return 'ProfileState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(FirebaseRequestFailure firebaseError) failed,
    required TResult Function(UserC user) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FirebaseRequestFailure firebaseError)? failed,
    TResult? Function(UserC user)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FirebaseRequestFailure firebaseError)? failed,
    TResult Function(UserC user)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProfileStateLoading value) loading,
    required TResult Function(_ProfileStateFailed value) failed,
    required TResult Function(_ProfileStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProfileStateLoading value)? loading,
    TResult? Function(_ProfileStateFailed value)? failed,
    TResult? Function(_ProfileStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileStateLoading value)? loading,
    TResult Function(_ProfileStateFailed value)? failed,
    TResult Function(_ProfileStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ProfileStateLoading implements ProfileState {
  factory _ProfileStateLoading() = _$ProfileStateLoadingImpl;
}

/// @nodoc
abstract class _$$ProfileStateFailedImplCopyWith<$Res> {
  factory _$$ProfileStateFailedImplCopyWith(_$ProfileStateFailedImpl value,
          $Res Function(_$ProfileStateFailedImpl) then) =
      __$$ProfileStateFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FirebaseRequestFailure firebaseError});

  $FirebaseRequestFailureCopyWith<$Res> get firebaseError;
}

/// @nodoc
class __$$ProfileStateFailedImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateFailedImpl>
    implements _$$ProfileStateFailedImplCopyWith<$Res> {
  __$$ProfileStateFailedImplCopyWithImpl(_$ProfileStateFailedImpl _value,
      $Res Function(_$ProfileStateFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firebaseError = null,
  }) {
    return _then(_$ProfileStateFailedImpl(
      null == firebaseError
          ? _value.firebaseError
          : firebaseError // ignore: cast_nullable_to_non_nullable
              as FirebaseRequestFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FirebaseRequestFailureCopyWith<$Res> get firebaseError {
    return $FirebaseRequestFailureCopyWith<$Res>(_value.firebaseError, (value) {
      return _then(_value.copyWith(firebaseError: value));
    });
  }
}

/// @nodoc

class _$ProfileStateFailedImpl implements _ProfileStateFailed {
  _$ProfileStateFailedImpl(this.firebaseError);

  @override
  final FirebaseRequestFailure firebaseError;

  @override
  String toString() {
    return 'ProfileState.failed(firebaseError: $firebaseError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateFailedImpl &&
            (identical(other.firebaseError, firebaseError) ||
                other.firebaseError == firebaseError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firebaseError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateFailedImplCopyWith<_$ProfileStateFailedImpl> get copyWith =>
      __$$ProfileStateFailedImplCopyWithImpl<_$ProfileStateFailedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(FirebaseRequestFailure firebaseError) failed,
    required TResult Function(UserC user) loaded,
  }) {
    return failed(firebaseError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FirebaseRequestFailure firebaseError)? failed,
    TResult? Function(UserC user)? loaded,
  }) {
    return failed?.call(firebaseError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FirebaseRequestFailure firebaseError)? failed,
    TResult Function(UserC user)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(firebaseError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProfileStateLoading value) loading,
    required TResult Function(_ProfileStateFailed value) failed,
    required TResult Function(_ProfileStateLoaded value) loaded,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProfileStateLoading value)? loading,
    TResult? Function(_ProfileStateFailed value)? failed,
    TResult? Function(_ProfileStateLoaded value)? loaded,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileStateLoading value)? loading,
    TResult Function(_ProfileStateFailed value)? failed,
    TResult Function(_ProfileStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _ProfileStateFailed implements ProfileState {
  factory _ProfileStateFailed(final FirebaseRequestFailure firebaseError) =
      _$ProfileStateFailedImpl;

  FirebaseRequestFailure get firebaseError;
  @JsonKey(ignore: true)
  _$$ProfileStateFailedImplCopyWith<_$ProfileStateFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileStateLoadedImplCopyWith<$Res> {
  factory _$$ProfileStateLoadedImplCopyWith(_$ProfileStateLoadedImpl value,
          $Res Function(_$ProfileStateLoadedImpl) then) =
      __$$ProfileStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserC user});

  $UserCCopyWith<$Res> get user;
}

/// @nodoc
class __$$ProfileStateLoadedImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateLoadedImpl>
    implements _$$ProfileStateLoadedImplCopyWith<$Res> {
  __$$ProfileStateLoadedImplCopyWithImpl(_$ProfileStateLoadedImpl _value,
      $Res Function(_$ProfileStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$ProfileStateLoadedImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserC,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCCopyWith<$Res> get user {
    return $UserCCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$ProfileStateLoadedImpl implements _ProfileStateLoaded {
  _$ProfileStateLoadedImpl(this.user);

  @override
  final UserC user;

  @override
  String toString() {
    return 'ProfileState.loaded(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateLoadedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateLoadedImplCopyWith<_$ProfileStateLoadedImpl> get copyWith =>
      __$$ProfileStateLoadedImplCopyWithImpl<_$ProfileStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(FirebaseRequestFailure firebaseError) failed,
    required TResult Function(UserC user) loaded,
  }) {
    return loaded(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FirebaseRequestFailure firebaseError)? failed,
    TResult? Function(UserC user)? loaded,
  }) {
    return loaded?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FirebaseRequestFailure firebaseError)? failed,
    TResult Function(UserC user)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProfileStateLoading value) loading,
    required TResult Function(_ProfileStateFailed value) failed,
    required TResult Function(_ProfileStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProfileStateLoading value)? loading,
    TResult? Function(_ProfileStateFailed value)? failed,
    TResult? Function(_ProfileStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileStateLoading value)? loading,
    TResult Function(_ProfileStateFailed value)? failed,
    TResult Function(_ProfileStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _ProfileStateLoaded implements ProfileState {
  factory _ProfileStateLoaded(final UserC user) = _$ProfileStateLoadedImpl;

  UserC get user;
  @JsonKey(ignore: true)
  _$$ProfileStateLoadedImplCopyWith<_$ProfileStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
