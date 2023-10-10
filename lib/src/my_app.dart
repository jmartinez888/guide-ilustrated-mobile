import 'package:flutter/material.dart';
import 'package:species/src/presentation/pages/home_page.dart';
import 'package:species/src/presentation/themes/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soecies IIAP',
      theme: CustomTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
