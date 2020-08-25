import 'package:flutter/material.dart';
import 'dart:math';

class AnalogClockPainter extends CustomPainter {
  DateTime datetime;
  final bool showSecondHand;
  final Color hourHandColor;
  final Color minuteHandColor;
  final Color secondHandColor;

  static const double BASE_SIZE = 375.0;
  static const double MINUTES_IN_HOUR = 60.0;
  static const double SECONDS_IN_MINUTE = 60.0;
  static const double HOURS_IN_CLOCK = 12.0;
  static const double HAND_PIN_HOLE_SIZE = 8.0;
  static const double STROKE_WIDTH = 3.0;

  AnalogClockPainter(
      {@required this.datetime,
        this.showSecondHand = true,
        this.hourHandColor = Colors.black,
        this.minuteHandColor = Colors.black,
        this.secondHandColor = Colors.red,
        });

  @override
  void paint(Canvas canvas, Size size) {
    double scaleFactor = size.shortestSide / BASE_SIZE;
    _paintClockHands(canvas, size, scaleFactor);
    _paintPinHole(canvas, size, scaleFactor);
  }

  _paintPinHole(canvas, size, scaleFactor) {
    Paint midPointStrokePainter = Paint()
      ..color = Colors.black
      ..strokeWidth = STROKE_WIDTH * scaleFactor
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    canvas.drawCircle(size.center(Offset.zero),
        HAND_PIN_HOLE_SIZE * scaleFactor, midPointStrokePainter);
  }

  void _paintClockHands(Canvas canvas, Size size, double scaleFactor) {
    int seconds = datetime.second ;
    double minutes = (datetime.minute + seconds/ SECONDS_IN_MINUTE);
    double hour = (datetime.hour + minutes / MINUTES_IN_HOUR);
    List<double> pathX=[-6, 6, 2, 3, 0.5, -0.5, -3, -2], pathY = [30, 30, 10, -50, -160, -160, -50, 10];
    _paintHand(canvas, size, 2*pi/60*seconds, secondHandColor, pathX, pathY);
    pathX=[-2.5, 2.5, 6, 0.5, -0.5, -6]; pathY = [0, 0, -60, -130, -130, -60];
    _paintHand(canvas, size, 2*pi/60*minutes, minuteHandColor, pathX, pathY);
    pathX=[-2, 2, 2, 8, 0.5, -0.5, -8, -2]; pathY = [0, 0, -60, -65, -80, -80, -65,  -60];
    _paintHand(canvas, size, 2*pi/12*hour, hourHandColor, pathX, pathY);
  }

  void _paintHand(Canvas canvas, Size size, double angle, Color handColor, List<double> pathX, List<double> pathY){
    double scaleFactor = size.shortestSide / BASE_SIZE;
    var path = Path();
    double halfHeight=size.height/2;
    double halfWidth=size.width/2;
    Paint handPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = handColor;
    canvas.save();
    canvas.translate(halfWidth, halfHeight);
    canvas.rotate(angle);
    canvas.save();
    assert (pathX.length==pathY.length);
    for (int i=0;i<pathX.length;i++){
      if(i==0)
        path.moveTo(pathX[i]*scaleFactor, pathY[i]*scaleFactor);
      else
        path.lineTo(pathX[i]*scaleFactor, pathY[i]*scaleFactor);
    }
    path.close();
    canvas.drawPath(path, handPaint);
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(AnalogClockPainter oldDelegate) {
    return oldDelegate?.datetime?.isBefore(datetime) ?? true;
  }
}
