import 'package:flutter/material.dart';
import 'dart:math' as math;

class SegmentedCircularProgress extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final double strokeWidth;
  final Color activeColor;
  final Color inactiveColor;
  final double gapAngle; // In degrees

  const SegmentedCircularProgress({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.strokeWidth = 4.0,
    this.activeColor = Colors.orange,
    this.inactiveColor = Colors.grey,
    this.gapAngle = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SegmentedCircularProgressPainter(
        totalSteps: totalSteps,
        currentStep: currentStep,
        strokeWidth: strokeWidth,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        gapAngle: gapAngle,
      ),
    );
  }
}

class _SegmentedCircularProgressPainter extends CustomPainter {
  final int totalSteps;
  final int currentStep;
  final double strokeWidth;
  final Color activeColor;
  final Color inactiveColor;
  final double gapAngle;

  _SegmentedCircularProgressPainter({
    required this.totalSteps,
    required this.currentStep,
    required this.strokeWidth,
    required this.activeColor,
    required this.inactiveColor,
    required this.gapAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double gapRadians = gapAngle * math.pi / 180.0;
    // Total gap space is gapRadians * totalSteps
    // Remaining space is 2 * pi - total gap space
    final double sweepRadians =
        (2 * math.pi - (gapRadians * totalSteps)) / totalSteps;

    // Start from top (-pi / 2)
    double startAngle = -math.pi / 2;

    final Rect rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    for (int i = 0; i < totalSteps; i++) {
      final bool isActive = i < currentStep;

      final Paint paint = Paint()
        ..color = isActive ? activeColor : inactiveColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round; // Round edges for nice look

      canvas.drawArc(rect, startAngle, sweepRadians, false, paint);

      startAngle += sweepRadians + gapRadians;
    }
  }

  @override
  bool shouldRepaint(covariant _SegmentedCircularProgressPainter oldDelegate) {
    return oldDelegate.currentStep != currentStep ||
        oldDelegate.totalSteps != totalSteps ||
        oldDelegate.activeColor != activeColor ||
        oldDelegate.inactiveColor != inactiveColor ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.gapAngle != gapAngle;
  }
}
