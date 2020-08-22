import 'dart:math';

import 'package:clock_challenge/model/ring_state.dart';
import 'package:flutter/material.dart';

class RingPainter extends CustomPainter {

  RingState ringState;
  Color ringColor;

  Paint _paint;

  RingPainter(this.ringState,
      {
        this.ringColor = Colors.white,
        double strokeWidth = 2
      }):
        super() {
    _paint = Paint();
    _paint.strokeWidth = strokeWidth;
    _paint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    double radius = min(width, height) * 0.9 / 2.0;

    canvas.save();
    canvas.translate(width / 2, height / 2);

    _drawSplitLines(canvas, radius);

    canvas.restore();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _drawSplitLines(Canvas canvas, double radius) {
    canvas.save();
    int num = ringState.splitCount;
    int curPos = ringState.currPos % ringState.splitCount;


    double deltaAlpha = 0.9 / num;
    double deltaDeg = 2 * pi / num;

    canvas.rotate(curPos * deltaDeg + pi);
    double alpha = 1;

    for(int i = 0;i < num;++i) {
      if (alpha < 0) {
        alpha = 0;
      }
      Color color = ringColor.withOpacity(alpha);
      _paint.color = color;
      canvas.drawLine(Offset(0, radius * 0.85), Offset(0, radius), _paint);
      alpha -= deltaAlpha;
      canvas.rotate(deltaDeg);
    }

    canvas.restore();
  }

}