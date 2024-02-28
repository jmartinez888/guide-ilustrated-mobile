import 'package:species/src/data/services/remote/class_api.dart';
import 'package:species/src/domain/entities/class/class.dart';
import 'package:species/src/domain/repositories/class/class_repository.dart';

class ClassRepositoryImpl implements ClassRepository {
  final ClassApi _classApi;

  ClassRepositoryImpl({required ClassApi classApi}) : _classApi = classApi;

  @override
  Future<List<ClassC>> getClasses() {
    return _classApi.getClasses();
  }
}
