import 'dart:async';
import 'package:clock_challenge/model/clock_state.dart';
import 'package:clock_challenge/painter/analog_clock_bg_painter.dart';
import 'package:clock_challenge/utils/datetime_utils.dart';
import 'package:flutter/material.dart';
import 'package:clock_challenge/painter/analog_clock_painter.dart';

class AnalogClock extends StatefulWidget {
  final DateTime datetime;
  final bool isLive;
  final ClockState clockState;

  const AnalogClock(
      this.clockState,
      {this.datetime,
        isLive,
        Key key})
      : this.isLive = isLive ?? (datetime == null),
        assert(clockState != null),
        super(key: key);

  @override
  _AnalogClockState createState() => _AnalogClockState(datetime);
}

class _AnalogClockState extends State<AnalogClock> {
  DateTime datetime;

  _AnalogClockState(datetime) : this.datetime = datetime ?? DateTime.now();

  initState() {
    super.initState();
    if (widget.isLive) {
      // update clock every second or minute based on second hand's visibility.
      Duration updateDuration = Duration(seconds: 1);
      Timer.periodic(updateDuration, update);
    }
  }

  update(Timer timer) {
    if (mounted) {
      String utcOffset = '+08:00';
      if (widget.clockState != null) {
        utcOffset = widget.clockState.utcOffset;
      }
      // update is only called on live clocks. So, it's safe to update datetime.
      datetime = transDateTime(DateTime.now().toUtc(), utcOffset);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
              child: new Container(
//                  constraints: BoxConstraints(minWidth: 48.0, minHeight: 48.0),
                  width: double.infinity,
                  height: double.infinity,
                  child: new CustomPaint(
                      painter: AnalogClockBgPainter(),
                      foregroundPainter: new AnalogClockPainter(
                        datetime: datetime
                        ),
                  )
          )
      ),
    );
  }
}
