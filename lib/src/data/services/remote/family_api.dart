import 'dart:convert';

import 'package:http/http.dart';
import 'package:species/src/data/mappers/family_mapper.dart';
import 'package:species/src/data/models/classes/family_iiap/family_iiap.dart';
import 'package:species/src/domain/entities/family/family.dart';

class FamilyApi {
  final String _baseUrl;
  final FamilyMapper _familyMapper;

  FamilyApi({
    required String baseUrl,
    required FamilyMapper familyMapper,
  }) : _baseUrl = baseUrl,
  _familyMapper = familyMapper
  ;

  Future<List<Family>> getFamiliesByOrden(int orderId) async {
    try {
      final response =
          await get(Uri.parse('$_baseUrl/families/by-order/$orderId'));
      if (response.statusCode == 200) {
        final List<dynamic> responseList = jsonDecode(response.body);

        final familiesIiap = responseList
            .map((familyIiap) => FamilyIiap.fromJson(familyIiap))
            .toList();

        final families = familiesIiap.map((family) => _familyMapper.familyIiapToFamily(family)).toList();

        return families;
      } else {
        return [];
      }
    } catch (e) {
      throw 'Error en la solicitud: $e';
    }
  }
}
