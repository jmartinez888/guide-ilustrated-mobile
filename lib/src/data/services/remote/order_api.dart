import 'dart:convert';
import 'package:http/http.dart';
import 'package:species/src/domain/entities/order/order.dart';

class OrderApi {
  final String _baseUrl;

  OrderApi({required String baseUrl}) : _baseUrl = baseUrl;

  
  Future<List<OrderC>> getOrdersByClassId(int classId) async {
    try {
      final response =
          await get(Uri.parse('$_baseUrl/orders/by-class/$classId'));
      if (response.statusCode == 200) {
        final List<dynamic> responseList = jsonDecode(response.body);
        List<OrderC> orderList =
            responseList.map((item) => OrderC.fromJson(item)).toList();
        return orderList; 
      } else {
        return [];
      }
    } catch (e) {
      throw 'Error en la solicitud: $e';
    }
  }
}