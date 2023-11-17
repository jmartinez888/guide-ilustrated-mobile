class Taxonomia {
  final int? idReino;
  final String vcNombre;
  final String estado;
  final int? idFilo;
  final int? idClase;
  final int? idOrden;
  final int? idFamilia;

  Taxonomia({
    this.idReino,
    required this.vcNombre,
    required this.estado,
    this.idFilo,
    this.idClase,
    this.idOrden,
    this.idFamilia,
  });

  factory Taxonomia.fromJson(Map<String, dynamic> json) => Taxonomia(
        idReino: json["id_reino"],
        vcNombre: json["vc_nombre"],
        estado: json["estado"],
        idFilo: json["id_filo"],
        idClase: json["id_clase"],
        idOrden: json["id_orden"],
        idFamilia: json["id_familia"],
      );

  Map<String, dynamic> toJson() => {
        "id_reino": idReino,
        "vc_nombre": vcNombre,
        "estado": estado,
        "id_filo": idFilo,
        "id_clase": idClase,
        "id_orden": idOrden,
        "id_familia": idFamilia,
      };
}
