import 'package:flutter/material.dart';

class RoundedLinearProgressIndicator extends StatelessWidget {
  final double borderRadius;
  final Color backgroundColor;
  final Color valueColor;
  final double value;

  const RoundedLinearProgressIndicator({
    super.key,
    this.borderRadius = 10.0,
    this.backgroundColor = Colors.grey,
    this.valueColor = Colors.blue,
    this.value = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RoundedLinearProgressIndicatorPainter(
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
        valueColor: valueColor,
        value: value,
      ),
      child: SizedBox(
        height: 10.0,
        child: LinearProgressIndicator(
          backgroundColor: Colors.transparent,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.transparent),
          value: value,
        ),
      ),
    );
  }
}

class RoundedLinearProgressIndicatorPainter extends CustomPainter {
  final double borderRadius;
  final Color backgroundColor;
  final Color valueColor;
  final double value;

  RoundedLinearProgressIndicatorPainter({
    required this.borderRadius,
    required this.backgroundColor,
    required this.valueColor,
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = backgroundColor;
    final valuePaint = Paint()..color = valueColor;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final bgRRect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));
    final valueRRect =
        RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width * value, size.height), Radius.circular(borderRadius));

    canvas.drawRRect(bgRRect, backgroundPaint);
    canvas.drawRRect(valueRRect, valuePaint);
  }

  @override
  bool shouldRepaint(RoundedLinearProgressIndicatorPainter oldDelegate) => value != oldDelegate.value;
}
