import 'package:clock_challenge/alarm_page.dart';
import 'package:clock_challenge/count_down_page.dart';
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
              elevation: 8.0,
              highlightElevation: 2.0,
              disabledElevation: 0.0,
              color: Colors.blue,
              highlightColor: Colors.blueAccent,
              disabledColor: Colors.blueGrey,
              colorBrightness: Brightness.dark,
              splashColor: Colors.white24,
              child: Text('定时器'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return CountDownPage();
                  }
                ));
              },
            ),
            RaisedButton(
              child: Text('闹钟'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AlarmPage();
                  }
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
