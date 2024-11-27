import 'dart:math';

import 'package:flutter/material.dart';

import '../style/table_style.dart';
import '../table_data/table_data.dart';

/// Widget que representa uma linha expansível em uma tabela personalizada.
///
/// Permite exibir uma linha com células configuráveis, um conteúdo expansível,
/// ícones customizados e ações associadas à expansão/colapso.
class CollapsibleTableRowWidget extends StatefulWidget {
  /// Construtor para uma linha expansível na tabela.
  ///
  /// - [cells] contém os dados das células na linha.
  /// - [columnFlex] define a flexibilidade de largura para cada célula.
  /// - [isExpanded] indica o estado inicial da expansão.
  /// - [expandedContent] especifica o conteúdo mostrado ao expandir a linha.
  /// - [actionIconBuilder] permite personalizar o ícone de expansão.
  /// - [style] define o estilo visual aplicado à linha.
  /// - [onExpansionChanged] callback acionado ao expandir/colapsar a linha.
  const CollapsibleTableRowWidget({
    super.key,
    this.isExpanded = true,
    this.padding,
    required this.expandedContent,
    this.actionIconBuilder,
    required this.cells,
    required this.columnFlex,
    required this.style,
    this.onExpansionChanged,
  });

  /// Lista de células exibidas na linha.
  final List<TableCellData> cells;

  /// Define a proporção de flexibilidade para cada célula.
  final Map<int, int> columnFlex;

  /// Estado inicial de expansão da linha.
  final bool isExpanded;

  /// Espaçamento interno da linha.
  final EdgeInsetsGeometry? padding;

  /// Conteúdo exibido quando a linha está expandida.
  final Widget expandedContent;

  /// Widget customizado para o ícone de expansão/colapso.
  final Widget? Function(BuildContext context, bool isExpanded)?
      actionIconBuilder;

  /// Estilo visual aplicado à linha.
  final TableStyle style;

  /// Callback acionado ao alterar o estado de expansão da linha.
  final void Function(bool isOpen)? onExpansionChanged;

  @override
  State<CollapsibleTableRowWidget> createState() =>
      _CollapsibleTableRowWidgetState();
}

class _CollapsibleTableRowWidgetState extends State<CollapsibleTableRowWidget> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      widget.onExpansionChanged?.call(_isExpanded);
    });
  }

  /// Constrói o cabeçalho da linha com células e o ícone de expansão.
  Widget _buildRowHeader(BuildContext context) {
    final cellWidgets = widget.cells.map((cell) => cell.content).toList() +
        [
          Align(
            alignment: Alignment.centerRight,
            child: widget.actionIconBuilder?.call(context, _isExpanded) ??
                Transform.rotate(
                  angle: _isExpanded ? pi * 3 : 0,
                  child: const Icon(Icons.keyboard_arrow_down_rounded),
                ),
          ),
        ];

    return Flex(
      direction: Axis.horizontal,
      children: cellWidgets.indexed.map(
        (cell) {
          final cellIndex = cell.$1;
          final cellWidget = cell.$2;
          return Flexible(
            fit: FlexFit.tight,
            flex: widget.columnFlex[cellIndex] ?? 1,
            child: cellWidget,
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          widget.onExpansionChanged != null || widget.actionIconBuilder != null
              ? _toggleExpanded
              : null,
      child: Container(
        decoration: BoxDecoration(
          color: widget.style.rowBackgroundColor,
        ),
        child: Padding(
          padding: widget.padding ?? EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Cabeçalho da linha.
              _buildRowHeader(context),
              // Conteúdo expansível.
              if (_isExpanded) widget.expandedContent
            ],
          ),
        ),
      ),
    );
  }
}
