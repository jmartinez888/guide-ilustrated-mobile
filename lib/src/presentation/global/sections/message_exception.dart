import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';

class MessageException extends StatelessWidget {
  final String? text;
  final String? buttonText;
  final IconData? icon;
  final String lottie;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;
  const MessageException({
    super.key,
    this.onPressed,
    required this.lottie,
    this.text,
    this.buttonText,
    this.icon,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Extend(
        min: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: PaddingConfig.onlyBottomL,
              child: Text(
                text ?? 'Algo salió mal, intentalo de nuevo',
                style: textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Lottie.asset(
              lottie,
              width: 256.0,
              height: 256.0,
            ),
            if (onPressed != null)
              Padding(
                padding: PaddingConfig.onlyTopL,
                child: Center(
                  child: FilledButton.icon(
                    onPressed: onPressed,
                    icon: Icon(icon ?? Icons.refresh_rounded),
                    label: Text(buttonText ?? 'Actualizar'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
