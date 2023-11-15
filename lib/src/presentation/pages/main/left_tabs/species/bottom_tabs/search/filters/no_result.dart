import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorIndicator extends StatelessWidget {
  final Object? error;
  final VoidCallback onTryAgain;

  const ErrorIndicator({
    Key? key,
    required this.error,
    required this.onTryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lotties/without_data.json',
            height: 150.0,
            width: 150.0,
          ),
          Text(
            'Mil disculpas, no se encontraron resultados que coincidan con tu búsqueda. Por favor, intente realizar una búsqueda diferente.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8.0),
          FilledButton.icon(
            onPressed: onTryAgain,
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Reintentar'),
          )
        ],
      ),
    );
  }
}
