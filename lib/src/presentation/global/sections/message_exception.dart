import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';

class MessageException extends StatelessWidget {
  final String? text;
  final String lottie;
  final void Function()? onPressed;
  const MessageException({
    super.key,
    this.onPressed,
    required this.lottie, this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Extend(
      min: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
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
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                child: FilledButton.icon(
                  onPressed: onPressed,
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Actualizar'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
