import 'dart:async';
import 'package:clock_challenge/widgets/text_dial.dart';
import 'package:flutter/material.dart';

class ClockPanel extends StatefulWidget {

  final String utcOffset;

  ClockPanel(this.utcOffset, {Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ClockPanelState();
  }

}

class _ClockPanelState extends State<ClockPanel> {

  Timer _timer;
  int _hour;
  int _minute;
  int _second;
  bool flag;

  _ClockPanelState(): super() {

    const Duration duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (timer) {
      String utcOffset = widget.utcOffset;
      if (utcOffset.startsWith('-')) {
        utcOffset = utcOffset.replaceFirst('-', '+');
      } else {
        utcOffset = utcOffset.replaceFirst('+', '-');
      }

      DateTime dateTime = DateTime.now();
      String utcString = '${dateTime.year}-'
          '${dateTime.month.toString().padLeft(2, '0')}-'
          '${dateTime.day.toString().padLeft(2, '0')}T'
          '${dateTime.hour.toString().padLeft(2,'0')}:'
          '${dateTime.minute.toString().padLeft(2, '0')}:'
          '${dateTime.second.toString().padLeft(2, '0')}'
          '$utcOffset';

      dateTime = DateTime.parse(utcString);

      setState(() {
        _hour = dateTime.hour;
        _minute = dateTime.minute;
        _second = dateTime.second;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return TextDial(
      _hour, _minute, _second
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

}