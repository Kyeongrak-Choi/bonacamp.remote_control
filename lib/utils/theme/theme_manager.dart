import 'package:flutter/material.dart';
import 'package:server_manager/utils/theme/text_theme.dart';

import 'appbar_theme.dart';
import 'color_manager.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarThemeLight(),
    primaryColor: LightColors.important,
    primaryColorLight: LightColors.basic,
    primaryColorDark: DarkColors.basic,
    canvasColor: LightColors.background,
    shadowColor: LightColors.textform,
    focusColor: LightColors.font,
    iconTheme: const IconThemeData(
      color: DarkColors.basic,
    ),
    // backgorund
    cardColor: LightColors.basic,
    textTheme: textThemeLight(),
    buttonTheme: const ButtonThemeData(
      buttonColor: LightColors.basic,
      textTheme: ButtonTextTheme.primary,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: LightColors.important,
      backgroundColor: LightColors.basic,
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarThemeDark(),
    primaryColor: DarkColors.important,
    primaryColorLight: LightColors.basic,
    primaryColorDark: DarkColors.basic,
    canvasColor: DarkColors.background,
    shadowColor: DarkColors.textform,
    focusColor: DarkColors.font,
    iconTheme: const IconThemeData(
      color: LightColors.basic,
    ),
    // backgorund
    cardColor: DarkColors.basic,
    textTheme: textThemeDark(),
    buttonTheme: const ButtonThemeData(
      buttonColor: DarkColors.basic,
      textTheme: ButtonTextTheme.primary,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: DarkColors.important,
      backgroundColor: DarkColors.basic,
    ),
  );
}
