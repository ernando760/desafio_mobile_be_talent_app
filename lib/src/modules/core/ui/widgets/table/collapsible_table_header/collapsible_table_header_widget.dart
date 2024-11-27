import 'package:flutter/material.dart';

import '../style/table_style.dart';
import '../table_data/table_data.dart';

/// Widget que renderiza o cabeçalho de uma tabela expansível.
///
/// Permite configurar os títulos das colunas, alinhamento, espaçamento e
/// estilo visual, além de um ícone de ação opcional no canto superior direito.
class CollapsibleTableHeaderWidget extends StatelessWidget {
  /// Construtor para o cabeçalho da tabela expansível.
  ///
  /// - [columns] define as colunas da tabela.
  /// - [columnFlex] especifica a flexibilidade de largura de cada coluna.
  /// - [style] permite customizar o estilo visual do cabeçalho.
  /// - [actionIcon] adiciona um ícone de ação no canto superior direito.
  /// - [padding] define o espaçamento interno do cabeçalho.
  /// - [iconPadding] ajusta o espaçamento ao redor do ícone de ação.
  const CollapsibleTableHeaderWidget({
    super.key,
    required this.columns,
    required this.columnFlex,
    this.style = const TableStyle(),
    this.actionIcon,
    this.padding,
    this.iconPadding,
  });

  /// Ícone de ação exibido no canto superior direito do cabeçalho.
  final Widget? actionIcon;

  /// Lista de dados das colunas, contendo os rótulos dos cabeçalhos.
  final List<TableColumnData> columns;

  /// Define a proporção de flexibilidade para cada coluna.
  final Map<int, int> columnFlex;

  /// Espaçamento interno do cabeçalho.
  final EdgeInsetsGeometry? padding;

  /// Espaçamento ao redor do ícone de ação.
  final EdgeInsetsGeometry? iconPadding;

  /// Estilo visual aplicado ao cabeçalho, como cores e bordas.
  final TableStyle style;

  Widget _buildHeader() {
    // Cria os widgets das colunas e adiciona o ícone de ação como última célula.
    final cells = columns.map((column) => column.header).toList() +
        [
          Padding(
            padding: iconPadding ?? EdgeInsets.zero,
            child: Align(
              alignment: Alignment.centerRight,
              child: actionIcon ?? const SizedBox.shrink(),
            ),
          )
        ];

    return Row(
      children: cells.indexed.map(
        (cell) {
          final cellIndex = cell.$1;
          final cellWidget = cell.$2;
          return Expanded(
            flex: columnFlex[cellIndex] ?? 1,
            child: cellWidget,
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: style.headerBackgroundColor,
        border: BorderDirectional(
          bottom: BorderSide(
            color: style.borderColor,
            width: style.borderWidth,
          ),
        ),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: _buildHeader(),
      ),
    );
  }
}
