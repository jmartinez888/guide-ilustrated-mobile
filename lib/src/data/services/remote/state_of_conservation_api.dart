import 'dart:convert';
import 'package:http/http.dart';
import 'package:species/src/domain/entities/state_of_conservation/state_of_conservation.dart';

class StateOfConservationApi {
  final String _baseUrl;

  StateOfConservationApi({required String baseUrl}) : _baseUrl = baseUrl;

  Future<List<StateOfConservation>> getConservationStatus() async {
    try {
      final response = await get(Uri.parse('$_baseUrl/status'));
      if (response.statusCode == 200) {
        final List<dynamic> responseList = jsonDecode(response.body);
        return responseList
            .map((item) => StateOfConservation.fromJson(item))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      throw 'Error en la solicitud: $e';
    }
  }
}
