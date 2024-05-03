
import 'dart:convert';
import 'package:http/http.dart';
import 'package:species/src/data/mappers/order_mapper.dart';
import 'package:species/src/data/models/classes/order_iiap/order_iiap.dart';
import 'package:species/src/domain/entities/order/order.dart';

class OrderApi {
  final String _baseUrl;
  final OrderMapper _orderMapper;

  OrderApi({
    required String baseUrl,
    required OrderMapper orderMapper,
  })  : _baseUrl = baseUrl,
        _orderMapper = orderMapper;

  Future<List<OrderC>> getOrdersByClassId(int classId) async {
    try {
      final response =
          await get(Uri.parse('$_baseUrl/orders/by-class/$classId'));
      if (response.statusCode == 200) {
        final List<dynamic> responseList = jsonDecode(response.body);
        final ordersIiap = responseList
            .map((orderIiap) => OrderIiap.fromJson(orderIiap))
            .toList();
        final orders = ordersIiap
            .map((order) => _orderMapper.orderIiapToOrder(order))
            .toList();

        return orders;
      } else {
        return [];
      }
    } catch (e) {
      throw 'Error en la solicitud: $e';
    }
  }
}
