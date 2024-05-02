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
        name: 'Extinto',
        description: 'La especie ya no existe en la naturaleza',
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/ew_midagri.png',
          'assets/images/ew_uicn.png',
        ],
        name: 'Extinto en estado silvestre',
        description: 'La especie solo existe en cautiverio',
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/cr_midagri.png',
          'assets/images/cr_uicn.png',
        ],
        name: 'En peligro crítico',
        description:
            'La especie tiene un riesgo extremadamente alto de extinción en la naturaleza',
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/en_midagri.png',
          'assets/images/en_uicn.png',
        ],
        name: 'En peligro',
        description:
            'La especie tiene un riesgo muy alto de extinción en la naturaleza',
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/vu_midagri.png',
          'assets/images/vu_uicn.png',
        ],
        name: 'Vulnerable',
        description:
            'La especie tiene un riesgo alto de extinción en la naturaleza',
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/nt_midagri.png',
          'assets/images/nt_uicn.png',
        ],
        name: 'Casi amenazado',
        description:
            'La especie no está en peligro de extinción, pero podría estarlo en el futuro',
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/lc_midagri.png',
          'assets/images/lc_uicn.png',
        ],
        name: 'Preocupación menor',
        description: 'La especie no está en peligro de extinción',
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/dd_midagri.png',
          'assets/images/dd_uicn.png',
        ],
        name: 'Datos insuficientes',
        description:
            'No hay suficiente información para evaluar el riesgo de extinción de la especie',
      ),
      ConservationStatesHelper(
        images: [
          'assets/images/ne_midagri.png',
          'assets/images/ne_uicn.png',
        ],
        name: 'No evaluado',
        description: 'La especie no ha sido evaluada por la UICN',
      ),
      ConservationStatesHelper(
        images: ['assets/images/cites_i_cites.png'],
        name: 'Apéndice I',
        description:
            'todas las especies en peligro de extinción. El comercio de especímenes de esas especies se autoriza solamente bajo circunstancias excepcionales',
      ),
      ConservationStatesHelper(
        images: ['assets/images/cites_ii_cites.png'],
        name: 'Apéndice II',
        description:
            'especies que no se encuentran necesariamente en peligro de extinción, pero cuyo comercio debe controlarse a fin de evitar una utilización incompatible con su supervivencia',
      ),
      ConservationStatesHelper(
        images: ['assets/images/cites_iii_cites.png'],
        name: 'Apéndice III',
        description:
            'especies que están protegidas al menos en un país, el cual ha solicitado la asistencia de otras Partes en la CITES para controlar su comercio',
      ),
    ];
  }
}
