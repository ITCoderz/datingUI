import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:flutter/material.dart';

class GradientThumbShape extends SliderComponentShape {
  final double enabledThumbRadius;

  const GradientThumbShape({
    this.enabledThumbRadius = 14.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(enabledThumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    // Draw white border
    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0; // 1px border (2.0 for better visibility on high-density screens)

    canvas.drawCircle(
      center,
      enabledThumbRadius,
      borderPaint,
    );

    // Draw gradient thumb
    final Paint paint = Paint()
      ..shader =buildLinearGradient().createShader(Rect.fromCircle(
        center: center,
        radius: enabledThumbRadius - 2.0, // Adjust radius for the inner circle
      ));

    canvas.drawCircle(
      center,
      enabledThumbRadius - 2.0, // Adjust radius for the inner circle
      paint,
    );
  }
}
