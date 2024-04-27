import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';



class HexagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return createHexagonalPath(size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

  Path createHexagonalPath(double width, double height) {
    final path = Path();

    final double sideLength = width / 2;

    final double horizontalOffset = (width - sideLength) / 2;
    final double verticalOffset = (height - sideLength) / 2;
    final double radius = sideLength / 2;

    final double startX = horizontalOffset + radius * math.cos(0);
    final double startY = verticalOffset + radius * math.sin(0);
    path.moveTo(startX, startY);

    for (int i = 1; i <= 6; i++) {
      final double x = horizontalOffset + radius * math.cos((2 * math.pi * i) / 6);
      final double y = verticalOffset + radius * math.sin((2 * math.pi * i) / 6);
      path.lineTo(x, y);
    }

    path.close();

    return path;
  }
}

class HexagonalBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  HexagonalBorderPainter({
    required this.color,
    this.strokeWidth = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = createHexagonalPath(size.width, size.height);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  Path createHexagonalPath(double width, double height) {
    final path = Path();

    final double sideLength = width / 2;

    final double horizontalOffset = (width - sideLength) / 2;
    final double verticalOffset = (height - sideLength) / 2;
    final double radius = sideLength / 2;

    final double startX = horizontalOffset + radius * math.cos(0);
    final double startY = verticalOffset + radius * math.sin(0);
    path.moveTo(startX, startY);

    for (int i = 1; i <= 6; i++) {
      final double x = horizontalOffset + radius * math.cos((2 * math.pi * i) / 6);
      final double y = verticalOffset + radius * math.sin((2 * math.pi * i) / 6);
      path.lineTo(x, y);
    }

    path.close();

    return path;
  }
}