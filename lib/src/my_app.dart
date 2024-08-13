import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/router/routes_config.dart';
import 'package:species/src/presentation/themes/light_theme.dart';
import 'package:species/src/presentation/global/widgets/buttons/ThemeNotifier.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, _) {
          return MaterialApp.router(
            title: 'Guía Ilustrada de Flora y Fauna IIAP',
            debugShowCheckedModeBanner: false,
            supportedLocales: LocaleSettings.instance.supportedLocales,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: TranslationProvider.of(context).flutterLocale,
            theme: CustomTheme.lightTheme,
            darkTheme: CustomTheme.darkTheme,
            themeMode: themeNotifier.themeMode,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
