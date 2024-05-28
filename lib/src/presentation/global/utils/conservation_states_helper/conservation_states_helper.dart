import 'package:species/src/generated/translations.g.dart';

class ConservationStatesHelper {
  final List<String> images;
  final String name;
  final String description;

  ConservationStatesHelper({
    required this.images,
    required this.name,
    required this.description,
  });

  static List<ConservationStatesHelper> allConservationStates() {
    return [
      ConservationStatesHelper(
        images: [
          'assets/images/ex_midagri.png',
          'assets/images/ex_uicn.png',
        ],
        name: texts.speciesDetails.extinct,
        description: texts.speciesDetails.extinctDescription,
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/ew_midagri.png',
          'assets/images/ew_uicn.png',
        ],
        name: texts.speciesDetails.extinctWild,
        description: texts.speciesDetails.extinctWildDescription,
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/cr_midagri.png',
          'assets/images/cr_uicn.png',
        ],
        name: texts.speciesDetails.criticallyEndangered,
        description: texts.speciesDetails.criticallyEndangeredDescription,
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/en_midagri.png',
          'assets/images/en_uicn.png',
        ],
        name: texts.speciesDetails.endangered,
        description: texts.speciesDetails.endangeredDescription,
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/vu_midagri.png',
          'assets/images/vu_uicn.png',
        ],
        name: texts.speciesDetails.vulnerable,
        description: texts.speciesDetails.vulnerableDescription,
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/nt_midagri.png',
          'assets/images/nt_uicn.png',
        ],
        name: texts.speciesDetails.almostThreatened,
        description: texts.speciesDetails.almostThreatenedDescription,
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/lc_midagri.png',
          'assets/images/lc_uicn.png',
        ],
        name: texts.speciesDetails.minorConcern,
        description: texts.speciesDetails.minorConcernDescription,
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/dd_midagri.png',
          'assets/images/dd_uicn.png',
        ],
        name: texts.speciesDetails.insufficientData,
        description: texts.speciesDetails.insufficientDataDescription,
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/ne_midagri.png',
          'assets/images/ne_uicn.png',
        ],
        name: texts.speciesDetails.notRated,
        description: texts.speciesDetails.notRatedDescription,
      ),
      ConservationStatesHelper(
        images: ['assets/images/cites_i_cites.png'],
        name: texts.speciesDetails.appendix1,
        description: texts.speciesDetails.appendix1Description,
      ),
      ConservationStatesHelper(
        images: ['assets/images/cites_ii_cites.png'],
        name: texts.speciesDetails.appendix2,
        description: texts.speciesDetails.appendix2Description,
      ),
      ConservationStatesHelper(
        images: ['assets/images/cites_iii_cites.png'],
        name: texts.speciesDetails.appendix3,
        description: texts.speciesDetails.appendix3Description,
      ),
    ];
  }
}
