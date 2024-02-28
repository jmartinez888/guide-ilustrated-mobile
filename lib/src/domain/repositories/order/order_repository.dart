import 'package:species/src/domain/entities/order/order.dart';

abstract class OrderRepository {
  Future<List<OrderC>> getOrdersByClassId(int classId);
}