import 'package:flutter/material.dart';

import '../collapsible_table_row/collapsible_table_row_widget.dart';
import '../style/table_style.dart';
import '../table_data/table_data.dart';

class TableRowSeparator extends StatelessWidget {
  const TableRowSeparator({super.key, this.thickness, this.color});
  final double? thickness;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: thickness,
      color: color,
    );
  }
}

/// Widget responsável por renderizar o corpo de uma tabela expansível.
///
/// Ele exibe uma lista de linhas expansíveis, onde cada linha pode conter
/// células e um conteúdo adicional que aparece ao ser expandida.
class CollapsibleTableBodyWidget extends StatelessWidget {
  /// Construtor para criar o corpo da tabela expansível.
  ///
  /// - [rows] define as linhas da tabela.
  /// - [columnFlex] especifica a flexibilidade de largura para cada coluna.
  /// - [padding] permite adicionar espaçamento interno em torno das linhas.
  /// - [style] aplica estilos visuais, como bordas e cores.
  const CollapsibleTableBodyWidget({
    super.key,
    required this.rows,
    required this.columnFlex,
    this.padding = EdgeInsets.zero,
    this.style = const TableStyle(),
  });

  /// Estilo visual aplicado às linhas da tabela, como bordas e cores.
  final TableStyle style;

  /// Lista de linhas expansíveis que compõem a tabela.
  final List<CollapsibleRowData> rows;

  /// Define a proporção de flexibilidade para cada coluna.
  ///
  /// Exemplo: `{0: 2, 1: 1}` significa que a coluna 0 terá o dobro do espaço da coluna 1.
  final Map<int, int> columnFlex;

  /// Espaçamento interno ao redor das linhas da tabela.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: rows.length,
      itemBuilder: (_, index) {
        final row = rows[index];
        return CollapsibleTableRowWidget(
          columnFlex: columnFlex,
          style: style,
          padding: padding,
          isExpanded: row.isExpanded,
          cells: row.cells,
          actionIconBuilder: row.actionIconBuilder,
          expandedContent: row.expandedContent,
          onExpansionChanged: row.onExpansionChanged,
        );
      },
      separatorBuilder: (_, __) => TableRowSeparator(
        color: style.borderColor,
        thickness: style.borderWidth,
      ),
    );
  }
}
