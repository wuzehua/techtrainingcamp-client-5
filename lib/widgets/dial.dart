import 'package:flutter/material.dart';

abstract class Dial extends StatelessWidget {

  final DateTime time;

  Dial(this.time, {Key key}):super(key: key);

}