import 'dart:async';
import 'package:clock_challenge/widgets/parallex_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

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

  final Iterable<Duration> _pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 500),
  ];

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
    ThemeData themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            child: Text(
              time,
              style: TextStyle(
                  fontSize: 50,
                  color: themeData.accentColor,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              _popTimePicker();
            },
          ),
          Spacer(),
          !_isCountingDown
          ? ParallaxButton(
            text: '开始',
            onTap: _startCountingDown,
            backgroundSize: Size(200, 50),
            backgroundColor: Colors.green.withOpacity(0.3),
            textStyle: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          )
//            ? FlatButton(
//          child: Text('开始'),
//          onPressed: _startCountingDown,
//        )
              : null,
          _isCountingDown && !_isFinished
              ?
          Padding(
            padding: EdgeInsets.only(bottom: 20),
          child: ParallaxButton(
            text: pauseButtonText,
            onTap: _pauseOrResumeCountingDown,
            backgroundSize: Size(200, 50),
            backgroundColor: Colors.blue.withOpacity(0.3),
            textStyle: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          )
          )
              : null,
          _isCountingDown
              ? ParallaxButton(
            text: '停止',
            onTap: _stopCountingDown,
            backgroundSize: Size(200, 50),
            backgroundColor: Colors.red.withOpacity(0.3),
            textStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          )
              : null
        ].where((element) => element != null)
            .toList(),
      ),
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
      Vibrate.vibrateWithPauses(_pauses);
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