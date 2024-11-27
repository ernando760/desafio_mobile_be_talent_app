import 'package:desafio_mobile_be_talent_app/src/extensions/context_theme_extension.dart';
import 'package:flutter/widgets.dart';

class EmployeeTableCollumnWidget extends StatelessWidget {
  const EmployeeTableCollumnWidget({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: context.regular16,
        fontWeight: FontWeight.w500,
        color: context.black,
      ),
    );
  }
}
