import 'package:clock_challenge/widgets/page_app_bar.dart';
import 'package:clock_challenge/widgets/timezone_search_panel.dart';
import 'package:flutter/material.dart';

class TimezonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(context,
        title: '时区选择',
      ),
      body: TimezoneSearchPanel(),
    );
  }

}