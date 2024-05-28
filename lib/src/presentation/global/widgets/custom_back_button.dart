import 'package:flutter/material.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) => CustomIconButton(
        tooltip: texts.general.back,
        icon: Icons.arrow_back_ios_rounded,
        onPressed: () => Navigator.maybePop(context),
      );
}
