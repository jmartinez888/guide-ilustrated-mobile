import 'dart:convert';

class ConservationStatus {
  final int idEstConservacion;
  final String vcNombre;
  final String vcImagenEstado;
  ConservationStatus({
    required this.idEstConservacion,
    required this.vcNombre,
    required this.vcImagenEstado,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_est_conservacion': idEstConservacion,
      'vc_nombre': vcNombre,
      'vc_imagen_estado': vcImagenEstado,
    };
  }

  factory ConservationStatus.fromMap(Map<String, dynamic> map) =>
      ConservationStatus(
        idEstConservacion: map['id_est_conservacion'] as int,
        vcNombre: map['vc_nombre'] as String,
        vcImagenEstado: map['vc_imagen_estado'] as String,
      );

  String toJson() => json.encode(toMap());

  factory ConservationStatus.fromJson(String source) =>
      ConservationStatus.fromMap(json.decode(source) as Map<String, dynamic>);
}
