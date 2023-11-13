import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/router/routes.dart';

Future<void> profileSuccessModal(BuildContext context) {
  return showModalBottomSheet<void>(
    isDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Sus datos se han actualizado correctamente',
                  style: Theme.of(context).textTheme.bodyLarge),
              FilledButton(
                child: const Text('Aceptar'),
                onPressed: () => context.goNamed(Routes.profile),
              ),
            ],
          ),
        ),
      );
    },
  );
}
