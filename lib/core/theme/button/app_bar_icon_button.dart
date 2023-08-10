import 'package:enterprise_endlink/core/theme/button/index.dart';
import 'package:enterprise_endlink/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarIconButtonTheme extends CustomButtonTheme {
  const CustomAppBarIconButtonTheme({
    required Color pressedColor,
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

  factory CustomAppBarIconButtonTheme.light() => CustomAppBarIconButtonTheme(
        gradient: null,
        pressedColor: Colors.white.withOpacity(0.1),
        backgroundColor: Colors.transparent,
        border: BorderSide.none,
        textStyle: GoogleFonts.openSansTextTheme().bodyMedium!,
        loadingColor: Colors.white,
        borderRadius: BorderRadius.circular(40.0),
        padding: EdgeInsets.zero,
        iconColor: Colors.white70,
        iconSize: 20.0,
        width: 40.0,
        height: 40.0,
        iconPadding: 0.0,
        elevation: 0.0,
      );

  factory CustomAppBarIconButtonTheme.lightReverse() => CustomAppBarIconButtonTheme(
        gradient: null,
        pressedColor: CustomTheme.pressedColorLight,
        backgroundColor: Colors.transparent,
        border: BorderSide.none,
        textStyle: GoogleFonts.openSansTextTheme().bodyMedium!,
        loadingColor: Colors.black87,
        borderRadius: BorderRadius.circular(40.0),
        padding: EdgeInsets.zero,
        iconColor: Colors.black54,
        iconSize: 20.0,
        width: 40.0,
        height: 40.0,
        iconPadding: 0.0,
        elevation: 0.0,
      );

  factory CustomAppBarIconButtonTheme.dark() => CustomAppBarIconButtonTheme(
        gradient: null,
        pressedColor: CustomTheme.pressedColorDark,
        backgroundColor: Colors.transparent,
        border: BorderSide.none,
        textStyle: GoogleFonts.openSansTextTheme().bodyMedium!,
        loadingColor: Colors.white70,
        borderRadius: BorderRadius.circular(40.0),
        padding: EdgeInsets.zero,
        iconColor: Colors.white70,
        iconSize: 20.0,
        width: 40.0,
        height: 40.0,
        iconPadding: 0.0,
        elevation: 0.0,
      );

  factory CustomAppBarIconButtonTheme.darkReverse() => CustomAppBarIconButtonTheme(
        gradient: null,
        pressedColor: CustomTheme.pressedColorDark,
        backgroundColor: Colors.transparent,
        border: BorderSide.none,
        textStyle: GoogleFonts.openSansTextTheme().bodyMedium!,
        loadingColor: Colors.white70,
        borderRadius: BorderRadius.circular(40.0),
        padding: EdgeInsets.zero,
        iconColor: Colors.white70,
        iconSize: 20.0,
        width: 40.0,
        height: 40.0,
        iconPadding: 0.0,
        elevation: 0.0,
      );
}
