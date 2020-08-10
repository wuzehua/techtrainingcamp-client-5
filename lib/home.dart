import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
              splashColor: Colors.white,
              colorBrightness: Brightness.dark,
              child: Text('这是一个按钮'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ),
              onPressed: () {

              },
            )
          ],
        ),
      ),
    );
  }
}
