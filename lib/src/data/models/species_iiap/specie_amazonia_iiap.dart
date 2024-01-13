class SpecieAmazoniaIIAP {
  final int idEspecie;
  final String vcNombre;
  final String vcNombreCientifico;
  final String? vcNombreIngles;
  final String? vcAno;
  final String? vcSonido;
  final String vcImagen;
  final String? teDescripcion;
  final Taxa taxa;
  final Taxonomia? taxonomia;
  final List<EstadoConservacion> estadosConservacion;
  final List<Autores>? autores;
  final List<String> idAutores;

  SpecieAmazoniaIIAP({
    required this.idEspecie,
    required this.vcNombre,
    required this.vcNombreCientifico,
    required this.vcNombreIngles,
    this.vcAno,
    required this.vcSonido,
    required this.vcImagen,
    this.taxonomia,
    this.teDescripcion,
    required this.taxa,
    required this.estadosConservacion,
    this.autores,
    required this.idAutores,
  });

  factory SpecieAmazoniaIIAP.fromJson(Map<String, dynamic> json) =>
      SpecieAmazoniaIIAP(
        idEspecie: json["id_especie"],
        vcNombre: json["vc_nombre"],
        vcNombreCientifico: json["vc_nombre_cientifico"],
        vcNombreIngles: json["vc_nombre_ingles"],
        vcAno: json["vc_ano"],
        vcSonido: json["vc_sonido"],
        vcImagen: json["vc_imagen"],
        teDescripcion: json["te_descripcion"],
        taxa: Taxa.fromJson(json["taxa"]),
        taxonomia: json["taxonomia"] != null
            ? Taxonomia.fromJson(json["taxonomia"])
            : null,
        estadosConservacion: json['estados_conservacion'].isNotEmpty
            ? List<EstadoConservacion>.from(json["estados_conservacion"]
                .map((x) => EstadoConservacion.fromJson(x)))
            : [],
        autores: json['autores'] != null
            ? List<Autores>.from(
                json["autores"].map((x) => Autores.fromJson(x)))
            : null,
        idAutores: json['id_autores'] != null
            ? List<String>.from(json["id_autores"].map((x) => x))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id_especie": idEspecie,
        "vc_nombre": vcNombre,
        "taxa": taxa.toJson(),
        "estados_conservacion":
            estadosConservacion.map((estado) => estado.toJson()).toList(),
        "autores": autores != null
            ? autores!.map((autor) => autor.toJson()).toList()
            : [],
        "id_autores": List<String>.from(idAutores),
        "taxonomia": taxonomia != null ? taxonomia!.toJson() : ''
      };
}

class Autores {
  final int idAutor;
  final String vcNombre;
  final String anoNacimientoAutor;
  final String anoDecesoAutor;
  final String biografiaAutor;
  final String profesionAutor;
  final int actualizado;
  final String? imagenAutor;
  final String estadoAutor;

  Autores({
    required this.idAutor,
    required this.vcNombre,
    required this.anoNacimientoAutor,
    required this.anoDecesoAutor,
    required this.biografiaAutor,
    required this.profesionAutor,
    required this.actualizado,
    this.imagenAutor,
    required this.estadoAutor,
  });

  factory Autores.fromJson(Map<String, dynamic> json) => Autores(
        idAutor: json["id_autor"],
        vcNombre: json["vc_nombre"],
        anoNacimientoAutor: json["ano_nacimiento_autor"],
        anoDecesoAutor: json["ano_deceso_autor"],
        biografiaAutor: json["biografia_autor"],
        profesionAutor: json["profesion_autor"],
        actualizado: json["actualizado"],
        imagenAutor: json
        ["imagen_autor"] ?? '',
        estadoAutor: json["estado_autor"],
      );

  Map<String, dynamic> toJson() => {
        "id_autor": idAutor,
        "vc_nombre": vcNombre,
        "ano_nacimiento_autor": anoNacimientoAutor,
        "ano_deceso_autor": anoDecesoAutor,
        "biografia_autor": biografiaAutor,
        "profesion_autor": profesionAutor,
        "actualizado": actualizado,
        "imagen_autor": imagenAutor,
        "estado_autor": estadoAutor,
      };
}

class Taxonomia {
  final Reino reino;
  final Filo filo;
  final Clase clase;
  final Orden orden;
  final Familia familia;

  Taxonomia({
    required this.reino,
    required this.filo,
    required this.clase,
    required this.orden,
    required this.familia,
  });

  factory Taxonomia.fromJson(Map<String, dynamic> json) => Taxonomia(
        reino: Reino.fromJson(json["reino"]),
        filo: Filo.fromJson(json["filo"]),
        clase: Clase.fromJson(json["clase"]),
        orden: Orden.fromJson(json["orden"]),
        familia: Familia.fromJson(json["familia"]),
      );

  Map<String, dynamic> toJson() => {
        "reino": reino.toJson(),
        "filo": filo.toJson(),
        "clase": clase.toJson(),
        "orden": orden.toJson(),
        "familia": familia.toJson(),
      };
}

class Clase {
  final int idClase;
  final String vcNombre;

  Clase({
    required this.idClase,
    required this.vcNombre,
  });

  factory Clase.fromJson(Map<String, dynamic> json) => Clase(
        idClase: json["id_clase"],
        vcNombre: json["vc_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id_clase": idClase,
        "vc_nombre": vcNombre,
      };
}

class Familia {
  final int idFamilia;
  final String vcNombre;

  Familia({
    required this.idFamilia,
    required this.vcNombre,
  });

  factory Familia.fromJson(Map<String, dynamic> json) => Familia(
        idFamilia: json["id_familia"],
        vcNombre: json["vc_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id_familia": idFamilia,
        "vc_nombre": vcNombre,
      };
}

class Filo {
  final int idFilo;
  final String vcNombre;

  Filo({
    required this.idFilo,
    required this.vcNombre,
  });

  factory Filo.fromJson(Map<String, dynamic> json) => Filo(
        idFilo: json["id_filo"],
        vcNombre: json["vc_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id_filo": idFilo,
        "vc_nombre": vcNombre,
      };
}

class Orden {
  final int idOrden;
  final String vcNombre;

  Orden({
    required this.idOrden,
    required this.vcNombre,
  });

  factory Orden.fromJson(Map<String, dynamic> json) => Orden(
        idOrden: json["id_orden"],
        vcNombre: json["vc_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id_orden": idOrden,
        "vc_nombre": vcNombre,
      };
}

class Reino {
  final int idReino;
  final String vcNombre;

  Reino({
    required this.idReino,
    required this.vcNombre,
  });

  factory Reino.fromJson(Map<String, dynamic> json) => Reino(
        idReino: json["id_reino"],
        vcNombre: json["vc_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id_reino": idReino,
        "vc_nombre": vcNombre,
      };
}

class EstadoConservacion {
  final int idEstado;
  final String nombreEstado;
  final String inicialesEstado;
  final String institucion;
  final String imagenEstado;
  final String estado;

  EstadoConservacion({
    required this.idEstado,
    required this.nombreEstado,
    required this.inicialesEstado,
    required this.institucion,
    required this.imagenEstado,
    required this.estado,
  });

  factory EstadoConservacion.fromJson(Map<String, dynamic> json) =>
      EstadoConservacion(
        idEstado: json["id_estado"],
        nombreEstado: json["vc_nombre"],
        inicialesEstado: json["iniciales_estado"],
        institucion: json["institucion"],
        imagenEstado: json["imagen_estado"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id_estado": idEstado,
        "vc_nombre": nombreEstado,
        "iniciales_estado": inicialesEstado,
        "institucion": institucion,
        "imagen_estado": imagenEstado,
        "estado": estado,
      };
}

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