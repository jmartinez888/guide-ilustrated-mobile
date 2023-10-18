import 'package:flutter/material.dart';

ScaffoldMessengerState customSnackBar({
  required BuildContext context,
  required String title,
  Color? backgroundColor,
}) =>
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          duration: const Duration(milliseconds: 2500),
          content: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
