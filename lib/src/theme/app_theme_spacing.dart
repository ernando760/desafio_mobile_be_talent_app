import 'package:flutter/material.dart';

class AppThemeSpacing extends ThemeExtension<AppThemeSpacing> {
  final double medium80;
  final double medium60;
  final double medium40;
  final double medium32;
  final double regular28;
  final double regular20;
  final double regular16;
  final double little8;
  final double little4;

  const AppThemeSpacing({
    required this.medium80,
    required this.medium60,
    required this.medium40,
    required this.medium32,
    required this.regular28,
    required this.regular20,
    required this.regular16,
    required this.little8,
    required this.little4,
  });

  @override
  AppThemeSpacing copyWith({
    double? medium80,
    double? medium60,
    double? medium40,
    double? medium32,
    double? regular28,
    double? regular20,
    double? regular16,
    double? little8,
    double? little4,
  }) {
    return AppThemeSpacing(
      medium80: medium80 ?? this.medium80,
      medium60: medium60 ?? this.medium60,
      medium40: medium40 ?? this.medium40,
      medium32: medium32 ?? this.medium32,
      regular28: regular28 ?? this.regular28,
      regular20: regular20 ?? this.regular20,
      regular16: regular16 ?? this.regular16,
      little8: little8 ?? this.little8,
      little4: little4 ?? this.little4,
    );
  }

  @override
  AppThemeSpacing lerp(ThemeExtension<AppThemeSpacing>? other, double t) {
    if (other is! AppThemeSpacing) return this;

    return AppThemeSpacing(
      medium80: medium80,
      medium60: medium60,
      medium40: medium40,
      medium32: medium32,
      regular28: regular28,
      regular20: regular20,
      regular16: regular16,
      little8: little8,
      little4: little4,
    );
  }
}
