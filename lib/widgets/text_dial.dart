import 'package:clock_challenge/painter/text_dial_painter.dart';
import 'package:clock_challenge/widgets/dial.dart';
import 'package:flutter/material.dart';

class TextDial extends Dial {
  TextDial(DateTime time, {Key key}):
        super(time, key: key);

  @override
  Widget build(BuildContext context) {
    if (time == null) {
      return Text('无时间');
    }
    return Center(
      child: CustomPaint(
        size: Size(double.infinity, double.infinity),
        painter: TextDialPainter(time),
      ),
    );
  }

}