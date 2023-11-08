import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/colors.dart';
class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.backgroundColor,
    required this.icon,
    this.iconColor,
    required this.onPressed,
    this.tooltip,
  });

  final Color? backgroundColor;
  final String? tooltip;
  final IconData icon;
  final Color? iconColor;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
  const double heightIcon = 40.0;
    return Container(
      height: heightIcon,
      width: heightIcon,
      decoration: BoxDecoration(color: backgroundColor ?? CustomColors.whiteOpacity, shape: BoxShape.circle),
      child: IconButton(
        tooltip: tooltip,
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
