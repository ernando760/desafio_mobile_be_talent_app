import 'package:flutter/material.dart';

import 'app_theme_colors.dart';
import 'app_theme_spacing.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      fontFamily: 'Helvetica',
      primaryColor: const Color(0xF00500FF),
      scaffoldBackgroundColor: const Color(0xFFF0F0F0),
      extensions: [
        AppThemeColors(
          primary: const Color(0xF00500FF),
          blue10: const Color.fromARGB(171, 237, 239, 251),
          black: const Color(0xFF1C1C1C),
          white: const Color(0xFFF0F0F0),
          gray: const Color(0xFFF0F0F0),
          gray05: const Color(0xFFF5F5F5),
          gray10: const Color(0xFFDFDFDF),
          gray20: const Color(0xFF9E9E9E),
        ),
        const AppThemeSpacing(
          medium80: 80.0,
          medium60: 60.0,
          medium40: 40.0,
          medium32: 32.0,
          regular28: 28.0,
          regular20: 20.0,
          regular16: 16.0,
          little8: 8.0,
          little4: 4.0,
        )
      ]);
}
