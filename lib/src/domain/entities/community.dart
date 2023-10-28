class Community {
  final int id;
  final String name;
  final String description;
  final double length;
  final double latitude;
  final String image;

  Community({
    required this.id,
    required this.name,
    required this.description,
    required this.length,
    required this.latitude,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'length': length,
        'latitude': latitude,
        'image': image,
      };

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        id: json['id'],
        name: json['name'],
        description: json['te_descripcion'],
        length: json['length'],
        latitude: json['latitude'],
        image: json['image'],
      );
}
