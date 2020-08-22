import 'dart:async';
import 'package:clock_challenge/model/ring_state.dart';
import 'package:clock_challenge/painter/ring_painter.dart';
import 'package:clock_challenge/utils/datetime_utils.dart';
import 'package:clock_challenge/widgets/text_dial.dart';
import 'package:flutter/material.dart';

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

    return Center(
      child: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            foregroundPainter: RingPainter(_ringState,
              ringColor: themeData.brightness == Brightness.dark ?
                  Colors.white : Colors.black
            ),
          ),
          Center(child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(dateStr,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
              Text('GMT${widget.utcOffset}')
              ],
            )
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

}