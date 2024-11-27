import 'package:desafio_mobile_be_talent_app/src/extensions/context_theme_extension.dart';
import 'package:flutter/material.dart';

class HeaderLabelWidget extends StatelessWidget {
  const HeaderLabelWidget({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(
          fontSize: context.regular16,
          fontWeight: FontWeight.w400,
          color: context.black,
        ));
  }
}
