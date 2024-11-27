import 'package:desafio_mobile_be_talent_app/src/extensions/context_theme_extension.dart';
import 'package:flutter/material.dart';

class EmployeeAvartarWidget extends StatelessWidget {
  const EmployeeAvartarWidget({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: CircleAvatar(
          backgroundColor: context.primary,
          backgroundImage: url.isNotEmpty ? NetworkImage(url) : null,
        ));
  }
}
