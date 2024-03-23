// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'taxonomy_iiap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaxonomyIiap _$TaxonomyIiapFromJson(Map<String, dynamic> json) {
  return _TaxonomyIiap.fromJson(json);
}

/// @nodoc
mixin _$TaxonomyIiap {
  @KingdomIiapMapIntoClass()
  @JsonKey(name: 'reino')
  KingdomIiap? get kingdom => throw _privateConstructorUsedError;
  @PhylumIiapMapIntoClass()
  @JsonKey(name: 'filo')
  PhylumIiap? get phylum => throw _privateConstructorUsedError;
  @ClassIiapMapIntoClass()
  @JsonKey(name: 'clase')
  ClassIiap? get classC => throw _privateConstructorUsedError;
  @OrderIiapMapIntoClass()
  @JsonKey(name: 'orden')
  OrderIiap? get order => throw _privateConstructorUsedError;
  @FamilyIiapMapIntoClass()
  @JsonKey(name: 'familia')
  FamilyIiap? get family => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxonomyIiapCopyWith<TaxonomyIiap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxonomyIiapCopyWith<$Res> {
  factory $TaxonomyIiapCopyWith(
          TaxonomyIiap value, $Res Function(TaxonomyIiap) then) =
      _$TaxonomyIiapCopyWithImpl<$Res, TaxonomyIiap>;
  @useResult
  $Res call(
      {@KingdomIiapMapIntoClass() @JsonKey(name: 'reino') KingdomIiap? kingdom,
      @PhylumIiapMapIntoClass() @JsonKey(name: 'filo') PhylumIiap? phylum,
      @ClassIiapMapIntoClass() @JsonKey(name: 'clase') ClassIiap? classC,
      @OrderIiapMapIntoClass() @JsonKey(name: 'orden') OrderIiap? order,
      @FamilyIiapMapIntoClass() @JsonKey(name: 'familia') FamilyIiap? family});

  $KingdomIiapCopyWith<$Res>? get kingdom;
  $PhylumIiapCopyWith<$Res>? get phylum;
  $ClassIiapCopyWith<$Res>? get classC;
  $OrderIiapCopyWith<$Res>? get order;
  $FamilyIiapCopyWith<$Res>? get family;
}

/// @nodoc
class _$TaxonomyIiapCopyWithImpl<$Res, $Val extends TaxonomyIiap>
    implements $TaxonomyIiapCopyWith<$Res> {
  _$TaxonomyIiapCopyWithImpl(this._value, this._then);

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
              as KingdomIiap?,
      phylum: freezed == phylum
          ? _value.phylum
          : phylum // ignore: cast_nullable_to_non_nullable
              as PhylumIiap?,
      classC: freezed == classC
          ? _value.classC
          : classC // ignore: cast_nullable_to_non_nullable
              as ClassIiap?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderIiap?,
      family: freezed == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as FamilyIiap?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KingdomIiapCopyWith<$Res>? get kingdom {
    if (_value.kingdom == null) {
      return null;
    }

    return $KingdomIiapCopyWith<$Res>(_value.kingdom!, (value) {
      return _then(_value.copyWith(kingdom: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PhylumIiapCopyWith<$Res>? get phylum {
    if (_value.phylum == null) {
      return null;
    }

    return $PhylumIiapCopyWith<$Res>(_value.phylum!, (value) {
      return _then(_value.copyWith(phylum: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClassIiapCopyWith<$Res>? get classC {
    if (_value.classC == null) {
      return null;
    }

    return $ClassIiapCopyWith<$Res>(_value.classC!, (value) {
      return _then(_value.copyWith(classC: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderIiapCopyWith<$Res>? get order {
    if (_value.order == null) {
      return null;
    }

    return $OrderIiapCopyWith<$Res>(_value.order!, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FamilyIiapCopyWith<$Res>? get family {
    if (_value.family == null) {
      return null;
    }

    return $FamilyIiapCopyWith<$Res>(_value.family!, (value) {
      return _then(_value.copyWith(family: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaxonomyIiapImplCopyWith<$Res>
    implements $TaxonomyIiapCopyWith<$Res> {
  factory _$$TaxonomyIiapImplCopyWith(
          _$TaxonomyIiapImpl value, $Res Function(_$TaxonomyIiapImpl) then) =
      __$$TaxonomyIiapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@KingdomIiapMapIntoClass() @JsonKey(name: 'reino') KingdomIiap? kingdom,
      @PhylumIiapMapIntoClass() @JsonKey(name: 'filo') PhylumIiap? phylum,
      @ClassIiapMapIntoClass() @JsonKey(name: 'clase') ClassIiap? classC,
      @OrderIiapMapIntoClass() @JsonKey(name: 'orden') OrderIiap? order,
      @FamilyIiapMapIntoClass() @JsonKey(name: 'familia') FamilyIiap? family});

  @override
  $KingdomIiapCopyWith<$Res>? get kingdom;
  @override
  $PhylumIiapCopyWith<$Res>? get phylum;
  @override
  $ClassIiapCopyWith<$Res>? get classC;
  @override
  $OrderIiapCopyWith<$Res>? get order;
  @override
  $FamilyIiapCopyWith<$Res>? get family;
}

/// @nodoc
class __$$TaxonomyIiapImplCopyWithImpl<$Res>
    extends _$TaxonomyIiapCopyWithImpl<$Res, _$TaxonomyIiapImpl>
    implements _$$TaxonomyIiapImplCopyWith<$Res> {
  __$$TaxonomyIiapImplCopyWithImpl(
      _$TaxonomyIiapImpl _value, $Res Function(_$TaxonomyIiapImpl) _then)
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
    return _then(_$TaxonomyIiapImpl(
      kingdom: freezed == kingdom
          ? _value.kingdom
          : kingdom // ignore: cast_nullable_to_non_nullable
              as KingdomIiap?,
      phylum: freezed == phylum
          ? _value.phylum
          : phylum // ignore: cast_nullable_to_non_nullable
              as PhylumIiap?,
      classC: freezed == classC
          ? _value.classC
          : classC // ignore: cast_nullable_to_non_nullable
              as ClassIiap?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderIiap?,
      family: freezed == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as FamilyIiap?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxonomyIiapImpl implements _TaxonomyIiap {
  _$TaxonomyIiapImpl(
      {@KingdomIiapMapIntoClass() @JsonKey(name: 'reino') this.kingdom = null,
      @PhylumIiapMapIntoClass() @JsonKey(name: 'filo') this.phylum = null,
      @ClassIiapMapIntoClass() @JsonKey(name: 'clase') this.classC = null,
      @OrderIiapMapIntoClass() @JsonKey(name: 'orden') this.order = null,
      @FamilyIiapMapIntoClass() @JsonKey(name: 'familia') this.family = null});

  factory _$TaxonomyIiapImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxonomyIiapImplFromJson(json);

  @override
  @KingdomIiapMapIntoClass()
  @JsonKey(name: 'reino')
  final KingdomIiap? kingdom;
  @override
  @PhylumIiapMapIntoClass()
  @JsonKey(name: 'filo')
  final PhylumIiap? phylum;
  @override
  @ClassIiapMapIntoClass()
  @JsonKey(name: 'clase')
  final ClassIiap? classC;
  @override
  @OrderIiapMapIntoClass()
  @JsonKey(name: 'orden')
  final OrderIiap? order;
  @override
  @FamilyIiapMapIntoClass()
  @JsonKey(name: 'familia')
  final FamilyIiap? family;

  @override
  String toString() {
    return 'TaxonomyIiap(kingdom: $kingdom, phylum: $phylum, classC: $classC, order: $order, family: $family)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxonomyIiapImpl &&
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
  _$$TaxonomyIiapImplCopyWith<_$TaxonomyIiapImpl> get copyWith =>
      __$$TaxonomyIiapImplCopyWithImpl<_$TaxonomyIiapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxonomyIiapImplToJson(
      this,
    );
  }
}

abstract class _TaxonomyIiap implements TaxonomyIiap {
  factory _TaxonomyIiap(
      {@KingdomIiapMapIntoClass()
      @JsonKey(name: 'reino')
      final KingdomIiap? kingdom,
      @PhylumIiapMapIntoClass() @JsonKey(name: 'filo') final PhylumIiap? phylum,
      @ClassIiapMapIntoClass() @JsonKey(name: 'clase') final ClassIiap? classC,
      @OrderIiapMapIntoClass() @JsonKey(name: 'orden') final OrderIiap? order,
      @FamilyIiapMapIntoClass()
      @JsonKey(name: 'familia')
      final FamilyIiap? family}) = _$TaxonomyIiapImpl;

  factory _TaxonomyIiap.fromJson(Map<String, dynamic> json) =
      _$TaxonomyIiapImpl.fromJson;

  @override
  @KingdomIiapMapIntoClass()
  @JsonKey(name: 'reino')
  KingdomIiap? get kingdom;
  @override
  @PhylumIiapMapIntoClass()
  @JsonKey(name: 'filo')
  PhylumIiap? get phylum;
  @override
  @ClassIiapMapIntoClass()
  @JsonKey(name: 'clase')
  ClassIiap? get classC;
  @override
  @OrderIiapMapIntoClass()
  @JsonKey(name: 'orden')
  OrderIiap? get order;
  @override
  @FamilyIiapMapIntoClass()
  @JsonKey(name: 'familia')
  FamilyIiap? get family;
  @override
  @JsonKey(ignore: true)
  _$$TaxonomyIiapImplCopyWith<_$TaxonomyIiapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
