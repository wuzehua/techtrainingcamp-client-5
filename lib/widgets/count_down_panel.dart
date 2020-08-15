import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class CountDownPanel extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CountDownPanelState();
  }

}


class _CountDownPanelState extends State<CountDownPanel> {

  Timer _timer;

  Duration _countDownDur = Duration(seconds: 1);

  int _totalSeconds = 0;
  int _settingSeconds = 0;

  bool _isCountingDown = false;
  bool _isPaused = false;
  bool _isFinished = false;

  String get time {
    int hour = _totalSeconds ~/ 3600;
    int minute = (_totalSeconds ~/ 60) % 60;
    int second = _totalSeconds % 60;
    return '${hour.toString().padLeft(2, '0')}:' +
        '${minute.toString().padLeft(2, '0')}:' +
        '${second.toString().padLeft(2, '0')}';
  }

  String get pauseButtonText {
    if (_isPaused) {
      return '继续';
    } else {
      return '暂停';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          child: Text(
            time,
            style: TextStyle(
                fontSize: 30,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            _popTimePicker();
          },
        ),
        Spacer(),
        !_isCountingDown
            ? FlatButton(
          child: Text('开始'),
          onPressed: _startCountingDown,
        )
            : null,
        _isCountingDown && !_isFinished
            ? FlatButton(
          child: Text(pauseButtonText),
          onPressed: _pauseOrResumeCountingDown,
        )
            : null,
        _isCountingDown
            ? FlatButton(
          child: Text('停止'),
          onPressed: _stopCountingDown,
        )
            : null
      ].where((element) => element != null)
          .toList(),
    );
  }

  //弹出时间选择
  void _popTimePicker() {

    if (_isCountingDown) {
      return;
    }

    DatePicker.showDatePicker(context,
        initialDateTime: DateTime.parse('1900-01-01 00:00:00'),
        locale: DateTimePickerLocale.zh_cn,
        pickerMode: DateTimePickerMode.time,
        onConfirm: (dateTime, selectIndex) {
          setState(() {
            int hour = dateTime.hour;
            int minute = dateTime.minute;
            int second = dateTime.second;
            _totalSeconds =
                hour * 3600 + minute * 60 + second;
            _settingSeconds = _totalSeconds;
          });
        });
  }

  void _startCountingDown() {

    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }

    if (_totalSeconds <= 0) {
      return;
    }

    _timer = Timer.periodic(_countDownDur,_timerCallback);

    setState(() {
      _isCountingDown = true;
      _isPaused = false;
      _isFinished = false;
    });
  }

  void _pauseOrResumeCountingDown() {
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _stopCountingDown() {
    setState(() {
      _isCountingDown = false;
      _isFinished = false;
      _isPaused = false;
      _totalSeconds = _settingSeconds;
    });

    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }

  }

  void _timerCallback(Timer timer) {
    if (!_isPaused && !_isFinished) {
      _countDown();
    }

    if (_totalSeconds <= 0) {
      _isFinished = true;
      timer.cancel();
    }
  }

  void _countDown() {
    setState(() {
      _totalSeconds -= 1;
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    super.dispose();
  }

}