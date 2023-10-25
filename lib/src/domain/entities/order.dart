import 'dart:convert';

class OrdeC {
  final int id;
  final String name;
  OrdeC({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_orden': id,
      'vc_nombre': name,
    };
  }

  factory OrdeC.fromMap(Map<String, dynamic> map) {
    return OrdeC(
      id: map['id_orden'] as int,
      name: map['vc_nombre'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdeC.fromJson(String source) =>
      OrdeC.fromMap(json.decode(source) as Map<String, dynamic>);
}
