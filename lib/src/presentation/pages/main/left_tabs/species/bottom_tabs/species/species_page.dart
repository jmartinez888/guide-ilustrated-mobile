import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/router/routes.dart';

class SpeciesPage extends StatelessWidget {
  const SpeciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: () => context.pushNamed(Routes.specieDetails),
        child: const Text('Ir a detalles'),
      ),
    );
  }
}
