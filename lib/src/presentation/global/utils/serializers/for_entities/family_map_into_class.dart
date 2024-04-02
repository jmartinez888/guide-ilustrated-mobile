import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/family/family.dart';

class FamilyMapIntoClass implements JsonConverter<Family, dynamic> {
  const FamilyMapIntoClass();

  @override
  Family fromJson(dynamic family) => Family.fromJson(family);

  @override
  Map<String, dynamic> toJson(Family family) => family.toJson();
}