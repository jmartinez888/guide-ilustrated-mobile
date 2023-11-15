import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/global/icons/custom_icons.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';
import 'package:species/src/presentation/router/routes.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: MessageException(
      lottie: 'assets/lotties/error_data.json',
      text: 'Esta página ya no existe',
      onPressed: () => context.goNamed(Routes.species),
      buttonText: 'Volver a Especies',
      icon: CustomIcons.bird,
    ),
  );
  }
}