import 'package:flutter/material.dart';

class PageAppBar extends AppBar {
  PageAppBar(BuildContext context, {Key key, String title = ''})
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