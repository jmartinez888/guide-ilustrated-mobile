import 'dart:convert';

import 'package:http/http.dart';
import 'package:species/src/domain/entities/taxonomy_for_search/taxonomy_for_search.dart';

class TaxonomyApi {
  final String _baseUrl;

  TaxonomyApi({required String baseUrl}) : _baseUrl = baseUrl;
  Future<List<TaxonomyForSearch>> getTaxonomies() async {
    try {
      final response = await get(Uri.parse('$_baseUrl/taxonomy'));
      if (response.statusCode == 200) {
        final List<dynamic> responseList = jsonDecode(response.body);
        return responseList.map((item) => TaxonomyForSearch.fromJson(item)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw 'Error en la solicitud: $e';
    }
  }
}