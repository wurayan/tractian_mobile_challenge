import 'package:flutter/material.dart';
import 'package:tractian_challenge_treeview/utils/colors.dart';

class AppStyles {
  static TextStyle titleText = TextStyle(
      color: AppColorsEnum.white.color,
      fontSize: 18,
      fontFamily: "roboto",
      fontWeight: FontWeight.w400);
  static TextStyle bodyText = const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: "roboto",
    fontWeight: FontWeight.w400,
  );
  static TextStyle buttonText = TextStyle(
    color: AppColorsEnum.gray.color,
    fontFamily: "roboto",
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static OutlineInputBorder searchbarOutline = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(5),
  );
  static InputDecoration searchbarTextFormField = InputDecoration(
      filled: true,
      fillColor: AppColorsEnum.lightGray.color,
      hintText: "Buscar Ativo ou Local",
      hintStyle: bodyText.copyWith(color: AppColorsEnum.gray.color),
      prefixIcon: Icon(
        Icons.search,
        size: 20,
        color: AppColorsEnum.gray.color,
      ),
      border: searchbarOutline,
      focusedBorder: searchbarOutline,
      enabledBorder: searchbarOutline,
      contentPadding: EdgeInsets.zero);
}
