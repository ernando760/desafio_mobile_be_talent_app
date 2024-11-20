import 'package:flutter/material.dart';

import '../theme/app_theme_colors.dart';
import '../theme/app_theme_spacing.dart';

extension ContextThemeExtension on BuildContext {
  // Colors
  Color get primary => Theme.of(this).extension<AppThemeColors>()!.primary;
  Color get blue10 => Theme.of(this).extension<AppThemeColors>()!.blue10;
  Color get gray => Theme.of(this).extension<AppThemeColors>()!.gray;
  Color get gray05 => Theme.of(this).extension<AppThemeColors>()!.gray05;
  Color get gray10 => Theme.of(this).extension<AppThemeColors>()!.gray10;
  Color get gray20 => Theme.of(this).extension<AppThemeColors>()!.gray20;
  Color get black => Theme.of(this).extension<AppThemeColors>()!.black;

  // Spacing
  double get little4 => Theme.of(this).extension<AppThemeSpacing>()!.little4;
  double get little8 => Theme.of(this).extension<AppThemeSpacing>()!.little8;
  double get medium80 => Theme.of(this).extension<AppThemeSpacing>()!.medium80;
  double get medium60 => Theme.of(this).extension<AppThemeSpacing>()!.medium60;
  double get medium40 => Theme.of(this).extension<AppThemeSpacing>()!.medium40;
  double get medium32 => Theme.of(this).extension<AppThemeSpacing>()!.medium32;
  double get regular28 =>
      Theme.of(this).extension<AppThemeSpacing>()!.regular28;
  double get regular20 =>
      Theme.of(this).extension<AppThemeSpacing>()!.regular20;
  double get regular16 =>
      Theme.of(this).extension<AppThemeSpacing>()!.regular16;
}
