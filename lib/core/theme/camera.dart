import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CustomCameraTheme extends Equatable {
  final Color backgroundColor;
  final Color buttonColor;
  final Color buttonPressedColor;
  final Color buttonIconColor;

  final Color recordButtonColor;
  final Color recordButtonIconColor;
  final Color recordButtonBorderColor;

  final Color panelBackgroundColor;

  const CustomCameraTheme({
    required this.backgroundColor,
    required this.buttonPressedColor,
    required this.buttonColor,
    required this.buttonIconColor,
    required this.recordButtonColor,
    required this.recordButtonIconColor,
    required this.recordButtonBorderColor,
    required this.panelBackgroundColor,
  });

  factory CustomCameraTheme.lerp(CustomCameraTheme a, CustomCameraTheme b, double t) => CustomCameraTheme(
        backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t)!,
        buttonColor: Color.lerp(a.buttonColor, b.buttonColor, t)!,
        buttonPressedColor: Color.lerp(a.buttonPressedColor, b.buttonPressedColor, t)!,
        buttonIconColor: Color.lerp(a.buttonIconColor, b.buttonIconColor, t)!,
        recordButtonColor: Color.lerp(a.recordButtonColor, b.recordButtonColor, t)!,
        recordButtonIconColor: Color.lerp(a.recordButtonIconColor, b.recordButtonIconColor, t)!,
        recordButtonBorderColor: Color.lerp(a.recordButtonBorderColor, b.recordButtonBorderColor, t)!,
        panelBackgroundColor: Color.lerp(a.panelBackgroundColor, b.panelBackgroundColor, t)!,
      );

  factory CustomCameraTheme.normal() => CustomCameraTheme(
        backgroundColor: Colors.black,
        buttonColor: Colors.grey.shade900,
        buttonPressedColor: Colors.grey.shade800,
        buttonIconColor: Colors.white,
        recordButtonColor: Colors.red.shade600,
        recordButtonIconColor: Colors.white,
        recordButtonBorderColor: Colors.white,
        panelBackgroundColor: Colors.black.withOpacity(0.6),
      );

  @override
  List<Object?> get props => [
        backgroundColor,
        buttonColor,
        buttonPressedColor,
        buttonIconColor,
        recordButtonColor,
        recordButtonColor,
        recordButtonBorderColor,
        panelBackgroundColor,
      ];
}
