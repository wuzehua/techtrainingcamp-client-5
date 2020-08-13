
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountDownPage extends StatefulWidget {

  int hour;
  int minute;
  int second;

  int totalSeconds;

  @override
  State<StatefulWidget> createState() {
    return _CountDownPageState();
  }

}

class _CountDownPageState extends State<CountDownPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(title: '计时器'),

    );

  }


  AppBar _appBar({Key key, String title = ''}) {
    return AppBar(
      title: Text(title,
        style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.close,
          color: Colors.black87,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

}
