import 'package:flutter/material.dart';

import 'circular_progress_painter.dart';

class StopWatchWidget extends StatelessWidget {
  final double radius;
  final Duration duration;
  final TextStyle? textStyle;
  final Color? themeColor;
  final Color scaleColor;

  const StopWatchWidget(
      {super.key,
      required this.duration,
      required this.radius,
      this.scaleColor = const Color(0xffDADADA),
      this.textStyle,
      this.themeColor});

  TextStyle get commonStyle => TextStyle(
        fontSize: radius / 3.2,
        fontWeight: FontWeight.w100,
        fontFamily: 'IBMPlexMono',
        color: const Color(0xff343434),
      );

  @override
  Widget build(BuildContext context) {
    TextStyle style = textStyle ?? commonStyle;
    Color themeColor = this.themeColor ?? Theme.of(context).primaryColor;
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: CircularProgressPainter(
        duration: duration,
        textStyle: style,
        themeColor: themeColor,
        scaleColor: scaleColor,
        radius: radius,
      ),
    );
  }
}
