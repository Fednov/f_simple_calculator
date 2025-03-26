import 'dart:math' as math;

import 'package:f_simple_calculator/core/utils/constants/numbers.dart';

extension StringExtension on String {
  num? toNum() {
    return num.tryParse(this);
  }

  String deleteLastSymbol() {
    var splitString = split('')..removeLast();
    var joinedString = splitString.join('');

    return joinedString;
  }

  String convertDotToComma() {
    return replaceAll('.', ',');
  }

  String removeMinus() {
    return replaceAll('-', '');
  }

  String limitDecimalCharacters() {
    if (contains(kComma)) {
      var splittedOldString = split(kComma);
      var maximumNumberOfDecimalPlaces =
          math.min(splittedOldString[1].length, 7);
      var formattedString =
          '${splittedOldString[0]}$kComma${splittedOldString[1].substring(0, maximumNumberOfDecimalPlaces)}';

      return formattedString;
    }

    return this;
  }
}
