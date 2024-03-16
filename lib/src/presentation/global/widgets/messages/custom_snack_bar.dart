import 'package:flutter/material.dart';

ScaffoldMessengerState customSnackBar({
  required BuildContext context,
  required String title,
  bool large = false,
  bool error = false,
}) {
  final colorScheme = Theme.of(context).colorScheme;
return  ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: error ? colorScheme.error : colorScheme.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          duration:  Duration(milliseconds: large == false ? 3000 : 5000),
          content: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
}
