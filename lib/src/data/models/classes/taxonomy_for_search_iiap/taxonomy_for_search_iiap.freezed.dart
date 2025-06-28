// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'taxonomy_for_search_iiap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaxonomyForSearchIiap _$TaxonomyForSearchIiapFromJson(
    Map<String, dynamic> json) {
  return _TaxonomyForSearchIiap.fromJson(json);
}

/// @nodoc
mixin _$TaxonomyForSearchIiap {
  @JsonKey(name: 'id_taxonomia')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_imagen')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'ch_estado')
  String? get state => throw _privateConstructorUsedError;

  /// Serializes this TaxonomyForSearchIiap to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaxonomyForSearchIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaxonomyForSearchIiapCopyWith<TaxonomyForSearchIiap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxonomyForSearchIiapCopyWith<$Res> {
  factory $TaxonomyForSearchIiapCopyWith(TaxonomyForSearchIiap value,
          $Res Function(TaxonomyForSearchIiap) then) =
      _$TaxonomyForSearchIiapCopyWithImpl<$Res, TaxonomyForSearchIiap>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_taxonomia') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'vc_imagen') String? image,
      @JsonKey(name: 'ch_estado') String? state});
}

/// @nodoc
class _$TaxonomyForSearchIiapCopyWithImpl<$Res,
        $Val extends TaxonomyForSearchIiap>
    implements $TaxonomyForSearchIiapCopyWith<$Res> {
  _$TaxonomyForSearchIiapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaxonomyForSearchIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
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
abstract class _$$TaxonomyForSearchIiapImplCopyWith<$Res>
    implements $TaxonomyForSearchIiapCopyWith<$Res> {
  factory _$$TaxonomyForSearchIiapImplCopyWith(
          _$TaxonomyForSearchIiapImpl value,
          $Res Function(_$TaxonomyForSearchIiapImpl) then) =
      __$$TaxonomyForSearchIiapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_taxonomia') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'vc_imagen') String? image,
      @JsonKey(name: 'ch_estado') String? state});
}

/// @nodoc
class __$$TaxonomyForSearchIiapImplCopyWithImpl<$Res>
    extends _$TaxonomyForSearchIiapCopyWithImpl<$Res,
        _$TaxonomyForSearchIiapImpl>
    implements _$$TaxonomyForSearchIiapImplCopyWith<$Res> {
  __$$TaxonomyForSearchIiapImplCopyWithImpl(_$TaxonomyForSearchIiapImpl _value,
      $Res Function(_$TaxonomyForSearchIiapImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaxonomyForSearchIiap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? image = freezed,
    Object? state = freezed,
  }) {
    return _then(_$TaxonomyForSearchIiapImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
class _$TaxonomyForSearchIiapImpl implements _TaxonomyForSearchIiap {
  _$TaxonomyForSearchIiapImpl(
      {@JsonKey(name: 'id_taxonomia') required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'vc_imagen') this.image,
      @JsonKey(name: 'ch_estado') this.state});

  factory _$TaxonomyForSearchIiapImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxonomyForSearchIiapImplFromJson(json);

  @override
  @JsonKey(name: 'id_taxonomia')
  final int id;
  @override
  @JsonKey(name: 'vc_nombre')
  final String? name;
  @override
  @JsonKey(name: 'vc_imagen')
  final String? image;
  @override
  @JsonKey(name: 'ch_estado')
  final String? state;

  @override
  String toString() {
    return 'TaxonomyForSearchIiap(id: $id, name: $name, image: $image, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxonomyForSearchIiapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image, state);

  /// Create a copy of TaxonomyForSearchIiap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxonomyForSearchIiapImplCopyWith<_$TaxonomyForSearchIiapImpl>
      get copyWith => __$$TaxonomyForSearchIiapImplCopyWithImpl<
          _$TaxonomyForSearchIiapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxonomyForSearchIiapImplToJson(
      this,
    );
  }
}

abstract class _TaxonomyForSearchIiap implements TaxonomyForSearchIiap {
  factory _TaxonomyForSearchIiap(
          {@JsonKey(name: 'id_taxonomia') required final int id,
          @JsonKey(name: 'vc_nombre') final String? name,
          @JsonKey(name: 'vc_imagen') final String? image,
          @JsonKey(name: 'ch_estado') final String? state}) =
      _$TaxonomyForSearchIiapImpl;

  factory _TaxonomyForSearchIiap.fromJson(Map<String, dynamic> json) =
      _$TaxonomyForSearchIiapImpl.fromJson;

  @override
  @JsonKey(name: 'id_taxonomia')
  int get id;
  @override
  @JsonKey(name: 'vc_nombre')
  String? get name;
  @override
  @JsonKey(name: 'vc_imagen')
  String? get image;
  @override
  @JsonKey(name: 'ch_estado')
  String? get state;

  /// Create a copy of TaxonomyForSearchIiap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaxonomyForSearchIiapImplCopyWith<_$TaxonomyForSearchIiapImpl>
      get copyWith => throw _privateConstructorUsedError;
}
