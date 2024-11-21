import 'package:flutter_modular/flutter_modular.dart';

import 'src/modules/home/home_module.dart';
import 'src/modules/splash/splash_module.dart';

final class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module("/splash", module: SplashModule());
    r.module("/home", module: HomeModule());
  }
}
