import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CustomCardTheme extends Equatable {
  final Color backgroundColor;
  final Color dividerColor;
  final BorderRadius borderRadius;
  final int elevation;
  final EdgeInsets padding;

  final Color pressedColor;

  const CustomCardTheme({
    required this.pressedColor,
    required this.backgroundColor,
    required this.dividerColor,
    required this.borderRadius,
    this.padding = const EdgeInsets.all(16.0),
    this.elevation = 0,
  });

  factory CustomCardTheme.lerp(CustomCardTheme a, CustomCardTheme b, double t) => CustomCardTheme(
        pressedColor: Color.lerp(a.pressedColor, b.pressedColor, t)!,
        backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t)!,
        dividerColor: Color.lerp(a.dividerColor, b.dividerColor, t)!,
        borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t)!,
        elevation: lerpDouble(a.elevation, b.elevation, t)!.floor(),
        padding: EdgeInsets.lerp(a.padding, b.padding, t)!,
      );

  factory CustomCardTheme.light() => CustomCardTheme(
        backgroundColor: Colors.grey.shade100,
        pressedColor: Colors.grey.shade200,
        dividerColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10.0),
      );

  factory CustomCardTheme.dark() => CustomCardTheme(
        backgroundColor: Colors.grey.shade900,
        pressedColor: Colors.grey.shade800,
        dividerColor: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10.0),
      );

  @override
  List<Object?> get props => [
        backgroundColor,
        pressedColor,
        dividerColor,
        borderRadius,
      ];
}
