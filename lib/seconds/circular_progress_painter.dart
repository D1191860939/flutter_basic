import 'dart:math';

import 'package:flutter/material.dart';

/// 1. 画指示器圆形
/// 2. shouldRePaint
class CircularProgressPainter extends CustomPainter {
  final double _kScaleWidthRate = 0.4 / 10;
  final _kStrokeWidthRate = 0.8 / 135.0;
  final _kIndicatorRadiusRate = 0.2 / 10;

  final Duration duration;
  final TextStyle textStyle;
  final Color themeColor;
  final Color scaleColor;
  final double radius;

  CircularProgressPainter({
    required this.duration,
    required this.textStyle,
    required this.themeColor,
    required this.scaleColor,
    required this.radius,
  }) {
    progressPaint.color = themeColor;
  }

  final TextPainter _textPainter = TextPainter(
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );

  Paint bgPaint = Paint()
    ..color = Colors.grey
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true;

  Paint progressPaint = Paint()..color = Colors.green;

  @override
  void paint(Canvas canvas, Size size) {
    bgPaint.strokeWidth = _kStrokeWidthRate * radius;

    canvas.translate(size.width / 2, size.height / 2);
    _drawBackground(size, canvas, bgPaint);
    _drawText(canvas);

    int second = duration.inSeconds % 60;
    int milliseconds = duration.inMilliseconds % 1000;
    double radians = (second * 1000 + milliseconds) / (60 * 1000) * 2 * pi;
    final double indicatorRadius = size.width * _kIndicatorRadiusRate;
    final double scaleLineWidth = size.width * _kScaleWidthRate;
    canvas.save();
    canvas.rotate(radians);
    canvas.drawCircle(
        Offset(
          0,
          -size.width / 2 + scaleLineWidth + indicatorRadius,
        ),
        indicatorRadius / 2,
        progressPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CircularProgressPainter oldDelegate) {
    return oldDelegate.duration != duration ||
        oldDelegate.textStyle != textStyle ||
        oldDelegate.themeColor != themeColor ||
        oldDelegate.scaleColor != scaleColor ||
        oldDelegate.radius != radius;
  }

  void _drawBackground(Size size, Canvas canvas, Paint bgPaint) {
    final double scaleLineWidth = size.width * _kScaleWidthRate;
    for (int i = 0; i < 180; i++) {
      if (i == 135) {
        bgPaint.color = themeColor;
      } else {
        bgPaint.color = scaleColor;
      }
      canvas.drawLine(Offset(size.width / 2 - scaleLineWidth, 0),
          Offset(size.width / 2, 0), bgPaint);
      canvas.rotate(pi / 90);
    }
  }

  void _drawText(Canvas canvas) {
    int minutes = duration.inMinutes % Duration.minutesPerHour;
    int seconds = duration.inSeconds % Duration.secondsPerMinute;
    int milliseconds = duration.inMilliseconds % Duration.millisecondsPerSecond;

    String normalText =
        "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";

    String highlightText =
        ".${(milliseconds ~/ 10).toString().padLeft(2, "0")}";

    _textPainter.text = TextSpan(text: normalText, style: textStyle, children: [
      TextSpan(
          text: highlightText, style: textStyle.copyWith(color: themeColor))
    ]);

    _textPainter.layout();

    final double width = _textPainter.size.width;
    final double height = _textPainter.size.height;

    _textPainter.paint(canvas, Offset(-width / 2, -height / 2));
  }
}
