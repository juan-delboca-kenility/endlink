import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

class CustomDialogTheme extends Equatable {
  final Color backgroundColor;
  final Color dividerColor;
  final Color pressedColor;
  final Color dimColor;
  final BorderRadius borderRadius;
  final int elevation;

  const CustomDialogTheme({
    required this.pressedColor,
    required this.backgroundColor,
    required this.dimColor,
    required this.borderRadius,
    required this.dividerColor,
    this.elevation = 8,
  });

  factory CustomDialogTheme.lerp(CustomDialogTheme a, CustomDialogTheme b, double t) => CustomDialogTheme(
        pressedColor: Color.lerp(a.pressedColor, b.pressedColor, t)!,
        backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t)!,
        dividerColor: Color.lerp(a.dividerColor, b.dividerColor, t)!,
        dimColor: Color.lerp(a.dimColor, b.dimColor, t)!,
        borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t)!,
        elevation: lerpDouble(a.elevation, b.elevation, t)!.floor(),
      );

  factory CustomDialogTheme.light() => CustomDialogTheme(
        pressedColor: CustomTheme.pressedColorLight,
        backgroundColor: Colors.white,
        dividerColor: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
        dimColor: Colors.black87,
      );

  factory CustomDialogTheme.dark() => CustomDialogTheme(
        pressedColor: Colors.grey.shade800,
        backgroundColor: Colors.grey.shade900,
        dividerColor: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10.0),
        dimColor: Colors.black87,
      );

  @override
  List<Object?> get props => [
        pressedColor,
        backgroundColor,
        dividerColor,
        borderRadius,
        dimColor,
      ];
}
