// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return _Author.fromJson(json);
}

/// @nodoc
mixin _$Author {
  @JsonKey(name: 'id_autor')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'ano_nacimiento_autor')
  String? get yearOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'ano_deceso_autor')
  String? get yearofDeath => throw _privateConstructorUsedError;
  @JsonKey(name: 'biografia_autor')
  String? get biography => throw _privateConstructorUsedError;
  @JsonKey(name: 'profesion_autor')
  String? get profession => throw _privateConstructorUsedError;
  @JsonKey(name: 'imagen_autor')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'estado_autor')
  String? get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorCopyWith<Author> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) then) =
      _$AuthorCopyWithImpl<$Res, Author>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_autor') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'ano_nacimiento_autor') String? yearOfBirth,
      @JsonKey(name: 'ano_deceso_autor') String? yearofDeath,
      @JsonKey(name: 'biografia_autor') String? biography,
      @JsonKey(name: 'profesion_autor') String? profession,
      @JsonKey(name: 'imagen_autor') String? image,
      @JsonKey(name: 'estado_autor') String? state});
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res, $Val extends Author>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? yearOfBirth = freezed,
    Object? yearofDeath = freezed,
    Object? biography = freezed,
    Object? profession = freezed,
    Object? image = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      yearOfBirth: freezed == yearOfBirth
          ? _value.yearOfBirth
          : yearOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      yearofDeath: freezed == yearofDeath
          ? _value.yearofDeath
          : yearofDeath // ignore: cast_nullable_to_non_nullable
              as String?,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorImplCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$$AuthorImplCopyWith(
          _$AuthorImpl value, $Res Function(_$AuthorImpl) then) =
      __$$AuthorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_autor') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'ano_nacimiento_autor') String? yearOfBirth,
      @JsonKey(name: 'ano_deceso_autor') String? yearofDeath,
      @JsonKey(name: 'biografia_autor') String? biography,
      @JsonKey(name: 'profesion_autor') String? profession,
      @JsonKey(name: 'imagen_autor') String? image,
      @JsonKey(name: 'estado_autor') String? state});
}

/// @nodoc
class __$$AuthorImplCopyWithImpl<$Res>
    extends _$AuthorCopyWithImpl<$Res, _$AuthorImpl>
    implements _$$AuthorImplCopyWith<$Res> {
  __$$AuthorImplCopyWithImpl(
      _$AuthorImpl _value, $Res Function(_$AuthorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? yearOfBirth = freezed,
    Object? yearofDeath = freezed,
    Object? biography = freezed,
    Object? profession = freezed,
    Object? image = freezed,
    Object? state = freezed,
  }) {
    return _then(_$AuthorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      yearOfBirth: freezed == yearOfBirth
          ? _value.yearOfBirth
          : yearOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      yearofDeath: freezed == yearofDeath
          ? _value.yearofDeath
          : yearofDeath // ignore: cast_nullable_to_non_nullable
              as String?,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorImpl implements _Author {
  _$AuthorImpl(
      {@JsonKey(name: 'id_autor') required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'ano_nacimiento_autor') this.yearOfBirth,
      @JsonKey(name: 'ano_deceso_autor') this.yearofDeath,
      @JsonKey(name: 'biografia_autor') this.biography,
      @JsonKey(name: 'profesion_autor') this.profession,
      @JsonKey(name: 'imagen_autor') this.image,
      @JsonKey(name: 'estado_autor') this.state});

  factory _$AuthorImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorImplFromJson(json);

  @override
  @JsonKey(name: 'id_autor')
  final int id;
  @override
  @JsonKey(name: 'vc_nombre')
  final String? name;
  @override
  @JsonKey(name: 'ano_nacimiento_autor')
  final String? yearOfBirth;
  @override
  @JsonKey(name: 'ano_deceso_autor')
  final String? yearofDeath;
  @override
  @JsonKey(name: 'biografia_autor')
  final String? biography;
  @override
  @JsonKey(name: 'profesion_autor')
  final String? profession;
  @override
  @JsonKey(name: 'imagen_autor')
  final String? image;
  @override
  @JsonKey(name: 'estado_autor')
  final String? state;

  @override
  String toString() {
    return 'Author(id: $id, name: $name, yearOfBirth: $yearOfBirth, yearofDeath: $yearofDeath, biography: $biography, profession: $profession, image: $image, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.yearOfBirth, yearOfBirth) ||
                other.yearOfBirth == yearOfBirth) &&
            (identical(other.yearofDeath, yearofDeath) ||
                other.yearofDeath == yearofDeath) &&
            (identical(other.biography, biography) ||
                other.biography == biography) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, yearOfBirth,
      yearofDeath, biography, profession, image, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorImplCopyWith<_$AuthorImpl> get copyWith =>
      __$$AuthorImplCopyWithImpl<_$AuthorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorImplToJson(
      this,
    );
  }
}

abstract class _Author implements Author {
  factory _Author(
      {@JsonKey(name: 'id_autor') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name,
      @JsonKey(name: 'ano_nacimiento_autor') final String? yearOfBirth,
      @JsonKey(name: 'ano_deceso_autor') final String? yearofDeath,
      @JsonKey(name: 'biografia_autor') final String? biography,
      @JsonKey(name: 'profesion_autor') final String? profession,
      @JsonKey(name: 'imagen_autor') final String? image,
      @JsonKey(name: 'estado_autor') final String? state}) = _$AuthorImpl;

  factory _Author.fromJson(Map<String, dynamic> json) = _$AuthorImpl.fromJson;

  @override
  @JsonKey(name: 'id_autor')
  int get id;
  @override
  @JsonKey(name: 'vc_nombre')
  String? get name;
  @override
  @JsonKey(name: 'ano_nacimiento_autor')
  String? get yearOfBirth;
  @override
  @JsonKey(name: 'ano_deceso_autor')
  String? get yearofDeath;
  @override
  @JsonKey(name: 'biografia_autor')
  String? get biography;
  @override
  @JsonKey(name: 'profesion_autor')
  String? get profession;
  @override
  @JsonKey(name: 'imagen_autor')
  String? get image;
  @override
  @JsonKey(name: 'estado_autor')
  String? get state;
  @override
  @JsonKey(ignore: true)
  _$$AuthorImplCopyWith<_$AuthorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
