class SpecieSpeciesIiap {
    final int idEspecie;
    final String vcNombre;
    final String vcNombreCientifico;
    final String vcNombreIngles;
    final dynamic vcSonido;
    final String vcAno;
    final String vcImagen;
    final String teDescripcion;
    final String reino;
    final String filo;
    final String clase;
    final String orden;
    final String familia;
    final String tipo;
    final List<String> imagenesEstado;
    final List<String> autores;
    final List<String> idAutores;

    SpecieSpeciesIiap({
        required this.idEspecie,
        required this.vcNombre,
        required this.vcNombreCientifico,
        required this.vcNombreIngles,
        required this.vcSonido,
        required this.vcAno,
        required this.vcImagen,
        required this.teDescripcion,
        required this.reino,
        required this.filo,
        required this.clase,
        required this.orden,
        required this.familia,
        required this.tipo,
        required this.imagenesEstado,
        required this.autores,
        required this.idAutores,
    });

    factory SpecieSpeciesIiap.fromJson(Map<String, dynamic> json) => SpecieSpeciesIiap(
        idEspecie: json["id_especie"],
        vcNombre: json["vc_nombre"],
        vcNombreCientifico: json["vc_nombre_cientifico"],
        vcNombreIngles: json["vc_nombre_ingles"] ?? '',
        vcSonido: json["vc_sonido"] ?? '',
        vcAno: json["vc_ano"] ?? '',
        vcImagen: json["vc_imagen"] ?? '',
        teDescripcion: json["te_descripcion"] ?? '',
        reino: json["reino"] ?? '',
        filo: json["filo"] ?? '',
        clase: json["clase"] ?? '',
        orden: json["orden"] ?? '',
        familia: json["familia"] ?? '',
        tipo: json["tipo"] ?? '',
        imagenesEstado: json['imagenes_estado'] != null ? List<String>.from(json["imagenes_estado"].map((x) => x)) : [],
        autores: json['autores'] != null ? List<String>.from(json["autores"].map((x) => x)) : [],
        idAutores: json['id_autores'] != null ? List<String>.from(json["id_autores"].map((x) => x)) : [],
    );

    Map<String, dynamic> toJson() => {
        "id_especie": idEspecie,
        "vc_nombre": vcNombre,
        "vc_nombre_cientifico": vcNombreCientifico,
        "vc_nombre_ingles": vcNombreIngles,
        "vc_sonido": vcSonido,
        "vc_ano": vcAno,
        "vc_imagen": vcImagen,
        "te_descripcion": teDescripcion,
        "reino": reino,
        "filo": filo,
        "clase": clase,
        "orden": orden,
        "familia": familia,
        "tipo": tipo,
        "imagenes_estado": List<dynamic>.from(imagenesEstado.map((x) => x)),
        "autores": List<dynamic>.from(autores.map((x) => x)),
        "id_autores": List<dynamic>.from(idAutores.map((x) => x)),
    };

  where(Function(dynamic speciesIiap) param0) {}
}
