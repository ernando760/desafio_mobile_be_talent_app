import 'package:desafio_mobile_be_talent_app/src/extensions/context_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.white,
      toolbarHeight: 68,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: context.gray05,
              radius: 24,
              child: Text(
                "CG",
                style: TextStyle(
                  fontSize: context.regular16,
                  fontWeight: FontWeight.w400,
                  color: context.black,
                ),
              ),
            ),
            Badge(
              label: const Text("02"),
              offset: const Offset(-9, 5),
              backgroundColor: context.primary,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 3),
              textStyle: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: context.white,
              ),
              child: IconButton(
                  onPressed: () {
                    Modular.to.pushNamed("/splash/");
                  },
                  icon: SvgPicture.asset(
                    "assets/images/icons/bell-notification.svg",
                    colorFilter:
                        ColorFilter.mode(context.black, BlendMode.srcIn),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68);
}
