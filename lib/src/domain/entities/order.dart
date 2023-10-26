import 'dart:convert';

class OrderClass {
  final int id;
  final String name;
  OrderClass({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_orden': id,
      'vc_nombre': name,
    };
  }

  factory OrderClass.fromMap(Map<String, dynamic> map) {
    return OrderClass(
      id: map['id_orden'] as int,
      name: map['vc_nombre'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderClass.fromJson(String source) =>
      OrderClass.fromMap(json.decode(source) as Map<String, dynamic>);
}
