import 'package:flutter/material.dart';

enum AppColorsEnum {
  darkBlue(Color.fromRGBO(23, 25, 45, 1)),
  blue(Color.fromRGBO(33, 136, 255, 1)),
  gray(Color.fromRGBO(142, 152, 163, 1)),
  darkGray(Color.fromRGBO(119, 129, 140, 1)),
  white(Color.fromRGBO(255, 255, 255, 1)),
  green(Color.fromRGBO(82, 196, 26, 1)),
  red(Color.fromRGBO(237, 56, 51, 1)),
  lightGray(Color.fromRGBO(234, 239, 243, 1)),
  ;

  final Color color;
  const AppColorsEnum(this.color);
}
