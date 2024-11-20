import 'package:flutter/material.dart';

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color primary;
  final Color blue10;
  final Color black;
  final Color white;
  final Color gray;
  final Color gray05;
  final Color gray10;
  final Color gray20;

  AppThemeColors({
    required this.primary,
    required this.blue10,
    required this.black,
    required this.white,
    required this.gray,
    required this.gray05,
    required this.gray10,
    required this.gray20,
  });

  @override
  ThemeExtension<AppThemeColors> copyWith({
    Color? primary,
    Color? blue10,
    Color? black,
    Color? white,
    Color? gray,
    Color? gray05,
    Color? gray10,
    Color? gray20,
  }) {
    return AppThemeColors(
      primary: primary ?? this.primary,
      blue10: blue10 ?? this.blue10,
      black: black ?? this.black,
      white: white ?? this.white,
      gray: gray ?? this.gray,
      gray05: gray05 ?? this.gray05,
      gray10: gray10 ?? this.gray10,
      gray20: gray20 ?? this.gray20,
    );
  }

  @override
  ThemeExtension<AppThemeColors> lerp(
      covariant ThemeExtension<AppThemeColors>? other, double t) {
    if (other! is AppThemeColors) return this;
    return AppThemeColors(
      primary: primary,
      blue10: blue10,
      black: black,
      white: white,
      gray: gray,
      gray05: gray05,
      gray10: gray10,
      gray20: gray20,
    );
  }
}
