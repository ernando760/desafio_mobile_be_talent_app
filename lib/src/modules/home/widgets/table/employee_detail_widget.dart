import 'package:desafio_mobile_be_talent_app/src/extensions/context_theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/painters/dashed_border_painter.dart';

class EmployeeDetailWidget extends StatelessWidget {
  const EmployeeDetailWidget({
    super.key,
    required this.label,
    required this.detail,
  });
  final String label;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderBottomPainter(
        color: context.gray10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                fontSize: context.regular16,
                fontWeight: FontWeight.w500,
              )),
          Text(detail),
        ],
      ),
    );
  }
}
