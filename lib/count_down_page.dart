import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class CountDownPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CountDownPageAppBar(
        context,
        title: '计时器',
      ),
      body: Center(
        child: CountDownPanel(),
      ),
    );
  }

}

class CountDownPageAppBar extends AppBar {
  CountDownPageAppBar(BuildContext context, {Key key, String title = ''})
      : super(
          key: key,
          title: Text(
            title,
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
}

class CountDownPanel extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CountDownPanelState();
  }

}


class _CountDownPanelState extends State<CountDownPanel> {

  Timer _timer;

  int _hour = 0;
  int _minute = 0;
  int _second = 0;

  int _totalSeconds = 0;

  bool _isCountingDown = false;
  bool _isPaused = false;
  bool _isFinished = false;

  String get time {
    return '${_hour.toString().padLeft(2, '0')}:' +
        '${_minute.toString().padLeft(2, '0')}:' +
        '${_second.toString().padLeft(2, '0')}';
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
    DatePicker.showDatePicker(context,
        initialDateTime: DateTime.parse('1900-01-01 00:00:00'),
        locale: DateTimePickerLocale.zh_cn,
        pickerMode: DateTimePickerMode.time,
        onConfirm: (dateTime, selectIndex) {
          setState(() {
            _hour = dateTime.hour;
            _minute = dateTime.minute;
            _second = dateTime.second;
            _totalSeconds =
                _hour * 3600 + _minute * 60 + _second;
          });
        });
  }

  void _startCountingDown() {

    if (_totalSeconds <= 0) {
      return;
    }

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
    });
  }


}
