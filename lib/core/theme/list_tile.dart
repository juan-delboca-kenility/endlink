import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

class CustomListTileTheme extends Equatable {
  final Color selectedColor;
  final Color pressedColor;
  final double height;
  final EdgeInsets contentPadding;
  final EdgeInsets leadingPadding;
  final EdgeInsets trailingPadding;

  const CustomListTileTheme({
    required this.selectedColor,
    required this.pressedColor,
    this.height = 70,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.leadingPadding = const EdgeInsets.only(right: 16.0),
    this.trailingPadding = const EdgeInsets.only(left: 16.0),
  });

  factory CustomListTileTheme.lerp(CustomListTileTheme a, CustomListTileTheme b, double t) => CustomListTileTheme(
        selectedColor: Color.lerp(a.selectedColor, b.selectedColor, t)!,
        pressedColor: Color.lerp(a.pressedColor, b.pressedColor, t)!,
        height: lerpDouble(a.height, b.height, t)!,
        contentPadding: EdgeInsets.lerp(a.contentPadding, b.contentPadding, t)!,
        leadingPadding: EdgeInsets.lerp(a.leadingPadding, b.leadingPadding, t)!,
        trailingPadding: EdgeInsets.lerp(a.trailingPadding, b.trailingPadding, t)!,
      );

  CustomListTileTheme copyWith({
    Color? selectedColor,
    Color? pressedColor,
    double? height,
    EdgeInsets? contentPadding,
    EdgeInsets? leadingPadding,
    EdgeInsets? trailingPadding,
  }) =>
      CustomListTileTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        pressedColor: pressedColor ?? this.pressedColor,
        height: height ?? this.height,
        contentPadding: contentPadding ?? this.contentPadding,
        leadingPadding: leadingPadding ?? this.leadingPadding,
        trailingPadding: trailingPadding ?? this.trailingPadding,
      );

  factory CustomListTileTheme._defaultLight() => CustomListTileTheme(
        selectedColor: Colors.blue.shade100,
        pressedColor: CustomTheme.pressedColorLight,
      );

  factory CustomListTileTheme._defaultDark() => CustomListTileTheme(
        selectedColor: const Color(0xFF143152),
        pressedColor: CustomTheme.pressedColorDark,
      );

  factory CustomListTileTheme.light() => CustomListTileTheme._defaultLight();

  factory CustomListTileTheme.dark() => CustomListTileTheme._defaultDark();

  CustomListTileTheme dense() => copyWith(
        height: 50,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        leadingPadding: const EdgeInsets.only(right: 8.0),
        trailingPadding: const EdgeInsets.only(left: 8.0),
      );

  @override
  List<Object?> get props => [
        height,
        contentPadding,
        leadingPadding,
        trailingPadding,
      ];
}
