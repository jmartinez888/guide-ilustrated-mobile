import 'package:species/src/data/models/classes/order_iiap/order_iiap.dart';
import 'package:species/src/domain/entities/order/order.dart';

class OrderMapper {
  OrderC orderIiapToOrder(OrderIiap order) {
    return OrderC(
      id: order.id,
      name: order.name,
      idClass: order.idClass,
      state: order.state,
    );
  }
}
