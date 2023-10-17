import 'dart:convert';
import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/data/mappers/specie_mapper.dart';
import 'package:species/src/data/models/species_iiap/response_species_iiap.dart';
import 'package:species/src/data/models/species_iiap/specie_species_iiap.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';

class SpecieSpeciesIIapRepositoryImpl implements SpecieRepository {
  final baseUrl = 'https://api.amazonia.iiap.gob.pe/api/v1';

  @override
  Future<void> getSpecies({
    required int pageKey,
    required int type,
    required int numberOfPostsPerRequest,
    required PagingController pagingController,
  }) async {
    try {
      final response = await get(Uri.parse(
          '$baseUrl/species/search/type/$type/$pageKey/$numberOfPostsPerRequest'));
      final responseList =
          ResponseSpeciesIiap.fromJson(jsonDecode(response.body));

      List<Specie> postList = responseList.species
          .where((speciesIiap) => speciesIiap.vcImagen.isNotEmpty)
          .map((speciesIiap) => SpecieMapper.speciesIiapToEntity(speciesIiap))
          .toList();

      final isLatPage = postList.length < numberOfPostsPerRequest;

      if (isLatPage) {
        pagingController.appendLastPage(postList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(postList, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  @override
  Future<Specie> getSpecieId(String id) async {
    final response = await get(Uri.parse('$baseUrl/species/$id'));
    if (response.statusCode != 200) {
      throw Exception('Specie no existe $id');
    }
    final specieDetail = SpecieSpeciesIiap.fromJson(jsonDecode(response.body));
    final Specie specie = SpecieMapper.speciesIiapToEntity(specieDetail);
    return specie;
  }
}
