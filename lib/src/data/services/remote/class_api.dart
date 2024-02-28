import 'dart:convert';

import 'package:http/http.dart';
import 'package:species/src/domain/entities/class/class.dart';

class ClassApi {
  final String _baseUrl;

  ClassApi({required String baseUrl}) : _baseUrl = baseUrl;
  Future<List<ClassC>> getClasses() async {
    try {
      final response = await get(Uri.parse('$_baseUrl/classes'));
      if (response.statusCode == 200) {
        final List<dynamic> responseList = jsonDecode(response.body);
        List<ClassC> classList =
            responseList.map((item) => ClassC.fromJson(item)).toList();
        return classList;
      } else {
        return [];
      }
    } catch (e) {
      throw 'Error en la solicitud: $e';
    }
  }
}
