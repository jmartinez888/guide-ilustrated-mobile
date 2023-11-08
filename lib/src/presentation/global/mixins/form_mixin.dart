import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

mixin FormMixin<T extends StatefulWidget> on State<T> {
  TextInputFormatter withoutSpaces =
      FilteringTextInputFormatter.deny(RegExp(r'[\s\n]'));
  String? passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su contraseña';
    }
    if (value.length < 6) {
      return 'Ingrese al menos 6 caracteres';
    }
    if (!RegExp(r"^(?=.*\d)(?=.*[a-zA-Z]).{6,}$").hasMatch(value)) {
      return 'La contraseña debe contener al menos un número y una letra';
    }
    return null;
  }

  String? repeatPasswordValidator(String? value, String repeatPassword) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su contraseña';
    }
    if (value.length < 6) {
      return 'Ingrese al menos 6 caracteres';
    }
    if (!RegExp(r"^(?=.*\d)(?=.*[a-zA-Z]).{6,}$").hasMatch(value)) {
      return 'La contraseña debe contener al menos un número y una letra';
    }
    if (value != repeatPassword) {
      return 'Las contraseñas deben ser iguales';
    }
    return null;
  }

  String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su email';
    }
    if (!RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    ).hasMatch(value)) {
      return 'Ingrese un email válido';
    }
    return null;
  }

  String? nameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su nombre';
    }
    if (value.length < 3) {
      return 'Ingrese al menos 3 caracteres';
    }
    return null;
  }

  String? lastNameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su apellido';
    }
    if (value.length < 3) {
      return 'Ingrese al menos 3 caracteres';
    }
    return null;
  }

  String? phoneValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su teléfono';
    }
    if (value.length < 9) {
      return 'Ingrese al menos 9 caracteres';
    }
    return null;
  }
}
