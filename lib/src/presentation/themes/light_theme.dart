import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/colors.dart';

class CustomTheme {
  CustomTheme._();

  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: CustomColors.primary,
      onPrimary: CustomColors.white,
      primaryContainer: CustomColors.primaryContainer,
      onPrimaryContainer: CustomColors.primaryOnContainer,
      secondary: CustomColors.secondary,
      onSecondary: CustomColors.white,
      secondaryContainer: CustomColors.secondaryContainer,
      onSecondaryContainer: CustomColors.secondaryOnContainer,
      tertiary: CustomColors.tertiary,
      onTertiary: CustomColors.white,
      tertiaryContainer: CustomColors.tertiaryContainer,
      onTertiaryContainer: CustomColors.tertiaryOnContainer,
      error: CustomColors.error,
      onError: CustomColors.white,
      errorContainer: CustomColors.secondaryContainer,
      onErrorContainer: CustomColors.errorOnContainer,
      background: CustomColors.background,
      onBackground: CustomColors.greyOnContainer,
      surface: CustomColors.background,
      onSurface: CustomColors.greyOnContainer,
      outline: CustomColors.greyContainer,
      onSurfaceVariant: CustomColors.grey,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: CustomColors.primary,
      foregroundColor: CustomColors.white,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: CustomColors.background,
      surfaceTintColor: CustomColors.background,
    ),
    iconTheme: const IconThemeData(color: CustomColors.greyOnContainer),
    appBarTheme: const AppBarTheme(
      //foregroundColor: CustomColors.background,
      surfaceTintColor: Colors.transparent,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: CustomColors.background,
      surfaceTintColor: Colors.transparent,
      height: 68.0,
      indicatorColor: CustomColors.primaryContainer,
      iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return const IconThemeData(color: CustomColors.primary);
          } else {
            return null;
          }
        },
      ),
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
              color: CustomColors.primary,
            );
          } else {
            return const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
              color: CustomColors.grey,
            );
          }
        },
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
        TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
      },
    ),
    useMaterial3: true,
  );
}
