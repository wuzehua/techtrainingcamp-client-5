import 'package:clock_challenge/model/clock_state.dart';
import 'package:clock_challenge/pages/alarm_page.dart';
import 'package:clock_challenge/pages/count_down_page.dart';
import 'package:clock_challenge/pages/timezone_page.dart';
import 'package:clock_challenge/widgets/analog_clock.dart';
import 'package:clock_challenge/widgets/ring_clock_panel.dart';
import 'package:flutter/material.dart';
import 'package:clock_challenge/pages/analog_clock_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ClockState _clockState;
  int _panelIndex = 0;
  List<Widget> _clockPanels;
  
  _HomePageState(): super() {
    _clockState = ClockState();
    _clockState.utcOffset = '+08:00';
    _clockPanels = [RingClockPanel(_clockState), AnalogClock(_clockState)];
  }

  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.access_time,
                color: themeData.accentColor,
              ),
              onPressed: _openCountDownPage,
            ),
            IconButton(
              icon: Icon(Icons.title,
                color: themeData.accentColor,
              ),
              onPressed: _openTimezonePage,
            )
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: _clockPanels[_panelIndex]
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: IconButton(
                icon: Icon(
                  Icons.swap_horiz,
                ),
                onPressed: _switchClockPanel,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openCountDownPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return CountDownPage();
        })
    );
  }

  void _openAlarmPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) {
        return AlarmPage();
      })
    );
  }

  void _openAnalogClockPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return AnalogClockPage();
        })
    );
  }

  void _switchClockPanel() {
    setState(() {
      _panelIndex = (_panelIndex + 1) % _clockPanels.length;
    });
  }

  void _openTimezonePage() async {
    String res = await Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return TimezonePage();
        })
    );

    if (res == null || res == '') {
      return;
    }

    setState(() {
      _clockState.utcOffset = res;
    });
  }

}
