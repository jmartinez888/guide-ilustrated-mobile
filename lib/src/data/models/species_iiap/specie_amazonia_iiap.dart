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
        "taxonomia": taxonomia != null ? taxonomia!.toJson() : null
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
  final String imagenAutor;
  final String estadoAutor;

  Autores({
    required this.idAutor,
    required this.vcNombre,
    required this.anoNacimientoAutor,
    required this.anoDecesoAutor,
    required this.biografiaAutor,
    required this.profesionAutor,
    required this.actualizado,
    required this.imagenAutor,
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
        imagenAutor: json["imagen_autor"],
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
  final String reino;
  final String filo;
  final String clase;
  final String orden;
  final String familia;

  Taxonomia({
    required this.reino,
    required this.filo,
    required this.clase,
    required this.orden,
    required this.familia,
  });

  factory Taxonomia.fromJson(Map<String, dynamic> json) => Taxonomia(
        reino: json["reino"],
        filo: json["filo"],
        clase: json["clase"],
        orden: json["orden"],
        familia: json["familia"],
      );

  Map<String, dynamic> toJson() => {
        "reino": reino,
        "filo": filo,
        "clase": clase,
        "orden": orden,
        "familia": familia,
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


// To parse this JSON data, do
//
//     final specieAmazoniaIiap = specieAmazoniaIiapFromJson(jsonString);

/* class SpecieAmazoniaIIAP {
  final int idEspecie;
  final String vcNombre;
  final String vcNombreCientifico;
  final String vcNombreIngles;
  final String vcAno;
  final String? teDescripcion;
  final String? vcSonido;
  final String vcImagen;
  final Taxa taxa;
  //final List<Taxonomia>? taxonomia;
  final List<EstadosConservacion> estadosConservacion;
  final List<Autores>? autores;
  final String estado;

  SpecieAmazoniaIIAP({
    required this.idEspecie,
    required this.vcNombre,
    required this.vcNombreCientifico,
    required this.vcNombreIngles,
    required this.vcAno,
    required this.teDescripcion,
    this.vcSonido,
    required this.vcImagen,
    required this.taxa,
    //this.taxonomia,
    required this.estadosConservacion,
    this.autores,
    required this.estado,
  });

  factory SpecieAmazoniaIIAP.fromJson(Map<String, dynamic> json) =>
      SpecieAmazoniaIIAP(
        idEspecie: json["id_especie"],
        vcNombre: json["vc_nombre"],
        vcNombreCientifico: json["vc_nombre_cientifico"],
        vcNombreIngles: json["vc_nombre_ingles"],
        vcAno: json["vc_ano"],
        teDescripcion: json["te_descripcion"],
        vcSonido: json["vc_sonido"],
        vcImagen: json["vc_imagen"],
        taxa: Taxa.fromJson(json["taxa"]),
        // taxonomia: List<Taxonomia>.from(json["taxonomia"].map((x) => Taxonomia.fromJson(x))),
        estadosConservacion: List<EstadosConservacion>.from(
            json["estados_conservacion"]
                .map((x) => EstadosConservacion.fromJson(x))),
        autores:
            json['estados_conservacion'] != null
            ? List<Autores>.from(
                json["estados_conservacion"]
                    .map((x) => Autores.fromJson(x)))
            : [],
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
        //"taxonomia": taxonomia != null ? List<dynamic>.from(taxonomia!.map((x) => x.toJson())) : null,
        "estados_conservacion": List<String>.from(estadosConservacion),
        "autores": autores != null
            ? List<dynamic>.from(autores!.map((x) => x.toJson()))
            : null,
        "estado": estado,
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
  final String imagenAutor;
  final String estadoAutor;

  Autores({
    required this.idAutor,
    required this.vcNombre,
    required this.anoNacimientoAutor,
    required this.anoDecesoAutor,
    required this.biografiaAutor,
    required this.profesionAutor,
    required this.actualizado,
    required this.imagenAutor,
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
        imagenAutor: json["imagen_autor"],
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
 */