import 'package:desafio_mobile_be_talent_app/src/extensions/context_theme_extension.dart';

import 'package:flutter/material.dart';

import '../../../core/ui/widgets/table/collapsible_table_widget.dart';
import '../../../core/ui/widgets/table/style/table_style.dart';
import '../../../core/ui/widgets/table/table_data/table_data.dart';
import '../../data/models/employee_model.dart';
import 'employee_row_data_widget.dart';
import 'employee_table_collumn_widget.dart';

class EmployeeTableWidget extends StatelessWidget {
  const EmployeeTableWidget({super.key, required this.employees});
  final List<EmployeeModel> employees;

  @override
  Widget build(BuildContext context) {
    return CollapsibleTableWidget(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        style: TableStyle(
          headerBackgroundColor: context.blue10,
          rowBackgroundColor: context.white,
          borderColor: context.gray10,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        ),
        action: const ActionDefaultWidget(),
        columnFlex: const {
          0: 2,
          1: 5,
          2: 1,
        },
        columns: [
          TableColumnData(
              header: const EmployeeTableCollumnWidget(label: "Fotos")),
          TableColumnData(
              header: const EmployeeTableCollumnWidget(label: "Nomes"))
        ],
        rows: employees
            .map((employee) => EmployeeCollapsibleRowData(employee: employee))
            .toList());
  }
}
