import 'dart:math';

import 'package:flutter/rendering.dart';

const kGradientColors = [
  Color(0xFF0083cb),
  Color(0xFF424cc4),
  Color(0xFF8314bd)
];

const kGradientAngleDeg = 45.0;
const kGradientAngleRadians = kGradientAngleDeg * (pi / 180.0);

class GradientPainter extends CustomPainter {
  const GradientPainter({
    /// If true, this will rotate the gradient by [kGradientAngleRadians].
    this.rotated = false,
  });

  final bool rotated;

  static final Gradient _gradient = LinearGradient(colors: kGradientColors);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final Paint p = Paint()..shader = _gradient.createShader(rect);

    if (!rotated) {
      canvas.drawRect(rect, p);
    } else {
      print('rotated');
      canvas.save();
      canvas.clipRect(Offset.zero & size);

      final b = size.width * tan(90);
      final c = sqrt(size.width * size.width + b * b);

      canvas.rotate(kGradientAngleRadians);
      canvas.drawRect(Offset(0.0, -b) & Size(c, b * 2), p);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
