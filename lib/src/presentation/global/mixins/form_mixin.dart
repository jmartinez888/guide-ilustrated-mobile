import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:species/src/generated/translations.g.dart';

mixin FormMixin<T extends StatefulWidget> on State<T> {
  TextInputFormatter withoutSpaces =
      FilteringTextInputFormatter.deny(RegExp(r'[\s\n]'));
  String? passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return texts.validator.password.empty;
    }
    if (value.length < 6) {
      return texts.validator.password.minLength;
    }
    if (!RegExp(r"^(?=.*\d)(?=.*[a-zA-Z]).{6,}$").hasMatch(value)) {
      return texts.validator.password.regExp;
    }
    return null;
  }

  String? repeatPasswordValidator(String? value, String repeatPassword) {
    if (value == null || value.isEmpty) {
      return texts.validator.repeatPassword.empty;
    }
    if (value.length < 6) {
      return texts.validator.repeatPassword.minLength;
    }
    if (!RegExp(r"^(?=.*\d)(?=.*[a-zA-Z]).{6,}$").hasMatch(value)) {
      return texts.validator.repeatPassword.regExp;
    }
    if (value != repeatPassword) {
      return texts.validator.repeatPassword.matchPassword;
    }
    return null;
  }

  String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return texts.validator.email.empty;
    }
    if (!RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    ).hasMatch(value)) {
      return texts.validator.email.regExp;
    }
    return null;
  }

  String? nameValidator(value) {
    if (value == null || value.isEmpty) {
      return texts.validator.name.empty;
    }
    if (value.length < 3) {
      return texts.validator.name.minLength;
    }
    return null;
  }

  String? lastNameValidator(value) {
    if (value == null || value.isEmpty) {
      return texts.validator.lastName.empty;
    }
    if (value.length < 3) {
      return texts.validator.lastName.minLength;
    }
    return null;
  }

  String? phoneValidator(value) {
    if (value == null || value.isEmpty) {
      return texts.validator.phone.empty;
    }
    if (value.length < 9) {
      return texts.validator.phone.minLength;
    }

    if (!RegExp(r"^(?:[+0]9)?[0-9]{9}$").hasMatch(value)) {
      return texts.validator.phone.regExp;
    }

    return null;
  }
}
