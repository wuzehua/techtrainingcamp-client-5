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

    ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.access_time,
                color: themeData.accentColor,
              ),
              onPressed: _openCountDownPage,
            ),
            IconButton(
              icon: Icon(Icons.alarm,
                color: themeData.accentColor,
              ),
              onPressed: _openAlarmPage,
            ),
            IconButton(
              icon: Icon(Icons.title,
                color: themeData.accentColor,
              ),
              onPressed: _openTimezonePage,
            )
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: ClockPanel(_utcOffset)
            ),
            Text(_utcOffset),
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
