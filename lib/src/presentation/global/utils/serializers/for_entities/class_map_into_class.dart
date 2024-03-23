import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/class/class.dart';

class ClassMapIntoClass implements JsonConverter<ClassC, dynamic> {
  const ClassMapIntoClass();

  @override
  ClassC fromJson(dynamic classC) => ClassC.fromJson(classC);

  @override
  Map<String, dynamic> toJson(ClassC classC) => classC.toJson();
}