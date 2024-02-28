// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'taxonomy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Taxonomy _$TaxonomyFromJson(Map<String, dynamic> json) {
  return _Taxonomy.fromJson(json);
}

/// @nodoc
mixin _$Taxonomy {
  @JsonKey(name: 'reino')
  Kingdom? get kingdom => throw _privateConstructorUsedError;
  @JsonKey(name: 'filo')
  Phylum? get phylum => throw _privateConstructorUsedError;
  @JsonKey(name: 'clase')
  ClassC? get classC => throw _privateConstructorUsedError;
  @JsonKey(name: 'orden')
  OrderC? get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'familia')
  Family? get family => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxonomyCopyWith<Taxonomy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxonomyCopyWith<$Res> {
  factory $TaxonomyCopyWith(Taxonomy value, $Res Function(Taxonomy) then) =
      _$TaxonomyCopyWithImpl<$Res, Taxonomy>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reino') Kingdom? kingdom,
      @JsonKey(name: 'filo') Phylum? phylum,
      @JsonKey(name: 'clase') ClassC? classC,
      @JsonKey(name: 'orden') OrderC? order,
      @JsonKey(name: 'familia') Family? family});

  $KingdomCopyWith<$Res>? get kingdom;
  $PhylumCopyWith<$Res>? get phylum;
  $ClassCCopyWith<$Res>? get classC;
  $OrderCCopyWith<$Res>? get order;
  $FamilyCopyWith<$Res>? get family;
}

/// @nodoc
class _$TaxonomyCopyWithImpl<$Res, $Val extends Taxonomy>
    implements $TaxonomyCopyWith<$Res> {
  _$TaxonomyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kingdom = freezed,
    Object? phylum = freezed,
    Object? classC = freezed,
    Object? order = freezed,
    Object? family = freezed,
  }) {
    return _then(_value.copyWith(
      kingdom: freezed == kingdom
          ? _value.kingdom
          : kingdom // ignore: cast_nullable_to_non_nullable
              as Kingdom?,
      phylum: freezed == phylum
          ? _value.phylum
          : phylum // ignore: cast_nullable_to_non_nullable
              as Phylum?,
      classC: freezed == classC
          ? _value.classC
          : classC // ignore: cast_nullable_to_non_nullable
              as ClassC?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderC?,
      family: freezed == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as Family?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KingdomCopyWith<$Res>? get kingdom {
    if (_value.kingdom == null) {
      return null;
    }

    return $KingdomCopyWith<$Res>(_value.kingdom!, (value) {
      return _then(_value.copyWith(kingdom: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PhylumCopyWith<$Res>? get phylum {
    if (_value.phylum == null) {
      return null;
    }

    return $PhylumCopyWith<$Res>(_value.phylum!, (value) {
      return _then(_value.copyWith(phylum: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClassCCopyWith<$Res>? get classC {
    if (_value.classC == null) {
      return null;
    }

    return $ClassCCopyWith<$Res>(_value.classC!, (value) {
      return _then(_value.copyWith(classC: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderCCopyWith<$Res>? get order {
    if (_value.order == null) {
      return null;
    }

    return $OrderCCopyWith<$Res>(_value.order!, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FamilyCopyWith<$Res>? get family {
    if (_value.family == null) {
      return null;
    }

    return $FamilyCopyWith<$Res>(_value.family!, (value) {
      return _then(_value.copyWith(family: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaxonomyImplCopyWith<$Res>
    implements $TaxonomyCopyWith<$Res> {
  factory _$$TaxonomyImplCopyWith(
          _$TaxonomyImpl value, $Res Function(_$TaxonomyImpl) then) =
      __$$TaxonomyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reino') Kingdom? kingdom,
      @JsonKey(name: 'filo') Phylum? phylum,
      @JsonKey(name: 'clase') ClassC? classC,
      @JsonKey(name: 'orden') OrderC? order,
      @JsonKey(name: 'familia') Family? family});

  @override
  $KingdomCopyWith<$Res>? get kingdom;
  @override
  $PhylumCopyWith<$Res>? get phylum;
  @override
  $ClassCCopyWith<$Res>? get classC;
  @override
  $OrderCCopyWith<$Res>? get order;
  @override
  $FamilyCopyWith<$Res>? get family;
}

/// @nodoc
class __$$TaxonomyImplCopyWithImpl<$Res>
    extends _$TaxonomyCopyWithImpl<$Res, _$TaxonomyImpl>
    implements _$$TaxonomyImplCopyWith<$Res> {
  __$$TaxonomyImplCopyWithImpl(
      _$TaxonomyImpl _value, $Res Function(_$TaxonomyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kingdom = freezed,
    Object? phylum = freezed,
    Object? classC = freezed,
    Object? order = freezed,
    Object? family = freezed,
  }) {
    return _then(_$TaxonomyImpl(
      kingdom: freezed == kingdom
          ? _value.kingdom
          : kingdom // ignore: cast_nullable_to_non_nullable
              as Kingdom?,
      phylum: freezed == phylum
          ? _value.phylum
          : phylum // ignore: cast_nullable_to_non_nullable
              as Phylum?,
      classC: freezed == classC
          ? _value.classC
          : classC // ignore: cast_nullable_to_non_nullable
              as ClassC?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderC?,
      family: freezed == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as Family?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxonomyImpl implements _Taxonomy {
  _$TaxonomyImpl(
      {@JsonKey(name: 'reino') this.kingdom,
      @JsonKey(name: 'filo') this.phylum,
      @JsonKey(name: 'clase') this.classC,
      @JsonKey(name: 'orden') this.order,
      @JsonKey(name: 'familia') this.family});

  factory _$TaxonomyImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxonomyImplFromJson(json);

  @override
  @JsonKey(name: 'reino')
  final Kingdom? kingdom;
  @override
  @JsonKey(name: 'filo')
  final Phylum? phylum;
  @override
  @JsonKey(name: 'clase')
  final ClassC? classC;
  @override
  @JsonKey(name: 'orden')
  final OrderC? order;
  @override
  @JsonKey(name: 'familia')
  final Family? family;

  @override
  String toString() {
    return 'Taxonomy(kingdom: $kingdom, phylum: $phylum, classC: $classC, order: $order, family: $family)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxonomyImpl &&
            (identical(other.kingdom, kingdom) || other.kingdom == kingdom) &&
            (identical(other.phylum, phylum) || other.phylum == phylum) &&
            (identical(other.classC, classC) || other.classC == classC) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.family, family) || other.family == family));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, kingdom, phylum, classC, order, family);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxonomyImplCopyWith<_$TaxonomyImpl> get copyWith =>
      __$$TaxonomyImplCopyWithImpl<_$TaxonomyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxonomyImplToJson(
      this,
    );
  }
}

abstract class _Taxonomy implements Taxonomy {
  factory _Taxonomy(
      {@JsonKey(name: 'reino') final Kingdom? kingdom,
      @JsonKey(name: 'filo') final Phylum? phylum,
      @JsonKey(name: 'clase') final ClassC? classC,
      @JsonKey(name: 'orden') final OrderC? order,
      @JsonKey(name: 'familia') final Family? family}) = _$TaxonomyImpl;

  factory _Taxonomy.fromJson(Map<String, dynamic> json) =
      _$TaxonomyImpl.fromJson;

  @override
  @JsonKey(name: 'reino')
  Kingdom? get kingdom;
  @override
  @JsonKey(name: 'filo')
  Phylum? get phylum;
  @override
  @JsonKey(name: 'clase')
  ClassC? get classC;
  @override
  @JsonKey(name: 'orden')
  OrderC? get order;
  @override
  @JsonKey(name: 'familia')
  Family? get family;
  @override
  @JsonKey(ignore: true)
  _$$TaxonomyImplCopyWith<_$TaxonomyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
