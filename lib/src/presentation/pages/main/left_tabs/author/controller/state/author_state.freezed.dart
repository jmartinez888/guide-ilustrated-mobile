// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthorState {
  List<Author> get authors => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthorStateCopyWith<AuthorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorStateCopyWith<$Res> {
  factory $AuthorStateCopyWith(
          AuthorState value, $Res Function(AuthorState) then) =
      _$AuthorStateCopyWithImpl<$Res, AuthorState>;
  @useResult
  $Res call({List<Author> authors});
}

/// @nodoc
class _$AuthorStateCopyWithImpl<$Res, $Val extends AuthorState>
    implements $AuthorStateCopyWith<$Res> {
  _$AuthorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authors = null,
  }) {
    return _then(_value.copyWith(
      authors: null == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorStateImplCopyWith<$Res>
    implements $AuthorStateCopyWith<$Res> {
  factory _$$AuthorStateImplCopyWith(
          _$AuthorStateImpl value, $Res Function(_$AuthorStateImpl) then) =
      __$$AuthorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Author> authors});
}

/// @nodoc
class __$$AuthorStateImplCopyWithImpl<$Res>
    extends _$AuthorStateCopyWithImpl<$Res, _$AuthorStateImpl>
    implements _$$AuthorStateImplCopyWith<$Res> {
  __$$AuthorStateImplCopyWithImpl(
      _$AuthorStateImpl _value, $Res Function(_$AuthorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authors = null,
  }) {
    return _then(_$AuthorStateImpl(
      authors: null == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>,
    ));
  }
}

/// @nodoc

class _$AuthorStateImpl implements _AuthorState {
  _$AuthorStateImpl({final List<Author> authors = const []})
      : _authors = authors;

  final List<Author> _authors;
  @override
  @JsonKey()
  List<Author> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  @override
  String toString() {
    return 'AuthorState(authors: $authors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorStateImpl &&
            const DeepCollectionEquality().equals(other._authors, _authors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_authors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorStateImplCopyWith<_$AuthorStateImpl> get copyWith =>
      __$$AuthorStateImplCopyWithImpl<_$AuthorStateImpl>(this, _$identity);
}

abstract class _AuthorState implements AuthorState {
  factory _AuthorState({final List<Author> authors}) = _$AuthorStateImpl;

  @override
  List<Author> get authors;
  @override
  @JsonKey(ignore: true)
  _$$AuthorStateImplCopyWith<_$AuthorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
