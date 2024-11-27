import 'package:flutter_modular/flutter_modular.dart';

import '../core/core_module.dart';
import 'controllers/home_controller.dart';
import 'data/repositories/home_repository.dart';
import 'screens/home_screen.dart';

final class HomeModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.add<HomeRepository>(HomeRepository.new);
    i.addSingleton<HomeController>(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      "/",
      child: (context) => const HomeScreen(),
      duration: const Duration(seconds: 2),
      transition: TransitionType.fadeIn,
    );
  }
}
