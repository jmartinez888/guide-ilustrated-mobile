import 'package:species/src/data/mappers/specie_for_author_mapper.dart';
import 'package:species/src/data/models/classes/author_iiap/author_iiap.dart';
import 'package:species/src/domain/entities/author/author.dart';
import 'package:species/src/presentation/global/functions/generate_search/generate_search.dart';
import 'package:species/src/presentation/global/functions/validate_string/validate_string.dart';

class AuthorMapper {
  final SpecieForAuthorMapper _specieForAuthorMapper;

  AuthorMapper({required SpecieForAuthorMapper specieForAuthorMapper})
      : _specieForAuthorMapper = specieForAuthorMapper;

  Author authorIiapToAuthor(AuthorIiap author) {
    return Author(
      id: author.id,
      name: author.name,
      lastname: author.lastname,
      biography: author.biography,
      yearOfBirth: author.yearOfBirth,
      yearOfDeath: author.yearOfDeath,
      profession: author.profession,
      images: author.image != null && author.image!.isNotEmpty
          ? [author.image!]
          : null,
      state: author.state,
      species: author.species != null && author.species!.isNotEmpty
          ? author.species!
              .map(
                  (specie) => _specieForAuthorMapper.specieIiapToSpecie(specie))
              .toList()
          : null,
      search: GenerateSearch.generarBusquedas(
        [
          if (author.name != null && author.name!.isNotEmpty)
            ValidateString.encode(author.name!),
          if (author.lastname != null && author.lastname!.isNotEmpty)
            ValidateString.encode(author.lastname!),
            if (author.profession != null && author.profession!.isNotEmpty)
            ValidateString.encode(author.profession!),
        ],
      ),
    );
  }
}
