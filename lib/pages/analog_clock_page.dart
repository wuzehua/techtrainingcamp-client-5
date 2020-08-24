import 'package:clock_challenge/widgets/page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:clock_challenge/widgets/analog_clock.dart';

class AnalogClockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(
        context,
        title: '模拟表盘',
      ),
      body: Center(
        child: AnalogClock(),
      ),
    );
  }

}