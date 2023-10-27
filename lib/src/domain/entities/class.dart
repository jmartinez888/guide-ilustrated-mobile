import 'dart:convert';

class Class {
  final int id;
  final String name;

  Class({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_clase': id,
      'vc_nombre': name,
    };
  }

  factory Class.fromMap(Map<String, dynamic> map) {
    return Class(
      id: map['id_clase'] as int,
      name: map['vc_nombre'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Class.fromJson(String source) =>
      Class.fromMap(json.decode(source) as Map<String, dynamic>);
}
