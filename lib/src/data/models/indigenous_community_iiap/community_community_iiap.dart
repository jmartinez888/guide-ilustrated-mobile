class CommunityCommunityIiap {
    final int id;
    final String vcNombre;
    final String teDescripcion;
    final double deLongitud;
    final double deLatitud;
    final dynamic vcImage;

    CommunityCommunityIiap({
        required this.id,
        required this.vcNombre,
        required this.teDescripcion,
        required dynamic deLongitud,
        required dynamic deLatitud,
        required this.vcImage,
    }) : 
        deLongitud = deLongitud is double ? deLongitud : (deLongitud is int ? deLongitud.toDouble() : 0.0),
        deLatitud = deLatitud is double ? deLatitud : (deLatitud is int ? deLatitud.toDouble() : 0.0);

    factory CommunityCommunityIiap.fromJson(Map<String, dynamic> json) => CommunityCommunityIiap(
        id: json["id_pueblo_indigena"],
        vcNombre: json["vc_nombre"],
        teDescripcion: json["te_descripcion"],
        deLongitud: json["de_longitud"],
        deLatitud: json["de_latitud"],
        vcImage: json["vc_image"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "id_pueblo_indigena": id,
        "vc_nombre": vcNombre,
        "te_descripcion": teDescripcion,
        "de_longitud": deLongitud,
        "de_latitud": deLatitud,
        "vc_image": vcImage,
    };
}
