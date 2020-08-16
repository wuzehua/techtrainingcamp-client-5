import 'package:clock_challenge/pages/alarm_page.dart';
import 'package:clock_challenge/pages/count_down_page.dart';
import 'package:clock_challenge/pages/timezone_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.title),
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

  void _openTimezonePage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return TimezonePage();
        })
    );
  }
}
