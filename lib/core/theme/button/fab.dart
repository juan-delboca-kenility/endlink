import 'package:enterprise_endlink/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class CustomFabButtonTheme extends CustomButtonTheme {
  const CustomFabButtonTheme({
    required Color backgroundColor,
    required Gradient? gradient,
    required BorderSide border,
    required Color rippleBackgroundColor,
    required Color rippleHighlightColor,
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
          pressedColor: Colors.transparent,
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

  factory CustomFabButtonTheme.light() => CustomFabButtonTheme(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF739FDD),
            Color(0xFF4C82D3),
          ],
        ),
        backgroundColor: CustomTheme.accentColorLight,
        border: BorderSide.none,
        rippleBackgroundColor: Colors.white12,
        rippleHighlightColor: Colors.white12,
        textStyle: GoogleFonts.openSansTextTheme().bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              color: Colors.white,
              fontSize: 15.0,
            ),
        loadingColor: Colors.white70,
        borderRadius: BorderRadius.circular(50.0),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        iconColor: Colors.white,
        iconSize: 20.0,
        width: null,
        height: 60.0,
        iconPadding: 5.0,
        elevation: 8.0,
      );

  factory CustomFabButtonTheme.lightSmall() => CustomFabButtonTheme(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF739FDD),
            Color(0xFF4C82D3),
          ],
        ),
        backgroundColor: CustomTheme.accentColorLight,
        border: BorderSide.none,
        rippleBackgroundColor: Colors.white12,
        rippleHighlightColor: Colors.white12,
        textStyle: GoogleFonts.openSansTextTheme().bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              color: Colors.white,
              fontSize: 13.0,
            ),
        loadingColor: Colors.white70,
        borderRadius: BorderRadius.circular(50.0),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        iconColor: Colors.white,
        iconSize: 15.0,
        width: null,
        height: 45.0,
        iconPadding: 5.0,
        elevation: 8.0,
      );

  factory CustomFabButtonTheme.dark() => CustomFabButtonTheme(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF739FDD),
            Color(0xFF4C82D3),
          ],
        ),
        backgroundColor: CustomTheme.accentColorLight,
        border: BorderSide.none,
        rippleBackgroundColor: Colors.white12,
        rippleHighlightColor: Colors.white12,
        textStyle: GoogleFonts.openSansTextTheme().bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              color: Colors.white,
              fontSize: 15.0,
            ),
        loadingColor: Colors.white70,
        borderRadius: BorderRadius.circular(50.0),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        iconColor: Colors.white,
        iconSize: 20.0,
        width: null,
        height: 60.0,
        iconPadding: 5.0,
        elevation: 8.0,
      );

  factory CustomFabButtonTheme.darkSmall() => CustomFabButtonTheme(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF739FDD),
            Color(0xFF4C82D3),
          ],
        ),
        backgroundColor: CustomTheme.accentColorLight,
        border: BorderSide.none,
        rippleBackgroundColor: Colors.white12,
        rippleHighlightColor: Colors.white12,
        textStyle: GoogleFonts.openSansTextTheme().bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              color: Colors.white,
              fontSize: 13.0,
            ),
        loadingColor: Colors.white70,
        borderRadius: BorderRadius.circular(50.0),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        iconColor: Colors.white,
        iconSize: 15.0,
        width: null,
        height: 45.0,
        iconPadding: 5.0,
        elevation: 8.0,
      );
}
