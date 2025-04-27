import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class RipplePainter extends CustomPainter {
  final double animationValue;
  final Color color;
  RipplePainter({required this.animationValue, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final cenetr = Offset(size.width / 2, size.height / 2);
    final maxRadius = math.min(size.width, size.height) / 2;

    const rippleCount = 3;
    for (int i = 0; i < rippleCount; i++) {
      final progress = ((animationValue + i / rippleCount) % 1.0);
      final radius = maxRadius * progress;
      final oppacity = (1.0 - progress).clamp(0.0, 1.0);
      final paint =
          Paint()
            // ignore: deprecated_member_use
            ..color = color.withOpacity(oppacity * 0.5)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 4.0
      //..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10.0);
      ;
      canvas.drawCircle(cenetr, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return (oldDelegate as RipplePainter).animationValue != animationValue ||
        oldDelegate.color != color;
  }
}
