import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/type_iiap/type_iiap.dart';

class TypeIiapMapIntoClass implements JsonConverter<TypeIiap, dynamic> {
  const TypeIiapMapIntoClass();

  @override
  TypeIiap fromJson(dynamic type) => TypeIiap.fromJson(type);

  @override
  Map<String, dynamic> toJson(TypeIiap type) => type.toJson();
}