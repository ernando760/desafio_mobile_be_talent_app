import 'package:flutter/material.dart';

/// Representa o dado de uma célula na tabela.
/// Cada célula contém um único widget, como texto, imagem ou outro componente visual.
class TableCellData {
  /// Constrói uma célula com o widget especificado.
  TableCellData({required this.content});

  /// Widget que será exibido dentro da célula.
  final Widget content;
}

/// Representa o cabeçalho de uma coluna na tabela.
/// Cada coluna possui um rótulo que será exibido no cabeçalho.
class TableColumnData {
  /// Constrói uma coluna com o widget do rótulo especificado.
  TableColumnData({required this.header});

  /// Widget a ser usado como rótulo da coluna (ex.: texto ou ícone).
  final Widget header;
}

/// Representa uma linha da tabela que pode ser expandida para exibir mais informações.
///
/// Uma linha colapsável contém células, um estado de expansão, um corpo expansível e
/// um ícone personalizável para representar o estado de expansão.
class CollapsibleRowData {
  /// Cria uma linha expansível com as células especificadas.
  ///
  /// - [cells] define os dados das células da linha.
  /// - [isExpanded] define se a linha começa expandida ou não.
  /// - [expandedContent] é o widget exibido quando a linha está expandida.
  /// - [actionIconBuilder] permite personalizar o ícone de expansão.
  /// - [onExpansionChanged] é uma callback que é acionada quando o estado de expansão muda.
  CollapsibleRowData({
    required this.cells,
    required this.expandedContent,
    this.isExpanded = false,
    this.actionIconBuilder,
    this.onExpansionChanged,
  });

  /// Callback acionada quando o estado de expansão da linha muda.
  /// Recebe `true` se a linha foi expandida ou `false` se foi colapsada.
  final void Function(bool isExpanded)? onExpansionChanged;

  /// Lista de células que compõem a linha.
  final List<TableCellData> cells;

  /// Estado inicial da linha: `true` se estiver expandida, `false` se estiver colapsada.
  final bool isExpanded;

  /// Widget exibido quando a linha está expandida.
  final Widget expandedContent;

  /// Função que constrói o ícone de expansão com base no estado atual da linha.
  final Widget Function(BuildContext context, bool isExpanded)?
      actionIconBuilder;
}
