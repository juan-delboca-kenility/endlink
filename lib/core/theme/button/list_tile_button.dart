import 'package:enterprise_endlink/core/theme/button/index.dart';
import 'package:enterprise_endlink/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomListTileButtonTheme extends CustomButtonTheme {
  CustomListTileButtonTheme({
    required Color pressedColor,
    required Color backgroundColor,
    required Gradient? gradient,
    required BorderSide border,
    required Color loadingColor,
    required double elevation,
    required double height,
    required double? width,
    required Color iconColor,
  }) : super(
          pressedColor: pressedColor,
          backgroundColor: backgroundColor,
          gradient: gradient,
          border: border,
          textStyle: const TextStyle(),
          loadingColor: loadingColor,
          borderRadius: BorderRadius.circular(width ?? 0.0),
          iconColor: iconColor,
          iconSize: 20.0,
          elevation: elevation,
          height: height,
          padding: EdgeInsets.zero,
          iconPadding: 0.0,
          width: width,
        );

  factory CustomListTileButtonTheme.light() => CustomListTileButtonTheme(
        gradient: null,
        pressedColor: CustomTheme.pressedColorLight,
        backgroundColor: CustomTheme.pressedColorLight,
        border: BorderSide.none,
        loadingColor: CustomTheme.accentColorLight,
        iconColor: Colors.black87,
        width: 40.0,
        height: 40.0,
        elevation: 0.0,
      );

  factory CustomListTileButtonTheme.lightSmall() => CustomListTileButtonTheme(
        gradient: null,
        pressedColor: CustomTheme.pressedColorLight,
        backgroundColor: CustomTheme.pressedColorLight,
        border: BorderSide.none,
        loadingColor: CustomTheme.accentColorLight,
        iconColor: Colors.black87,
        width: 30.0,
        height: 30.0,
        elevation: 0.0,
      );

  factory CustomListTileButtonTheme.dark() => CustomListTileButtonTheme(
        gradient: null,
        pressedColor: CustomTheme.pressedColorDark,
        backgroundColor: CustomTheme.pressedColorDark,
        border: BorderSide.none,
        loadingColor: CustomTheme.accentColorDark,
        iconColor: Colors.white70,
        width: 40.0,
        height: 40.0,
        elevation: 0.0,
      );

  factory CustomListTileButtonTheme.darkSmall() => CustomListTileButtonTheme(
        gradient: null,
        pressedColor: CustomTheme.pressedColorDark,
        backgroundColor: CustomTheme.pressedColorDark,
        border: BorderSide.none,
        loadingColor: CustomTheme.accentColorDark,
        iconColor: Colors.white70,
        width: 30.0,
        height: 30.0,
        elevation: 0.0,
      );
}
