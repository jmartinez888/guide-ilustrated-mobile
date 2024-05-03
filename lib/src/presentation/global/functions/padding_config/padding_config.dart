import 'package:flutter/material.dart';

class PaddingConfig {
  static const double _num4 = 4.0;
  static const double _num8 = 8.0;
  static const double _num16 = 16.0;
  static const double _num100 = 100.0;

  static EdgeInsets onlyTopS = const EdgeInsets.only(top: _num4);
  static EdgeInsets onlyTop = const EdgeInsets.only(top: _num8);
  static EdgeInsets onlyTopL = const EdgeInsets.only(top: _num16);

  static EdgeInsets onlyBottomS = const EdgeInsets.only(bottom: _num4);
  static EdgeInsets onlyBottom = const EdgeInsets.only(bottom: _num8);
  static EdgeInsets onlyBottomL = const EdgeInsets.only(bottom: _num16);

  static EdgeInsets onlyRightS = const EdgeInsets.only(right: _num4);
  static EdgeInsets onlyRight = const EdgeInsets.only(right: _num8);
  static EdgeInsets onlyRightL = const EdgeInsets.only(right: _num16);

  static EdgeInsets onlyLeftS = const EdgeInsets.only(left: _num4);
  static EdgeInsets onlyLeft = const EdgeInsets.only(left: _num8);
  static EdgeInsets onlyLeftL = const EdgeInsets.only(left: _num16);

  static EdgeInsets allS = const EdgeInsets.all(_num4);
  static EdgeInsets all = const EdgeInsets.all(_num8);
  static EdgeInsets allL = const EdgeInsets.all(_num16);

  static EdgeInsets allWithoutBottomL =
      const EdgeInsets.only(top: _num16, left: _num16, right: _num16);

  static EdgeInsets allWithouTopL =
      const EdgeInsets.only(left: _num16, right: _num16, bottom: _num16);

  static EdgeInsets allWithoutTopL =
      const EdgeInsets.only(bottom: _num16, left: _num16, right: _num16);

  static EdgeInsets allBottomSafeS =
      const EdgeInsets.fromLTRB(_num4, _num4, _num4, _num100);
  static EdgeInsets allBottomSafe =
      const EdgeInsets.fromLTRB(_num8, _num8, _num8, _num100);
  static EdgeInsets allBottomSafeL =
      const EdgeInsets.fromLTRB(_num16, _num16, _num16, _num100);

  static EdgeInsets allWithoutTopBottomSafeL = const EdgeInsets.only(
    left: _num16,
    right: _num16,
    bottom: _num100,
  );

  static EdgeInsets symetrictHorizontalS =
      const EdgeInsets.symmetric(horizontal: _num4);
  static EdgeInsets symetrictHorizontal =
      const EdgeInsets.symmetric(horizontal: _num8);
  static EdgeInsets symetrictHorizontalL =
      const EdgeInsets.symmetric(horizontal: _num16);

  static EdgeInsets symetrictVerticalS =
      const EdgeInsets.symmetric(vertical: _num4);
  static EdgeInsets symetrictVertical =
      const EdgeInsets.symmetric(vertical: _num8);
  static EdgeInsets symetrictVerticalL =
      const EdgeInsets.symmetric(vertical: _num16);

  static EdgeInsets asymetrict =
      const EdgeInsets.symmetric(horizontal: _num16, vertical: _num8);
}
