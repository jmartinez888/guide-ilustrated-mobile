import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/family_iiap/family_iiap.dart';

class FamilyIiapMapIntoClass implements JsonConverter<FamilyIiap, dynamic> {
  const FamilyIiapMapIntoClass();

  @override
  FamilyIiap fromJson(dynamic family) => FamilyIiap.fromJson(family);

  @override
  Map<String, dynamic> toJson(FamilyIiap family) => family.toJson();
}