class Taxa {
  final int idTaxa;
  final String vcNombre;
  final String estado;

  Taxa({
    required this.idTaxa,
    required this.vcNombre,
    required this.estado,
  });

  factory Taxa.fromJson(Map<String, dynamic> json) => Taxa(
        idTaxa: json["id_taxa"],
        vcNombre: json["vc_nombre"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id_taxa": idTaxa,
        "vc_nombre": vcNombre,
        "estado": estado,
      };
}
