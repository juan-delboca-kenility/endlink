import 'package:flutter/material.dart';

import 'theme.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final CustomTheme theme;

  CustomThemeExtension(this.theme);

  @override
  ThemeExtension<CustomThemeExtension> lerp(ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) {
      return this;
    }
    return CustomThemeExtension(theme.lerp(other.theme, t));
  }

  @override
  String toString() {
    return "CustomColors";
  }

  @override
  ThemeExtension<CustomThemeExtension> copyWith() {
    throw UnimplementedError();
  }
}

extension ColorExtension on Color {
  bool get isDark {
    return computeLuminance() > 0.5;
  }

  Color contrast(BuildContext context) {
    if (opacity == 0.0 || this == Colors.transparent) return Theme.of(context).colorScheme.background.contrast(context);
    return computeLuminance() < 0.5 ? Colors.white.withOpacity(0.9) : Colors.black.withOpacity(0.9);
  }

  String get hex {
    return '#'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}'
        '${alpha.toRadixString(16).padLeft(2, '0')}';
  }
}
