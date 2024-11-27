import 'package:flutter/material.dart';

import 'collapsible_table_body/collapsible_table_body_widget.dart';
import 'collapsible_table_header/collapsible_table_header_widget.dart';
import 'style/table_style.dart';
import 'table_data/table_data.dart';

class ActionDefaultWidget extends StatelessWidget {
  const ActionDefaultWidget(
      {super.key, this.padding, this.width, this.height, this.color});
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(right: 12),
      child: Container(
        width: width ?? 8.0,
        height: height ?? 8.0,
        decoration: BoxDecoration(
          color: color ?? Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

/// Widget que representa uma tabela expansível e personalizável.
///
/// Inclui cabeçalho configurável, corpo com linhas expansíveis e flexibilidade
/// nas larguras das colunas.
class CollapsibleTableWidget extends StatefulWidget {
  const CollapsibleTableWidget({
    super.key,
    required this.columns,
    required this.rows,
    this.columnFlex = const {},
    this.headerPadding,
    this.bodyPadding,
    this.padding,
    this.action,
    this.style = const TableStyle(),
  });

  /// Dados das linhas da tabela.
  final List<CollapsibleRowData> rows;

  /// Flexibilidade de largura das colunas.
  final Map<int, int> columnFlex;

  /// Estilo visual da tabela.
  final TableStyle style;

  /// Ícone no cabeçalho da tabela, para ações como expansão/colapso global.
  final Widget? action;

  /// Espaçamento interno da tabela
  final EdgeInsetsGeometry? padding;

  /// Espaçamento interno do cabeçalho.
  final EdgeInsetsGeometry? headerPadding;

  /// Espaçamento interno do corpo da tabela.
  final EdgeInsetsGeometry? bodyPadding;

  /// Dados das colunas da tabela.
  final List<TableColumnData> columns;

  @override
  State<CollapsibleTableWidget> createState() => _CollapsibleTableWidgetState();
}

class _CollapsibleTableWidgetState extends State<CollapsibleTableWidget> {
  late Map<int, int> _columnFlex;

  @override
  void initState() {
    super.initState();

    // Configuração inicial do mapeamento de flexibilidade.
    _columnFlex = {
      for (int i = 0; i < widget.columns.length; i++)
        i: widget.columnFlex[i] ?? 1,
    };

    for (final row in widget.rows) {
      assert(
        row.cells.length == widget.columns.length,
        'A quantidade de células (${row.cells.length}) '
        'na linha não corresponde à quantidade de colunas (${widget.columns.length}).',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.style.borderColor,
          width: widget.style.borderWidth,
        ),
        borderRadius: widget.style.borderRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Cabeçalho da tabela.
          CollapsibleTableHeaderWidget(
            style: widget.style,
            columns: widget.columns,
            columnFlex: _columnFlex,
            actionIcon: widget.action,
            padding: widget.headerPadding ?? widget.padding,
          ),
          // Corpo da tabela.
          Flexible(
            child: CollapsibleTableBodyWidget(
              style: widget.style,
              rows: widget.rows,
              columnFlex: _columnFlex,
              padding: widget.bodyPadding ?? widget.padding,
            ),
          ),
        ],
      ),
    );
  }
}
