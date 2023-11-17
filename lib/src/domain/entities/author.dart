class Author {
  final int idAutor;
  final String vcNombre;
  final String anoNacimientoAutor;
  final String anoDecesoAutor;
  final String biografiaAutor;
  final String profesionAutor;
  final int actualizado;
  final String imagenAutor;
  final String estadoAutor;

  Author({
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

  factory Author.fromJson(Map<String, dynamic> json) => Author(
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
