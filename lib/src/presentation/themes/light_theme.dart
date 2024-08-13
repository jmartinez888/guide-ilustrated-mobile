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
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        CustomColors.primary,
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        CustomColors.white,
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    )),
    dropdownMenuTheme: const DropdownMenuThemeData(
      textStyle: TextStyle(
        color: CustomColors.primary,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
      menuStyle: MenuStyle(
        backgroundColor: MaterialStatePropertyAll(
          CustomColors.primary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
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

   static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: CustomColors.darkPrimary,
      onPrimary: CustomColors.blackLight,
      primaryContainer: CustomColors.darkPrimaryContainer,
      onPrimaryContainer: CustomColors.darkPrimaryOnContainer,
      secondary: CustomColors.darkSecondary,
      onSecondary: CustomColors.white,
      secondaryContainer: CustomColors.darkSecondaryContainer,
      onSecondaryContainer: CustomColors.darkSecondaryOnContainer,
      tertiary: CustomColors.darkTertiary,
      onTertiary: CustomColors.white,
      tertiaryContainer: CustomColors.darkTertiaryContainer,
      onTertiaryContainer: CustomColors.darkTertiaryOnContainer,
      error: CustomColors.darkError,
      onError: CustomColors.darkBackground,
      errorContainer: CustomColors.darkErrorContainer,
      onErrorContainer: CustomColors.darkErrorOnContainer,
      background: CustomColors.darkBackground,
      onBackground: CustomColors.darkGreyOnContainer,// no se que hace
      surface: CustomColors.darkSurface,
      onSurface: CustomColors.darkGrey, //texto de arriba en el home, texto name comun en busqueda y color de iconos ahi mismo
      outline: CustomColors.darkGreyContainer,// color cuando carga contenido y color de fondo de la barra de busqueda
      onSurfaceVariant: CustomColors.darkGrey,//color de iconos abajo y arriba y texto de descripcion y color texto nombre cientifico
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          CustomColors.darkPrimary,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          CustomColors.white,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      textStyle: TextStyle(
        color: CustomColors.darkPrimary,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
      menuStyle: MenuStyle(
        backgroundColor: MaterialStatePropertyAll(
          CustomColors.darkPrimary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: CustomColors.darkPrimary,
      foregroundColor: CustomColors.white,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: CustomColors.darkBackground,
      surfaceTintColor: CustomColors.darkBackground,
    ),
    iconTheme: const IconThemeData (color: CustomColors.white), // (color: CustomColors.primaryContainer), //(color: CustomColors.bird),//color de iconos de menu y volver atras
    appBarTheme: const AppBarTheme(
      //foregroundColor: CustomColors.darkBackground,
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
      backgroundColor: CustomColors.darkBackground,
      surfaceTintColor: Colors.transparent,
      height: 68.0,
      indicatorColor: CustomColors.primary,// color del icono select
      iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return const IconThemeData(color: CustomColors.primaryContainer);// color relleno del icono select
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
              color: CustomColors.palmContainer,//color de texto de la barra de navegacion seleccionado
            );
          } else {
            return const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
              color: CustomColors.darkGrey,//color de texto de la barra de navegacion
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
