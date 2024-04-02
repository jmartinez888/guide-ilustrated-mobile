import 'dart:convert';
import 'package:http/http.dart';
import 'package:species/src/domain/entities/conservation_states/conservation_states.dart';

class ConservationStatesApi {
  final String _baseUrl;

  ConservationStatesApi({required String baseUrl}) : _baseUrl = baseUrl;

  Future<List<ConservationStates>> getConservationStatus() async {
    try {
      final response = await get(Uri.parse('$_baseUrl/status'));
      if (response.statusCode == 200) {
        final List<dynamic> responseList = jsonDecode(response.body);
        return responseList
            .map((item) => ConservationStates.fromJson(item))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      throw 'Error en la solicitud: $e';
    }
  }
}
