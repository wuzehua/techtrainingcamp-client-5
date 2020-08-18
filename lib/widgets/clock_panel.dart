import 'dart:async';
import 'package:clock_challenge/utils/datetime_utils.dart';
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
  DateTime _time;

  _ClockPanelState(): super() {

    const Duration duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (timer) {
      DateTime res = transDateTime(DateTime.now().toUtc(), widget.utcOffset);

      setState(() {
        _time = res;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return TextDial(
      _time
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

}