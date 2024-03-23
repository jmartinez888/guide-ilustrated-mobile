import 'package:species/src/data/mappers/author_mapper.dart';
import 'package:species/src/data/mappers/class_mapper.dart';
import 'package:species/src/data/mappers/conservation_state_mapper.dart';
import 'package:species/src/data/mappers/family_mapper.dart';
import 'package:species/src/data/mappers/kindom_mapper.dart';
import 'package:species/src/data/mappers/order_maper.dart';
import 'package:species/src/data/mappers/phylum_mapper.dart';
import 'package:species/src/data/mappers/type_mapper.dart';
import 'package:species/src/data/models/classes/specie_iiap/specie_iiap.dart';
import 'package:species/src/data/models/classes/type_iiap/type_iiap.dart';
import 'package:species/src/domain/entities/specie/specie.dart';

class SpecieMapper {
  final TypeMapper _typeMapper;
  final ConservationStateMapper _conservationStateMapper;
  final AuthorMapper _authorMapper;
  final KingdomMapper _kingdomMapper;
  final PhylumMapper _phylumMapper;
  final ClassMapper _classMapper;
  final OrderMapper _orderMapper;
  final FamilyMapper _familyMapper;

  SpecieMapper(
      {required TypeMapper typeMapper,
      required ConservationStateMapper conservationStateMapper,
      required AuthorMapper authorMapper,
      required KingdomMapper kingdomMapper,
      required PhylumMapper phylumMapper,
      required ClassMapper classMapper,
      required OrderMapper orderMapper,
      required FamilyMapper familyMapper})
      : _typeMapper = typeMapper,
        _conservationStateMapper = conservationStateMapper,
        _authorMapper = authorMapper,
        _kingdomMapper = kingdomMapper,
        _phylumMapper = phylumMapper,
        _classMapper = classMapper,
        _orderMapper = orderMapper,
        _familyMapper = familyMapper;

  Specie specieIiapToSpecie(SpecieIiap specie) {
    return Specie(
      id: specie.id,
      name: specie.name,
      scientificName: specie.scientificName,
      englishName: specie.englishName,
      year: specie.year,
      idFamily: specie.idFamily,
      images: specie.image != null && specie.image!.isNotEmpty
          ? [specie.image!]
          : null,
      type: specie.type != null
          ? _typeMapper.typeIiapToType(
              TypeIiap(
                id: specie.type!.id,
                name: specie.type!.name,
                image: specie.type!.image,
                primaryColor: specie.type!.primaryColor,
                secondaryColor: specie.type!.secondaryColor,
                state: specie.type!.state,
              ),
            )
          : null,
      sound: specie.sound,
      description: specie.description,
      conservationStates: specie.conservationStates != null &&
              specie.conservationStates!.isNotEmpty
          ? specie.conservationStates!
              .map((state) => _conservationStateMapper
                  .conservationStateIiapToConservationState(state))
              .toList()
          : null,
      authors: specie.authors != null && specie.authors!.isNotEmpty
          ? specie.authors!
              .map((author) => _authorMapper.authorIiapToAuthor(author))
              .toList()
          : null,
      kingdom: specie.taxonomy != null && specie.taxonomy!.kingdom != null
          ? _kingdomMapper.kingdomIiapTokingdom(specie.taxonomy!.kingdom!)
          : null,
      phylum: specie.taxonomy != null && specie.taxonomy!.phylum != null
          ? _phylumMapper.phylumIiapToPhylum(specie.taxonomy!.phylum!)
          : null,
      classC: specie.taxonomy != null && specie.taxonomy!.classC != null
          ? _classMapper.classIiapToClass(specie.taxonomy!.classC!)
          : null,
      order: specie.taxonomy != null && specie.taxonomy!.order != null
          ? _orderMapper.orderIiapToOrder(specie.taxonomy!.order!)
          : null,
      family: specie.taxonomy != null && specie.taxonomy!.family != null
          ? _familyMapper.familyIiapToFamily(specie.taxonomy!.family!)
          : null,
      state: specie.state,
    );
  }
}
