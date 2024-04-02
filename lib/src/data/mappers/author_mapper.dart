import 'package:species/src/data/mappers/specie_for_author_mapper.dart';
import 'package:species/src/data/models/classes/author_iiap/author_iiap.dart';
import 'package:species/src/domain/entities/author/author.dart';

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
      image: author.image,
      state: author.state,
      species: author.species != null && author.species!.isNotEmpty
          ? author.species!
              .map(
                  (specie) => _specieForAuthorMapper.specieIiapToSpecie(specie))
              .toList()
          : null,
    );
  }
}
