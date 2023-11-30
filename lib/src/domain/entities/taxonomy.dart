import 'dart:convert';

class Taxonomy {
  final int idTaxonomia;
  final String vcNombre;
  final String vcImagen;

  Taxonomy({
    required this.idTaxonomia,
    required this.vcNombre,
    required this.vcImagen,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_taxonomia': idTaxonomia,
      'vc_nombre': vcNombre,
      'vc_imagen': vcImagen,
    };
  }

  factory Taxonomy.fromMap(Map<String, dynamic> map) => Taxonomy(
        idTaxonomia: map['id_taxonomia'] as int,
        vcNombre: map['vc_nombre'] as String,
        vcImagen: map['vc_imagen'] as String,
      );

  String toJson() => json.encode(toMap());

  factory Taxonomy.fromJson(Map<String, dynamic> json) => Taxonomy(
        idTaxonomia: json["id_taxonomia"],
        vcNombre: json["vc_nombre"],
        vcImagen: json["vc_imagen"],
      );
}
