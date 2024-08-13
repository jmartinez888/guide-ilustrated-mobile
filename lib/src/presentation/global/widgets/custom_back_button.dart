import 'package:flutter/material.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    // Configuración de colores según el tema actual
    final Color iconColor = theme.brightness == Brightness.dark 
        ? CustomColors.white 
        : CustomColors.black;
    final Color backgroundColor = theme.brightness == Brightness.dark 
        ? CustomColors.darkSurface 
        : CustomColors.white;

    return CustomIconButton(
      tooltip: texts.general.back,
      icon: Icons.arrow_back_ios_rounded,
      iconColor: iconColor,
      onPressed: () => Navigator.maybePop(context),
      backgroundColor: backgroundColor,
    );
  }
}

