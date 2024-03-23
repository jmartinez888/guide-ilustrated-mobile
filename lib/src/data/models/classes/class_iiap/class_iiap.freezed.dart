// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_iiap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClassIiap _$ClassIiapFromJson(Map<String, dynamic> json) {
  return _ClassIiap.fromJson(json);
}

/// @nodoc
mixin _$ClassIiap {
  @JsonKey(name: 'id_clase')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_filo')
  int? get idPhylum => throw _privateConstructorUsedError;
  @JsonKey(name: 'ch_estado')
  String? get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassIiapCopyWith<ClassIiap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassIiapCopyWith<$Res> {
  factory $ClassIiapCopyWith(ClassIiap value, $Res Function(ClassIiap) then) =
      _$ClassIiapCopyWithImpl<$Res, ClassIiap>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_clase') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'id_filo') int? idPhylum,
      @JsonKey(name: 'ch_estado') String? state});
}

/// @nodoc
class _$ClassIiapCopyWithImpl<$Res, $Val extends ClassIiap>
    implements $ClassIiapCopyWith<$Res> {
  _$ClassIiapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? idPhylum = freezed,
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
      idPhylum: freezed == idPhylum
          ? _value.idPhylum
          : idPhylum // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassIiapImplCopyWith<$Res>
    implements $ClassIiapCopyWith<$Res> {
  factory _$$ClassIiapImplCopyWith(
          _$ClassIiapImpl value, $Res Function(_$ClassIiapImpl) then) =
      __$$ClassIiapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_clase') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'id_filo') int? idPhylum,
      @JsonKey(name: 'ch_estado') String? state});
}

/// @nodoc
class __$$ClassIiapImplCopyWithImpl<$Res>
    extends _$ClassIiapCopyWithImpl<$Res, _$ClassIiapImpl>
    implements _$$ClassIiapImplCopyWith<$Res> {
  __$$ClassIiapImplCopyWithImpl(
      _$ClassIiapImpl _value, $Res Function(_$ClassIiapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? idPhylum = freezed,
    Object? state = freezed,
  }) {
    return _then(_$ClassIiapImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      idPhylum: freezed == idPhylum
          ? _value.idPhylum
          : idPhylum // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassIiapImpl implements _ClassIiap {
  _$ClassIiapImpl(
      {@JsonKey(name: 'id_clase') required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'id_filo') this.idPhylum,
      @JsonKey(name: 'ch_estado') this.state});

  factory _$ClassIiapImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassIiapImplFromJson(json);

  @override
  @JsonKey(name: 'id_clase')
  final int id;
  @override
  @JsonKey(name: 'vc_nombre')
  final String? name;
  @override
  @JsonKey(name: 'id_filo')
  final int? idPhylum;
  @override
  @JsonKey(name: 'ch_estado')
  final String? state;

  @override
  String toString() {
    return 'ClassIiap(id: $id, name: $name, idPhylum: $idPhylum, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassIiapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.idPhylum, idPhylum) ||
                other.idPhylum == idPhylum) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, idPhylum, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassIiapImplCopyWith<_$ClassIiapImpl> get copyWith =>
      __$$ClassIiapImplCopyWithImpl<_$ClassIiapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassIiapImplToJson(
      this,
    );
  }
}

abstract class _ClassIiap implements ClassIiap {
  factory _ClassIiap(
      {@JsonKey(name: 'id_clase') required final int id,
      @JsonKey(name: 'vc_nombre') final String? name,
      @JsonKey(name: 'id_filo') final int? idPhylum,
      @JsonKey(name: 'ch_estado') final String? state}) = _$ClassIiapImpl;

  factory _ClassIiap.fromJson(Map<String, dynamic> json) =
      _$ClassIiapImpl.fromJson;

  @override
  @JsonKey(name: 'id_clase')
  int get id;
  @override
  @JsonKey(name: 'vc_nombre')
  String? get name;
  @override
  @JsonKey(name: 'id_filo')
  int? get idPhylum;
  @override
  @JsonKey(name: 'ch_estado')
  String? get state;
  @override
  @JsonKey(ignore: true)
  _$$ClassIiapImplCopyWith<_$ClassIiapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
