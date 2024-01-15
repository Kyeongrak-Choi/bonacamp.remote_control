import 'package:flutter/material.dart';
import 'package:server_manager/utils/theme/text_theme.dart';

import 'appbar_theme.dart';
import 'color_manager.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: LightColors.primaryColor,
    primaryColorLight: LightColors.primaryColorLight,
    primaryColorDark: DarkColors.primaryColorDark,
    canvasColor: LightColors.canvasColor,
    shadowColor: LightColors.shadowColor,
    focusColor: LightColors.focusColor,
    // hoverColor: LightColors.hoverColor,
    cardColor: LightColors.basic,

    appBarTheme: appBarThemeLight(),
    iconTheme: const IconThemeData(
      color: LightColors.iconColor,

    ),
    textTheme: textThemeLight(),
    buttonTheme: const ButtonThemeData(
      buttonColor: LightColors.basic,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      background: LightColors.backgroundColor,
      error: CommonColors.red,
      onPrimary: LightColors.font100, // font100
      onSecondary: LightColors.font80, // font80
      onSurface: LightColors.font60, // font60
      onSurfaceVariant: LightColors.font40, // font40
      onBackground: LightColors.font20, // font20
      onTertiary: LightColors.font10, // font10
      surface: LightColors.textform, // login textForm

      primary: LightColors.primaryColor, // point color1
      primaryContainer: LightColors.primaryColor, // point color2
      secondary: LightColors.primaryColor, // point color3
      outline: LightColors.primaryColor, // card line or divider
      surfaceVariant: LightColors.primaryColor, // disabled
      tertiary: CommonColors.yellow, // normal
      tertiaryContainer: CommonColors.green, // safe
      onError: LightColors.basic, //no use
    ),
    // navigationBarTheme: const NavigationBarThemeData(
    //   indicatorColor: LightColors.important,
    //   backgroundColor: LightColors.basic,
    // ),
  );

}
