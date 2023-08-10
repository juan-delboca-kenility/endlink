import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CustomButtonTheme extends Equatable {
  final Color? pressedColor;
  final Gradient? gradient;
  final Color backgroundColor;
  final BorderSide border;
  final TextStyle textStyle;
  final Color loadingColor;
  final BorderRadius borderRadius;
  final double elevation;
  final double iconSize;
  final Color iconColor;
  final double height;
  final EdgeInsets padding;
  final double iconPadding;
  final double? width;

  const CustomButtonTheme({
    required this.pressedColor,
    required this.backgroundColor,
    required this.gradient,
    required this.border,
    required this.textStyle,
    required this.loadingColor,
    required this.borderRadius,
    required this.iconColor,
    required this.iconSize,
    required this.elevation,
    required this.height,
    required this.padding,
    required this.iconPadding,
    required this.width,
  });

  @override
  List<Object?> get props => [
        pressedColor,
        gradient,
        backgroundColor,
        border,
        textStyle,
        loadingColor,
        borderRadius,
        elevation,
        iconSize,
        iconColor,
        height,
        padding,
        iconPadding,
        width,
      ];
}
