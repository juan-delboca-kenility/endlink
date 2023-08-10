import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

class CustomAppBarTheme extends Equatable {
  final Color backgroundColor;
  final Color titleColor;

  const CustomAppBarTheme({
    required this.backgroundColor,
    required this.titleColor,
  });

  factory CustomAppBarTheme.lerp(CustomAppBarTheme a, CustomAppBarTheme b, double t) => CustomAppBarTheme(
        backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t)!,
        titleColor: Color.lerp(a.titleColor, b.titleColor, t)!,
      );

  factory CustomAppBarTheme.light() => CustomAppBarTheme(
        backgroundColor: CustomTheme.accentColorLight,
        titleColor: Colors.white,
      );

  factory CustomAppBarTheme.lightReverse() => const CustomAppBarTheme(
        backgroundColor: Colors.white,
        titleColor: Colors.black,
      );

  factory CustomAppBarTheme.dark() => CustomAppBarTheme(
        backgroundColor: Colors.black,
        titleColor: CustomTheme.accentColorLight,
      );

  factory CustomAppBarTheme.darkReverse() => CustomAppBarTheme(
        backgroundColor: Colors.black,
        titleColor: CustomTheme.accentColorLight,
      );

  @override
  List<Object?> get props => [
        backgroundColor,
        titleColor,
      ];
}
