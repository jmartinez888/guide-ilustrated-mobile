import 'package:species/src/presentation/global/colors.dart';

Map<String, dynamic> getMainColorByString(int type) {
  switch (type) {
    case 1:
      return {
        'main': CustomColors.bird,
        'opaque': CustomColors.birdContainer,
      };
    case 2:
      return {
        'main': CustomColors.mammal,
        'opaque': CustomColors.mammalContainer,
      };
    case 3:
      return {
        'main': CustomColors.reptile,
        'opaque': CustomColors.reptileContainer,
      };
    case 4:
      return {
        'main': CustomColors.reptile,
        'opaque': CustomColors.reptileContainer,
      };
    case 5:
      return {
        'main': CustomColors.fish,
        'opaque': CustomColors.fishContainer,
      };
    case 6:
      return {
        'main': CustomColors.insect,
        'opaque': CustomColors.insectContainer,
      };
    case 7:
      return {
        'main': CustomColors.tree,
        'opaque': CustomColors.treeContainer,
      };
    case 8:
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
