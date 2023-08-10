import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

class CustomChatBubbleTheme extends Equatable {
  final Color backgroundColor;
  final TextStyle textStyle;
  final BorderRadius borderRadius;

  final Color orderCardBackgroundColor;
  final Color orderDividerColor;

  final Color previewButtonBackgroundColor;
  final Color previewButtonBackgroundPressedColor;

  const CustomChatBubbleTheme({
    required this.backgroundColor,
    required this.textStyle,
    required this.borderRadius,
    required this.orderCardBackgroundColor,
    required this.orderDividerColor,
    required this.previewButtonBackgroundColor,
    required this.previewButtonBackgroundPressedColor,
  });

  factory CustomChatBubbleTheme.lerpObject(CustomChatBubbleTheme a, CustomChatBubbleTheme b, double t) => CustomChatBubbleTheme(
        backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t)!,
        textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t)!,
        borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t)!,
        orderCardBackgroundColor: Color.lerp(a.orderCardBackgroundColor, b.orderCardBackgroundColor, t)!,
        orderDividerColor: Color.lerp(a.orderDividerColor, b.orderDividerColor, t)!,
        previewButtonBackgroundColor: Color.lerp(a.previewButtonBackgroundColor, b.previewButtonBackgroundColor, t)!,
        previewButtonBackgroundPressedColor: Color.lerp(a.previewButtonBackgroundPressedColor, b.previewButtonBackgroundPressedColor, t)!,
      );

  factory CustomChatBubbleTheme.lightOutgoing() => CustomChatBubbleTheme(
        backgroundColor: const Color(0xFFC6DCF5),
        textStyle: const TextStyle(color: Colors.black87),
        borderRadius: BorderRadius.circular(4.0),
        orderCardBackgroundColor: Colors.white24,
        orderDividerColor: Colors.black12,
        previewButtonBackgroundColor: Colors.white24,
        previewButtonBackgroundPressedColor: Colors.white30,
      );

  factory CustomChatBubbleTheme.lightIncoming() => CustomChatBubbleTheme(
        backgroundColor: Colors.white,
        textStyle: const TextStyle(color: Colors.black87),
        borderRadius: BorderRadius.circular(4.0),
        orderCardBackgroundColor: Colors.black.withOpacity(0.03),
        orderDividerColor: Colors.black12,
        previewButtonBackgroundColor: Colors.black.withOpacity(0.03),
        previewButtonBackgroundPressedColor: Colors.black.withOpacity(0.1),
      );

  factory CustomChatBubbleTheme.darkOutgoing() => CustomChatBubbleTheme(
        backgroundColor: CustomTheme.accentColorDark,
        textStyle: const TextStyle(color: Colors.white),
        borderRadius: BorderRadius.circular(4.0),
        orderCardBackgroundColor: Colors.white10,
        orderDividerColor: Colors.black12,
        previewButtonBackgroundColor: Colors.black12,
        previewButtonBackgroundPressedColor: Colors.black26,
      );

  factory CustomChatBubbleTheme.darkIncoming() => CustomChatBubbleTheme(
        backgroundColor: Colors.black,
        textStyle: const TextStyle(color: Colors.white),
        borderRadius: BorderRadius.circular(4.0),
        orderCardBackgroundColor: Colors.black12,
        orderDividerColor: Colors.black12,
        previewButtonBackgroundColor: Colors.white24,
        previewButtonBackgroundPressedColor: Colors.white30,
      );

  @override
  List<Object?> get props => [
        backgroundColor,
        textStyle,
        borderRadius,
        orderCardBackgroundColor,
        orderDividerColor,
        previewButtonBackgroundColor,
        previewButtonBackgroundPressedColor,
      ];
}
