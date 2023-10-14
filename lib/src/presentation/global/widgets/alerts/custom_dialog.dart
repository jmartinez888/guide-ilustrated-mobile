import 'package:flutter/material.dart';

Future<void> customDialog({
  required context,
  Widget? body,
  String title = '',
  Function()? actions,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: body,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: actions,
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
