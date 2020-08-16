import 'package:flutter/material.dart';
import '../widgets/page_app_bar.dart';
import '../widgets/count_down_panel.dart';

class CountDownPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(
        context,
        title: '定时器',
      ),
      body: Center(
        child: CountDownPanel(),
      ),
    );
  }

}
