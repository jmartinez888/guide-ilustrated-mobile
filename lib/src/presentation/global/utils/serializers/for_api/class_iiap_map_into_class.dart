import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/class_iiap/class_iiap.dart';

class ClassIiapMapIntoClass implements JsonConverter<ClassIiap, dynamic> {
  const ClassIiapMapIntoClass();

  @override
  ClassIiap fromJson(dynamic classC) => ClassIiap.fromJson(classC);

  @override
  Map<String, dynamic> toJson(ClassIiap classC) => classC.toJson();
}