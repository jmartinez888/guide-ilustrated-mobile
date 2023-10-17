import 'dart:ui';
import 'package:species/src/presentation/global/colors.dart';

Color getMainColorByInt(int type) {
    switch (type) {
      case 1:
        return CustomColors.bird;
      case 2:
        return CustomColors.mammal;
      case 3:
        return CustomColors.reptile;
      case 4:
        return CustomColors.reptile;
      case 5:
        return CustomColors.fish;
      case 6:
        return CustomColors.insect;
      case 7:
        return CustomColors.tree;
      case 8:
        return CustomColors.palm;
      default:
        return CustomColors.primary;
    }
  }