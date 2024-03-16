import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/router/routes_config.dart';
import 'package:species/src/presentation/themes/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Guia Ilustrada de Flora y Fauna IIAP',
      debugShowCheckedModeBanner: false,
      supportedLocales: LocaleSettings.instance.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: TranslationProvider.of(context).flutterLocale,
      theme: CustomTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
