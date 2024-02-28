import 'package:species/src/data/services/remote/order_api.dart';
import 'package:species/src/domain/entities/order/order.dart';
import 'package:species/src/domain/repositories/order/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderApi _orderApi;

  OrderRepositoryImpl({required OrderApi orderApi}) : _orderApi = orderApi;

  @override
  Future<List<OrderC>> getOrdersByClassId(int classId) {
    return _orderApi.getOrdersByClassId(classId);
  }
}
