// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'taxonomy_for_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaxonomyForSearch _$TaxonomyForSearchFromJson(Map<String, dynamic> json) {
  return _TaxonomyForSearch.fromJson(json);
}

/// @nodoc
mixin _$TaxonomyForSearch {
  @JsonKey(name: 'id_taxonomia')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_nombre')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'vc_imagen')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'ch_estado')
  String? get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxonomyForSearchCopyWith<TaxonomyForSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxonomyForSearchCopyWith<$Res> {
  factory $TaxonomyForSearchCopyWith(
          TaxonomyForSearch value, $Res Function(TaxonomyForSearch) then) =
      _$TaxonomyForSearchCopyWithImpl<$Res, TaxonomyForSearch>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_taxonomia') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'vc_imagen') String? image,
      @JsonKey(name: 'ch_estado') String? state});
}

/// @nodoc
class _$TaxonomyForSearchCopyWithImpl<$Res, $Val extends TaxonomyForSearch>
    implements $TaxonomyForSearchCopyWith<$Res> {
  _$TaxonomyForSearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$TaxonomyForSearchImplCopyWith<$Res>
    implements $TaxonomyForSearchCopyWith<$Res> {
  factory _$$TaxonomyForSearchImplCopyWith(_$TaxonomyForSearchImpl value,
          $Res Function(_$TaxonomyForSearchImpl) then) =
      __$$TaxonomyForSearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_taxonomia') int id,
      @JsonKey(name: 'vc_nombre') String? name,
      @JsonKey(name: 'vc_imagen') String? image,
      @JsonKey(name: 'ch_estado') String? state});
}

/// @nodoc
class __$$TaxonomyForSearchImplCopyWithImpl<$Res>
    extends _$TaxonomyForSearchCopyWithImpl<$Res, _$TaxonomyForSearchImpl>
    implements _$$TaxonomyForSearchImplCopyWith<$Res> {
  __$$TaxonomyForSearchImplCopyWithImpl(_$TaxonomyForSearchImpl _value,
      $Res Function(_$TaxonomyForSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? image = freezed,
    Object? state = freezed,
  }) {
    return _then(_$TaxonomyForSearchImpl(
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
class _$TaxonomyForSearchImpl implements _TaxonomyForSearch {
  _$TaxonomyForSearchImpl(
      {@JsonKey(name: 'id_taxonomia') required this.id,
      @JsonKey(name: 'vc_nombre') this.name,
      @JsonKey(name: 'vc_imagen') this.image,
      @JsonKey(name: 'ch_estado') this.state});

  factory _$TaxonomyForSearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxonomyForSearchImplFromJson(json);

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
    return 'TaxonomyForSearch(id: $id, name: $name, image: $image, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxonomyForSearchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxonomyForSearchImplCopyWith<_$TaxonomyForSearchImpl> get copyWith =>
      __$$TaxonomyForSearchImplCopyWithImpl<_$TaxonomyForSearchImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxonomyForSearchImplToJson(
      this,
    );
  }
}

abstract class _TaxonomyForSearch implements TaxonomyForSearch {
  factory _TaxonomyForSearch(
          {@JsonKey(name: 'id_taxonomia') required final int id,
          @JsonKey(name: 'vc_nombre') final String? name,
          @JsonKey(name: 'vc_imagen') final String? image,
          @JsonKey(name: 'ch_estado') final String? state}) =
      _$TaxonomyForSearchImpl;

  factory _TaxonomyForSearch.fromJson(Map<String, dynamic> json) =
      _$TaxonomyForSearchImpl.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$$TaxonomyForSearchImplCopyWith<_$TaxonomyForSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
