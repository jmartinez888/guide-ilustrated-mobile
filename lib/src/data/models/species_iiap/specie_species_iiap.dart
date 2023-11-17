import 'package:species/src/domain/entities/author.dart';
import 'package:species/src/domain/entities/conservations_status.dart';
import 'package:species/src/domain/entities/taxa.dart';
import 'package:species/src/domain/entities/taxonomy.dart';

class SpecieSpeciesIiap {
  final int idEspecie;
  final String vcNombre;
  final String vcNombreCientifico;
  final String vcNombreIngles;
  final String vcAno;
  final String teDescripcion;
  final dynamic vcSonido;
  final String vcImagen;
  final Taxa taxa;
  final List<Taxonomia> taxonomia;
  final List<EstadosConservacion> estadosConservacion;
  final List<Author> autores;
  final dynamic fechaCreacion;
  final DateTime fechaModificacion;
  final String estado;

  SpecieSpeciesIiap({
    required this.idEspecie,
    required this.vcNombre,
    required this.vcNombreCientifico,
    required this.vcNombreIngles,
    required this.vcAno,
    required this.teDescripcion,
    required this.vcSonido,
    required this.vcImagen,
    required this.taxa,
    required this.taxonomia,
    required this.estadosConservacion,
    required this.autores,
    required this.fechaCreacion,
    required this.fechaModificacion,
    required this.estado,
  });

  factory SpecieSpeciesIiap.fromJson(Map<String, dynamic> json) =>
      SpecieSpeciesIiap(
        idEspecie: json["id_especie"],
        vcNombre: json["vc_nombre"],
        vcNombreCientifico: json["vc_nombre_cientifico"],
        vcNombreIngles: json["vc_nombre_ingles"],
        vcAno: json["vc_ano"],
        teDescripcion: json["te_descripcion"],
        vcSonido: json["vc_sonido"],
        vcImagen: json["vc_imagen"],
        taxa: Taxa.fromJson(json["taxa"]),
        taxonomia: List<Taxonomia>.from(
            json["taxonomia"].map((x) => Taxonomia.fromJson(x))),
        estadosConservacion: List<EstadosConservacion>.from(
            json["estados_conservacion"]
                .map((x) => EstadosConservacion.fromJson(x))),
        autores:
            List<Author>.from(json["autores"].map((x) => Author.fromJson(x))),
        fechaCreacion: json["fecha_creacion"],
        fechaModificacion: DateTime.parse(json["fecha_modificacion"]),
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id_especie": idEspecie,
        "vc_nombre": vcNombre,
        "vc_nombre_cientifico": vcNombreCientifico,
        "vc_nombre_ingles": vcNombreIngles,
        "vc_ano": vcAno,
        "te_descripcion": teDescripcion,
        "vc_sonido": vcSonido,
        "vc_imagen": vcImagen,
        "taxa": taxa.toJson(),
        "taxonomia": List<dynamic>.from(taxonomia.map((x) => x.toJson())),
        "estados_conservacion":
            List<dynamic>.from(estadosConservacion.map((x) => x.toJson())),
        "autores": List<dynamic>.from(autores.map((x) => x.toJson())),
        "fecha_creacion": fechaCreacion,
        "fecha_modificacion": fechaModificacion.toIso8601String(),
        "estado": estado,
      };
}
