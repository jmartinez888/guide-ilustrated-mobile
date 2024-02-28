import 'package:species/src/domain/entities/class/class.dart';

abstract class ClassRepository {
  Future<List<ClassC>> getClasses();
}