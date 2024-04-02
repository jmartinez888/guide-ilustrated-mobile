import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/type/type.dart';

class TypeMapIntoClass implements JsonConverter<TypeC, dynamic> {
  const TypeMapIntoClass();

  @override
  TypeC fromJson(dynamic type) => TypeC.fromJson(type);

  @override
  Map<String, dynamic> toJson(TypeC type) => type.toJson();
}