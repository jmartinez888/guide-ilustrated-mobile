class Specie {
  final int id;
  final String name;
  final String scientificName;
  final String year;
  final List<String> images;
  final String description;
  final String sound;
  final String kingdom;
  final String phylum;
  final String class_;
  final String order;
  final String family;
  final String type;
  final List<String> authors;
  final List<String> statusImage;

  Specie({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.year,
    required this.images,
    required this.description,
    required this.sound,
    required this.kingdom,
    required this.phylum,
    required this.class_,
    required this.order,
    required this.family,
    required this.type,
    required this.authors,
    required this.statusImage,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'scientificName': scientificName,
        'year': year,
        'images': images,
        'description': description,
        'sound': sound,
        'kingdom': kingdom,
        'phylum': phylum,
        'class_': class_,
        'order': order,
        'family': family,
        'type': type,
        'authors': authors,
        'vc_imagenes_estado': statusImage,
      };

  factory Specie.fromJson(Map<String, dynamic> json) => Specie(
        id: json['id'],
        name: json['name'],
        scientificName:  json['scientificName'],
        year: json['year'],
        images: List<String>.from(json['images'].map((x) => x)),
        description: json['description'],
        sound:
            json['sound'],
        kingdom: json['kingdom'],
        phylum: json['phylum'],
        class_: json['class_'],
        order: json['order'],
        family: json['family'],
        type: json['type'],
        authors: List<String>.from(json['authors'].map((x) => x)),
        statusImage: List<String>.from(json['vc_imagenes_estado'].map((x) => x)),
      );
}
