import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/widgets/buttons/ThemeNotifier.dart';

class ButtonDarkMode extends StatelessWidget {
  const ButtonDarkMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();

    return ListTile(
      leading: Icon(
        themeNotifier.themeMode == ThemeMode.dark ? Icons.brightness_6_outlined : Icons.dark_mode,
      ),
      // title: Text(
      //   themeNotifier.themeMode == ThemeMode.dark ?  'Modo Claro' : 'Modo Oscuro', //el texto ponlo con el mismo estilo de letra que que las letras del menu
      //  style: Theme.of(context).textTheme.titleSmall 
      // ),
      onTap: () {
        themeNotifier.toggleTheme(); // Cambia el tema globalmente
      },
    );
  }
}
