import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class CountDownPage extends StatefulWidget {
  int hour = 0;
  int minute = 0;
  int second = 0;

  int totalSeconds = 0;
  
  String get time {
    return '${hour.toString().padLeft(2, '0')}:' +
        '${minute.toString().padLeft(2,'0')}:' +
        '${second.toString().padLeft(2, '0')}';
  }

  @override
  State<StatefulWidget> createState() {
    return _CountDownPageState();
  }
}

class _CountDownPageState extends State<CountDownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CountDownPageAppBar(context,
      title: '计时器',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              child: Text(
                widget.time,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: () {
                DatePicker.showDatePicker(context,
                  locale: DateTimePickerLocale.zh_cn,
                  pickerMode: DateTimePickerMode.time,
                  onConfirm: (dateTime, selectIndex) {
                    setState(() {
                      widget.hour = dateTime.hour;
                      widget.minute = dateTime.minute;
                      widget.second = dateTime.second;
                      widget.totalSeconds = widget.hour * 3600
                          + widget.minute * 60
                          + widget.second;
                    });
                  }
                );
              },
            )
          ],

        ),
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

