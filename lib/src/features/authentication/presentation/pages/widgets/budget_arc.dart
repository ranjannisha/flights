
import 'package:flutter/material.dart';

class BudgetArcPainter extends CustomPainter {
  final double percent; // Value between 0 and 1
  BudgetArcPainter(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    const startAngle = -3.14; // 180°
    final sweepAngle = 3.14 * percent;

    final backgroundPaint = Paint()
      ..color = Colors.grey[200]!
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.green, Colors.orange],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      3.14,
      false,
      backgroundPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}