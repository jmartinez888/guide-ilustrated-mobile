import 'package:remove_diacritic/remove_diacritic.dart';

class ValidateString {
  const ValidateString._();

  static String encode(String text) {
    return removeDiacritics(
            text.trim().replaceAll('ñ', 'N&').replaceAll('Ñ', 'N&'))
        .toUpperCase();
  }

  static String decode(String text) {
    return text
        .trim()
        .replaceAll('N&', 'Ñ')
        .replaceAll('n&', 'Ñ')
        .toUpperCase();
  }
}
