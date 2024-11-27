import 'package:flutter/material.dart';

class TableStyle {
  const TableStyle({
    this.tableBackgroundColor = const Color(0x00000000),
    this.rowBackgroundColor = const Color(0x00000000),
    this.headerBackgroundColor = const Color(0x00000000),
    this.borderColor = const Color(0x00000000),
    this.borderWidth = 1.0,
    this.borderRadius,
  });

  final Color tableBackgroundColor;

  /// Cor de fundo para as linhas.
  final Color rowBackgroundColor;

  /// Cor de fundo para o cabeçalho.
  final Color headerBackgroundColor;

  /// Cor das bordas da tabela.
  final Color borderColor;

  /// Espessura das bordas.
  final double borderWidth;

  final BorderRadius? borderRadius;
}

class TableDecoration {
  const TableDecoration({
    this.color = Colors.transparent,
    this.tableHeaderColor = Colors.transparent,
    this.tableBodyColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1.0,
    this.borderRadius,
  });

  final Color color;
  final Color tableHeaderColor;
  final Color tableBodyColor;
  final Color borderColor;
  final double borderWidth;
  final BorderRadius? borderRadius;
}
