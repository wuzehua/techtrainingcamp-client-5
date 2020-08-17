import 'package:flutter/material.dart';

abstract class Dial extends StatelessWidget {

  final int hour;
  final int minute;
  final int second;

  Dial(this.hour, this.minute, this.second, {Key key}):super(key: key);

}