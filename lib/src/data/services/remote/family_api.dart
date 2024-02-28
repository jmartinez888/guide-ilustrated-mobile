import 'dart:convert';

import 'package:http/http.dart';
import 'package:species/src/domain/entities/family/family.dart';

class FamilyApi {
  final String _baseUrl;

  FamilyApi({required String baseUrl}) : _baseUrl = baseUrl;

  Future<List<Family>> getFamiliesByOrden(int orderId) async {
    try {
      final response =
          await get(Uri.parse('$_baseUrl/families/by-order/$orderId'));
      if (response.statusCode == 200) {
        final List<dynamic> responseList = jsonDecode(response.body);
        List<Family> orderList =
            responseList.map((item) => Family.fromJson(item)).toList();
        return orderList;
      } else {
        return [];
      }
    } catch (e) {
      throw 'Error en la solicitud: $e';
    }
  }
}
