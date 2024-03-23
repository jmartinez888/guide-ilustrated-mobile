import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/order_iiap/order_iiap.dart';

class OrderIiapMapIntoClass implements JsonConverter<OrderIiap, dynamic> {
  const OrderIiapMapIntoClass();

  @override
  OrderIiap fromJson(dynamic orderC) => OrderIiap.fromJson(orderC);

  @override
  Map<String, dynamic> toJson(OrderIiap orderC) => orderC.toJson();
}