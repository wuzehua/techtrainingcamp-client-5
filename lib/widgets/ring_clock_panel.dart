import 'dart:async';
import 'dart:math';
import 'package:clock_challenge/model/ring_state.dart';
import 'package:clock_challenge/painter/ring_painter.dart';
import 'package:clock_challenge/utils/datetime_utils.dart';
import 'package:clock_challenge/widgets/text_dial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sensors/sensors.dart';

class RingClockPanel extends StatefulWidget {

  final String utcOffset;

  RingClockPanel(this.utcOffset, {Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RingClockPanelState();
  }

}

class _RingClockPanelState extends State<RingClockPanel> {

  Timer _timer;
  DateTime _time;
  RingState _ringState;
  bool _useAmPm = false;
  double _rotateX = 0.0;
  double _rotateY = 0.0;

  double _width = 0;
  double _height = 0;

  bool _panning = false;
  double _currX = 0.0;
  double _currY = 0.0;


  String get timeStr {
    if (_time == null) {
      return "";
    }

    if (!_useAmPm) {
      return '${_time.hour.toString().padLeft(2, '0')}:'
             '${_time.minute.toString().padLeft(2, '0')}:'
             '${_time.second.toString().padLeft(2, '0')}';
    } else {
      int hour = _time.hour;
      if (hour > 12) {
        hour -= 12;
      }

      return '${hour.toString().padLeft(2, '0')}:'
          '${_time.minute.toString().padLeft(2, '0')}:'
          '${_time.second.toString().padLeft(2, '0')}';
    }

  }

  String get dateStr {
    if (_time == null) {
      return '';
    }

    return '${_time.year}-'
        '${_time.month.toString().padLeft(2, '0')}-'
        '${_time.day.toString().padLeft(2, '0')}';
  }

  String get amPmStr {
    if (_time == null) {
      return '';
    }

    if (_time.hour >= 12) {
      return 'PM';
    }

    return 'AM';
  }

  _RingClockPanelState(): super() {

    _ringState = RingState();
    const Duration duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (timer) {
      DateTime res = transDateTime(DateTime.now().toUtc(), widget.utcOffset);

      setState(() {
        _time = res;
        _ringState.currPos = _time.second;
      });

    });


  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    double xRatio = _currX / _width;
    double yRatio = _currY / _height;

    return Center(
      child: Transform(
        transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(_panning ? (0.3 * yRatio * 2 - 0.3) : 0)
                  ..rotateY(_panning ? -(0.3 * xRatio * 2 - 0.3) : 0),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onDoubleTap: _toggleAmPm,
          onPanCancel: () => setState(() => _panning = false),
          onPanDown: (details) => setState(() => _panning = true),
          onPanUpdate: _updatePanningPosition,
          onPanEnd: (details) => setState(()=> _panning = false),
          child: Stack(
            children: <Widget>[
              CustomPaint(
                size: Size(double.infinity, double.infinity),
                foregroundPainter: RingPainter(_ringState,
                  ringColor: themeData.brightness == Brightness.dark ?
                      Colors.white : Colors.black
                ),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..translate(
                      _panning ? (8 * xRatio * 2 - 8) : 0.0,
                      _panning ? (8 * yRatio * 2 - 8) : 0.0,
                      0.0),
                alignment: FractionalOffset.center,
                child: Center(child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(dateStr,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Transform(
                        alignment: FractionalOffset.center,
                        transform: Matrix4.identity()
                          ..translate(
                              _panning ? (8 * xRatio * 2 - 8) : 0.0,
                              _panning ? (8 * yRatio * 2 - 8) : 0.0,
                              0.0),
                        child: Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(timeStr,
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            _useAmPm ? Text(
                              amPmStr
                            ) : null
                          ].where((element) => element != null)
                          .toList(),
                        ),
                      ),
                    Text('GMT${widget.utcOffset}')
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _toggleAmPm() {
    setState(() {
      _useAmPm = !_useAmPm;
    });
  }

  void _updatePanningPosition(DragUpdateDetails details) {

    double x = details.localPosition.dx;
    double y = details.localPosition.dy;

    if (x > 0 && x < _width && y > 0 && y < _height) {
      setState(() {
        _currX = x;
        _currY = y;
      });
    }

  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

}