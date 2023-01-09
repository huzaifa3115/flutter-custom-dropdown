import 'package:flutter/material.dart';
import 'fonts.dart';

class Styles extends TextStyle {
  static TextStyle generateRedRegularFont(
      Color color, var height, double? fontSize) {
    return TextStyle(
        fontFamily: Fonts.redregular,
        fontSize: fontSize,
        height: height,
        fontStyle: FontStyle.normal,
        color: color,
        decoration: TextDecoration.none);
  }

  static TextStyle generateRedMediumFont(
      Color color, var height, double? fontSize) {
    return TextStyle(
        fontFamily: Fonts.redMedium,
        fontSize: fontSize,
        height: height,
        fontStyle: FontStyle.normal,
        color: color,
        decoration: TextDecoration.none);
  }

  static TextStyle generateRedSemiBoldFont(
      Color color, var height, double? fontSize) {
    return TextStyle(
        fontFamily: Fonts.redSemiBold,
        fontSize: fontSize,
        height: height,
        fontStyle: FontStyle.normal,
        color: color,
        decoration: TextDecoration.none);
  }

  static TextStyle generateRedBoldFont(
      Color color, var height, double? fontSize) {
    return TextStyle(
        fontFamily: Fonts.redBold,
        fontSize: fontSize,
        height: height,
        fontStyle: FontStyle.normal,
        color: color,
        decoration: TextDecoration.none);
  }
}
