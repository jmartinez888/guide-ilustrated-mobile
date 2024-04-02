import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/data/models/classes/taxonomy_iiap/taxonomy_iiap.dart';

class TaxonomyIiapMapIntoClass implements JsonConverter<TaxonomyIiap, dynamic> {
  const TaxonomyIiapMapIntoClass();

  @override
  TaxonomyIiap fromJson(dynamic taxonomy) => TaxonomyIiap.fromJson(taxonomy);

  @override
  Map<String, dynamic> toJson(TaxonomyIiap taxonomy) => taxonomy.toJson();
}