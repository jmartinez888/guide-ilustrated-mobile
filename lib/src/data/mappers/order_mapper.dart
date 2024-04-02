import 'package:species/src/data/models/classes/order_iiap/order_iiap.dart';
import 'package:species/src/domain/entities/order/order.dart';

class ClassMapper {
  OrderC classIiapToClass(OrderIiap orderC) {
    return OrderC(
      id: orderC.id,
      name: orderC.name,
      idClass: orderC.idClass,
      state: orderC.state,
    );
  }
}
