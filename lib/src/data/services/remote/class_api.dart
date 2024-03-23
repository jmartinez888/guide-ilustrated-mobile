import 'dart:convert';

import 'package:http/http.dart';
import 'package:species/src/data/mappers/class_mapper.dart';
import 'package:species/src/data/models/classes/class_iiap/class_iiap.dart';
import 'package:species/src/domain/entities/class/class.dart';

class ClassApi {
  final String _baseUrl;
  final ClassMapper _classMapper;

  ClassApi({
    required String baseUrl,
    required ClassMapper classMapper,
  })  : _baseUrl = baseUrl,
        _classMapper = classMapper;
  Future<List<ClassC>> getClasses() async {
    try {
      final response = await get(Uri.parse('$_baseUrl/classes'));
      if (response.statusCode == 200) {
        final List<dynamic> responseList = jsonDecode(response.body);
        final classesIiap =
            responseList.map((item) => ClassIiap.fromJson(item)).toList();

        final classes = classesIiap
            .map((classC) => _classMapper.classIiapToClass(classC))
            .toList();

        return classes;
      } else {
        return [];
      }
    } catch (e) {
      throw 'Error en la solicitud: $e';
    }
  }
}
