import 'package:species/src/presentation/global/colors.dart';

Map<String, dynamic> getMainColorByString(String type) {
  switch (type) {
    case 'Aves':
      return {
        'main': CustomColors.bird,
        'opaque': CustomColors.birdContainer,
      };
    case 'Mamiferos':
      return {
        'main': CustomColors.mammal,
        'opaque': CustomColors.mammalContainer,
      };
    case 'Reptiles':
      return {
        'main': CustomColors.reptile,
        'opaque': CustomColors.reptileContainer,
      };
    case 'Anfibios':
      return {
        'main': CustomColors.reptile,
        'opaque': CustomColors.reptileContainer,
      };
    case 'Peces':
      return {
        'main': CustomColors.fish,
        'opaque': CustomColors.fishContainer,
      };
    case 'Insectos':
      return {
        'main': CustomColors.insect,
        'opaque': CustomColors.insectContainer,
      };
    case 'Arboles':
      return {
        'main': CustomColors.tree,
        'opaque': CustomColors.treeContainer,
      };
    case 'Palmeras':
      return {
        'main': CustomColors.palm,
        'opaque': CustomColors.palmContainer,
      };
    default:
      return {
        'main': CustomColors.bird,
        'opaque': CustomColors.birdContainer,
      };
  }
}
