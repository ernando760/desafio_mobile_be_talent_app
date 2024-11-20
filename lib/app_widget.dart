import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'src/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.theme,
      title: "Be Talent App Demo",
      routerConfig: Modular.routerConfig,
    );
  }
}
