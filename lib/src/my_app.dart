import 'package:flutter/material.dart';
import 'package:species/src/presentation/router/routes_config.dart';
import 'package:species/src/presentation/themes/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Species IIAP',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
