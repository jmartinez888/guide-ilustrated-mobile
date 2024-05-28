import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/global/icons/custom_icons.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';
import 'package:species/src/presentation/router/routes.dart';
import 'package:species/src/generated/translations.g.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: MessageException(
      lottie: 'assets/lotties/error_data.json',
      text: texts.errorPage.page_not_exist,
      onPressed: () => context.goNamed(Routes.species),
      buttonText: texts.errorPage.go_back,
      icon: CustomIcons.bird,
    ),
  );
  }
}