import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/phylum/phylum.dart';

class PhylumMapIntoClass implements JsonConverter<Phylum, dynamic> {
  const PhylumMapIntoClass();

  @override
  Phylum fromJson(dynamic phylum) => Phylum.fromJson(phylum);

  @override
  Map<String, dynamic> toJson(Phylum phylum) => phylum.toJson();
}