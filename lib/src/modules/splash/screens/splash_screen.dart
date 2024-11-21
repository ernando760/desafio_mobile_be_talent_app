import 'package:desafio_mobile_be_talent_app/src/extensions/context_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));

    _animation = Tween<double>(begin: 0.0, end: 1).animate(_controller);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _controller.forward();
      await Future.delayed(const Duration(milliseconds: 900), () {
        Modular.to.navigate("/home");
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: context.primary,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: context.primary,
      ),
      child: Scaffold(
          backgroundColor: context.primary,
          body: ValueListenableBuilder(
            valueListenable: _animation,
            builder: (context, opacity, child) {
              return AnimatedOpacity(
                opacity: opacity,
                duration: _controller.duration!,
                child: Center(
                  child:
                      SvgPicture.asset("assets/images/logo/be-talent-logo.svg"),
                ),
              );
            },
          )),
    );
  }
}
