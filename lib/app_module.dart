import 'package:desafio_mobile_be_talent_app/src/modules/core/core_module.dart';
import 'package:desafio_mobile_be_talent_app/src/modules/home/screens/home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

final class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(RouteManager r) {
    r.child(
      "/",
      child: (context) => const HomeScreen(),
    );
  }
}
