class EstadosConservacion {
  final int idEstado;
  final String vcNombre;
  final String inicialesEstado;
  final String institucion;
  final String imagenEstado;
  final String estado;

  EstadosConservacion({
    required this.idEstado,
    required this.vcNombre,
    required this.inicialesEstado,
    required this.institucion,
    required this.imagenEstado,
    required this.estado,
  });

  factory EstadosConservacion.fromJson(Map<String, dynamic> json) =>
      EstadosConservacion(
        idEstado: json["id_estado"],
        vcNombre: json["vc_nombre"],
        inicialesEstado: json["iniciales_estado"],
        institucion: json["institucion"],
        imagenEstado: json["imagen_estado"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id_estado": idEstado,
        "vc_nombre": vcNombre,
        "iniciales_estado": inicialesEstado,
        "institucion": institucion,
        "imagen_estado": imagenEstado,
        "estado": estado,
      };
}
