import 'package:flutter/material.dart';
import 'dart:math';

class AnalogClockBgPainter extends CustomPainter{
  final String bgColor;
  final int circleNum;
  final Color borderColor;
  final Color flowerColor;
  final Color indicatorColor;
  final Color numberColor;
  AnalogClockBgPainter({this.bgColor, this.circleNum: 6, this.borderColor: Colors.lightBlueAccent,
  this.flowerColor: Colors.white, this.indicatorColor: Colors.lightBlueAccent, this.numberColor: Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    Gradient gradient = RadialGradient(
      radius: 0.4,
      colors: [
        Colors.blue,
        Colors.black,
      ],
    );
    double outerRadius = size.width/2-2;
    Rect rect = Rect.fromCircle(center: size.center(Offset.zero), radius: outerRadius);
    Paint painter = Paint()
      ..color = Colors.black
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(rect);
    canvas.drawCircle(size.center(Offset.zero), outerRadius, painter);
    double midRadius = size.width/2*0.7;
    _paintFlower(canvas, size);
    _paintBorder(canvas, size, midRadius);
    _paintIndicator(canvas, size, midRadius);
    _paintIndicator(canvas, size, outerRadius, outer: false);
    _paintNum(canvas, size, midRadius, startNum: 12, fontSize: 22);
    _paintNum(canvas, size, outerRadius, fontSize: 26);
  }

  void _paintFlower(Canvas canvas, Size size){
    double width = size.width;
    double height = size.height;
    canvas.save();
    canvas.translate(width / 2, height / 2);
    Paint painter = Paint()
      ..color = flowerColor
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.rotate(pi/circleNum);
    for(int i=0;i<circleNum;i++){
      canvas.rotate(2*pi/circleNum);
      canvas.drawCircle(Offset(0, width/12), width/12, painter);
    }
    canvas.restore();
  }

  void _paintBorder(Canvas canvas, Size size, double radius){
    Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(
        size.center(Offset.zero), radius, borderPaint);
  }

  void _paintIndicator(Canvas canvas, Size size, double radius, {bool outer: true}){
    canvas.save();
    double width = size.width;
    double height = size.height;
    canvas.translate(width / 2, height / 2);
    int num = 60;
    double deltaDeg = 2 * pi / num;
    Paint painter1 = Paint()
      ..color = indicatorColor
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    if (outer==false)
      painter1.strokeWidth = 3;
    for(int i = 0;i < num;++i) {
      if (outer)
        canvas.drawLine(Offset(0, radius * 1.05), Offset(0, radius), painter1);
      else
        canvas.drawLine(Offset(0, radius * 0.97), Offset(0, radius), painter1);
      canvas.rotate(deltaDeg);
    }
    canvas.restore();
  }

  void _paintNum(Canvas canvas, Size size, double radius, {int startNum: 0, double fontSize: 14}) {
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    canvas.save();
    double width = size.width;
    double height = size.height;
    canvas.translate(width / 2, height / 2);
    double angle = 2*pi/12;
    for (int i = 0; i < 12; i++) {
        //draw number
        canvas.save();
        canvas.translate(0.0, -radius + fontSize);
        textPainter.text = new TextSpan(
          text: "${i == 0 ? (12+startNum).toString() : i+startNum}",
          style: TextStyle(
            color: numberColor,
            fontSize: fontSize,
          ),
        );

        //helps make the text painted vertically
        canvas.rotate(-angle * i);

        textPainter.layout();
        textPainter.paint(canvas,
             Offset(-(textPainter.width / 2), -(textPainter.height / 2)));
        canvas.restore();
        canvas.rotate(angle);
      }
    canvas.restore();
  }

  @override
  bool shouldRepaint(AnalogClockBgPainter oldDelegate) {
    return oldDelegate.bgColor==bgColor ?? true;
  }

}

