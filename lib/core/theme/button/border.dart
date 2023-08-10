import 'package:enterprise_endlink/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class CustomBorderButtonTheme extends CustomButtonTheme {
  const CustomBorderButtonTheme({
    required Color backgroundColor,
    required Gradient? gradient,
    required BorderSide border,
    required TextStyle textStyle,
    required Color loadingColor,
    required BorderRadius borderRadius,
    required Color iconColor,
    required double iconSize,
    required double elevation,
    required double height,
    required EdgeInsets padding,
    required double iconPadding,
    required double? width,
    required Color pressedColor,
  }) : super(
          pressedColor: pressedColor,
          backgroundColor: backgroundColor,
          gradient: gradient,
          border: border,
          textStyle: textStyle,
          loadingColor: loadingColor,
          borderRadius: borderRadius,
          iconColor: iconColor,
          iconSize: iconSize,
          elevation: elevation,
          height: height,
          padding: padding,
          iconPadding: iconPadding,
          width: width,
        );

  CustomBorderButtonTheme copyWith({
    TextStyle? textStyle,
    double? iconSize,
    double? height,
    EdgeInsets? padding,
    double? iconPadding,
  }) =>
      CustomBorderButtonTheme(
        pressedColor: pressedColor ?? Colors.transparent,
        gradient: gradient,
        backgroundColor: backgroundColor,
        border: border,
        textStyle: textStyle ?? this.textStyle,
        loadingColor: loadingColor,
        borderRadius: borderRadius,
        iconColor: iconColor,
        iconSize: iconSize ?? this.iconSize,
        elevation: elevation,
        height: height ?? this.height,
        padding: padding ?? this.padding,
        iconPadding: iconPadding ?? this.iconPadding,
        width: width,
      );

  factory CustomBorderButtonTheme._defaultLight() => CustomBorderButtonTheme(
        gradient: null,
        pressedColor: CustomTheme.pressedColorLight,
        backgroundColor: Colors.transparent,
        border: BorderSide(color: Colors.grey.shade400, width: 1),
        textStyle: GoogleFonts.openSansTextTheme().bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              color: Colors.black87,
              fontSize: 15.0,
            ),
        loadingColor: CustomTheme.accentColorLight,
        borderRadius: BorderRadius.circular(4.0),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        iconColor: Colors.black87,
        iconSize: 20.0,
        width: null,
        height: 50.0,
        iconPadding: 5.0,
        elevation: 0.0,
      );

  factory CustomBorderButtonTheme._defaultDark() => CustomBorderButtonTheme(
        gradient: null,
        pressedColor: CustomTheme.pressedColorDark,
        backgroundColor: Colors.transparent,
        border: BorderSide(color: Colors.grey.shade700, width: 1),
        textStyle: GoogleFonts.openSansTextTheme().bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              color: Colors.white,
              fontSize: 15.0,
            ),
        loadingColor: CustomTheme.accentColorDark,
        borderRadius: BorderRadius.circular(4.0),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        iconColor: Colors.white,
        iconSize: 20.0,
        width: null,
        height: 50.0,
        iconPadding: 5.0,
        elevation: 0.0,
      );

  factory CustomBorderButtonTheme.light() => CustomBorderButtonTheme._defaultLight();

  factory CustomBorderButtonTheme.dark() => CustomBorderButtonTheme._defaultDark();

  CustomBorderButtonTheme small() => copyWith(
        height: 35.0,
        iconSize: 13.0,
        textStyle: textStyle.copyWith(fontSize: 13),
      );
}
