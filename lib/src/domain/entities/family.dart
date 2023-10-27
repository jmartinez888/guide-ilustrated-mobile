// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Family {
  final int id;
  final String name;
  Family({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_familia': id,
      'vc_nombre': name,
    };
  }

  factory Family.fromMap(Map<String, dynamic> map) {
    return Family(
      id: map['id_familia'] as int,
      name: map['vc_nombre'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Family.fromJson(String source) =>
      Family.fromMap(json.decode(source) as Map<String, dynamic>);
}
