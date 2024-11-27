import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;
  DashedBorderPainter({
    super.repaint,
    required this.color,
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
    this.strokeWidth = 1.0,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Desenhar borda superior
    double startX = 0;
    _drawBorderTop(startX, paint, canvas, size);

    // Desenhar borda direita
    double startY = 0;
    _drawBorderRight(startY, paint, canvas, size);

    // Desenhar borda inferior
    startX = 0;
    _drawBorderBottom(startX, paint, canvas, size);

    // Desenhar borda esquerda
    startY = 0;
    _drawBorderLeft(startY, paint, canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void _drawBorderTop(startX, Paint paint, Canvas canvas, Size size) {
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  void _drawBorderRight(startY, Paint paint, Canvas canvas, Size size) {
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width, startY),
        Offset(size.width, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  void _drawBorderBottom(startX, Paint paint, Canvas canvas, Size size) {
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(startX + dashWidth, size.height),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  void _drawBorderLeft(startY, Paint paint, Canvas canvas, Size size) {
    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }
}

final class DashedBorderBottomPainter extends DashedBorderPainter {
  DashedBorderBottomPainter({
    required super.color,
    super.dashSpace,
    super.dashWidth,
    super.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    double startX = 0;
    _drawBorderBottom(startX, paint, canvas, size);
  }
}
