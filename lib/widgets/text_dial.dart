import 'package:clock_challenge/widgets/dial.dart';
import 'package:flutter/material.dart';

class TextDial extends Dial {
  TextDial(int hour, int minute, int second, {Key key}):
        super(hour, minute, second, key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('${hour}:${minute}:${second}'),
    );
  }

}