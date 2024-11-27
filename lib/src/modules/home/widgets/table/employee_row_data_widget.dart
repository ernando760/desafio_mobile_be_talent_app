import 'dart:math';

import 'package:desafio_mobile_be_talent_app/src/extensions/context_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/utils.dart';
import '../../../core/ui/widgets/table/table_data/table_data.dart';
import '../../data/models/employee_model.dart';
import 'employee_avartar_widget.dart';
import 'employee_detail_widget.dart';
import 'employee_label_widget.dart';

class EmployeeCollapsibleRowData extends CollapsibleRowData {
  EmployeeCollapsibleRowData({
    required this.employee,
  }) : super(
            actionIconBuilder: (context, isExpanded) => Transform.rotate(
                  angle: isExpanded ? pi * 3 : 0,
                  child: SvgPicture.asset(
                    "assets/images/icons/charm-chevron-down.svg",
                    colorFilter:
                        ColorFilter.mode(context.primary, BlendMode.srcIn),
                  ),
                ),
            cells: [
              TableCellData(
                  content: EmployeeAvartarWidget(url: employee.image)),
              TableCellData(content: HeaderLabelWidget(label: employee.name))
            ],
            expandedContent: Container(
              padding: const EdgeInsets.only(top: 19),
              child: Column(
                children: [
                  EmployeeDetailWidget(
                    label: "Cargo",
                    detail: employee.job,
                  ),
                  const SizedBox(height: 15),
                  EmployeeDetailWidget(
                    label: "Data de adimissão",
                    detail: formatDate(employee.admissionDate),
                  ),
                  const SizedBox(height: 15),
                  EmployeeDetailWidget(
                    label: "Telefone",
                    detail: formatPhoneNumber(employee.phone),
                  ),
                ],
              ),
            ));

  final EmployeeModel employee;
}
