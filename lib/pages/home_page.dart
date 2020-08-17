import 'package:clock_challenge/pages/alarm_page.dart';
import 'package:clock_challenge/pages/count_down_page.dart';
import 'package:clock_challenge/pages/timezone_page.dart';
import 'package:clock_challenge/widgets/clock_panel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _utcOffset = '+08:00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClockPanel(_utcOffset),
            Text(_utcOffset),
            RaisedButton(
              child: Text('定时器'),
              onPressed: _openCountDownPage,
            ),
            RaisedButton(
              child: Text('闹钟'),
              onPressed: _openAlarmPage
            ),
            RaisedButton(
              child: Text('时区选择'),
              onPressed: _openTimezonePage,
            )
          ],
        ),
      ),
    );
  }

  void _openCountDownPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return CountDownPage();
        })
    );
  }

  void _openAlarmPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) {
        return AlarmPage();
      })
    );
  }

  void _openTimezonePage() async {
    String res = await Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return TimezonePage();
        })
    );

    if (res == null || res == '') {
      return;
    }

    setState(() {
      _utcOffset = res;
    });
  }

}
