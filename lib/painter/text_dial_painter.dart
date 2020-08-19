import 'package:flutter/material.dart';

class TextDialPainter extends CustomPainter {

  final DateTime dateTime;

  TextDialPainter(this.dateTime): super();

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      color: Colors.blueAccent,
      fontSize: 30,
    );
    final textSpan = TextSpan(
      text: '${dateTime.hour}:${dateTime.minute}:${dateTime.second}',
      style: textStyle,
    );


    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );


    final offset = Offset(0, 0);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}