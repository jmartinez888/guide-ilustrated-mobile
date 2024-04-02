import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/order/order.dart';

class OrderMapIntoClass implements JsonConverter<OrderC, dynamic> {
  const OrderMapIntoClass();

  @override
  OrderC fromJson(dynamic orderC) => OrderC.fromJson(orderC);

  @override
  Map<String, dynamic> toJson(OrderC orderC) => orderC.toJson();
}