import 'package:f_simple_calculator/core/utils/constants/numbers.dart';

extension StringExtension on String {
  num? toNum() {
    return num.tryParse(this);
  }

  String deleteLastSymbol() {
    var splitString = split('');
    splitString.removeLast();
    var joinedString = splitString.join('');

    return joinedString;
  }

  String convertDotToComma() {
    return replaceAll('.', ',');
  }

  String removeMinus() {
    return replaceAll('-', '');
  }

  String limitSymbolsAfterDot() {
    if (contains(kComma)) {
      var splittedOldString = split(kComma);
      var formattedString =
          '${splittedOldString[0]}$kComma${splittedOldString[1].substring(0, 7)}';

      return formattedString;
    }

    return this;
  }
}
