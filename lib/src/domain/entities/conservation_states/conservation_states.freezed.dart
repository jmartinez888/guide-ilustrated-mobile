// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conservation_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConservationStates _$ConservationStatesFromJson(Map<String, dynamic> json) {
  return _ConservationStates.fromJson(json);
}

/// @nodoc
mixin _$ConservationStates {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'init_state')
  String? get initState => throw _privateConstructorUsedError;
  String? get institution => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConservationStatesCopyWith<ConservationStates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConservationStatesCopyWith<$Res> {
  factory $ConservationStatesCopyWith(
          ConservationStates value, $Res Function(ConservationStates) then) =
      _$ConservationStatesCopyWithImpl<$Res, ConservationStates>;
  @useResult
  $Res call(
      {int id,
      String? name,
      String? description,
      @JsonKey(name: 'init_state') String? initState,
      String? institution,
      String? image,
      String? state});
}

/// @nodoc
class _$ConservationStatesCopyWithImpl<$Res, $Val extends ConservationStates>
    implements $ConservationStatesCopyWith<$Res> {
  _$ConservationStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? initState = freezed,
    Object? institution = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      initState: freezed == initState
          ? _value.initState
          : initState // ignore: cast_nullable_to_non_nullable
              as String?,
      institution: freezed == institution
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ConservationStatesImplCopyWith<$Res>
    implements $ConservationStatesCopyWith<$Res> {
  factory _$$ConservationStatesImplCopyWith(_$ConservationStatesImpl value,
          $Res Function(_$ConservationStatesImpl) then) =
      __$$ConservationStatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      String? description,
      @JsonKey(name: 'init_state') String? initState,
      String? institution,
      String? image,
      String? state});
}

/// @nodoc
class __$$ConservationStatesImplCopyWithImpl<$Res>
    extends _$ConservationStatesCopyWithImpl<$Res, _$ConservationStatesImpl>
    implements _$$ConservationStatesImplCopyWith<$Res> {
  __$$ConservationStatesImplCopyWithImpl(_$ConservationStatesImpl _value,
      $Res Function(_$ConservationStatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? initState = freezed,
    Object? institution = freezed,
    Object? image = freezed,
    Object? state = freezed,
  }) {
    return _then(_$ConservationStatesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      initState: freezed == initState
          ? _value.initState
          : initState // ignore: cast_nullable_to_non_nullable
              as String?,
      institution: freezed == institution
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
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
class _$ConservationStatesImpl implements _ConservationStates {
  _$ConservationStatesImpl(
      {required this.id,
      this.name,
      this.description,
      @JsonKey(name: 'init_state') this.initState,
      this.institution,
      this.image,
      this.state});

  factory _$ConservationStatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConservationStatesImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'init_state')
  final String? initState;
  @override
  final String? institution;
  @override
  final String? image;
  @override
  final String? state;

  @override
  String toString() {
    return 'ConservationStates(id: $id, name: $name, description: $description, initState: $initState, institution: $institution, image: $image, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConservationStatesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.initState, initState) ||
                other.initState == initState) &&
            (identical(other.institution, institution) ||
                other.institution == institution) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, initState, institution, image, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConservationStatesImplCopyWith<_$ConservationStatesImpl> get copyWith =>
      __$$ConservationStatesImplCopyWithImpl<_$ConservationStatesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConservationStatesImplToJson(
      this,
    );
  }
}

abstract class _ConservationStates implements ConservationStates {
  factory _ConservationStates(
      {required final int id,
      final String? name,
      final String? description,
      @JsonKey(name: 'init_state') final String? initState,
      final String? institution,
      final String? image,
      final String? state}) = _$ConservationStatesImpl;

  factory _ConservationStates.fromJson(Map<String, dynamic> json) =
      _$ConservationStatesImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'init_state')
  String? get initState;
  @override
  String? get institution;
  @override
  String? get image;
  @override
  String? get state;
  @override
  @JsonKey(ignore: true)
  _$$ConservationStatesImplCopyWith<_$ConservationStatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
