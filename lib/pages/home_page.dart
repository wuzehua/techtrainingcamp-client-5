import 'package:clock_challenge/model/clock_state.dart';
import 'package:clock_challenge/model/location_response_entity.dart';
import 'package:clock_challenge/pages/alarm_page.dart';
import 'package:clock_challenge/pages/count_down_page.dart';
import 'package:clock_challenge/pages/timezone_page.dart';
import 'package:clock_challenge/widgets/analog_clock.dart';
import 'package:clock_challenge/widgets/ring_clock_panel.dart';
import 'package:flutter/material.dart';
import 'package:clock_challenge/pages/analog_clock_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ClockState _clockState;
  int _panelIndex = 0;
  List<Widget> _clockPanels;
  SharedPreferences _sharedPreferences;
  String _locationId = '101280101';

  String get utcOffsetKey {
    return 'utcOffset';
  }

  String get locationIdKey {
    return 'locationId';
  }
  
  _HomePageState(): super() {
    _clockState = ClockState();
    _clockState.utcOffset = '+08:00';
    _clockPanels = [RingClockPanel(_clockState), AnalogClock(_clockState)];

    SharedPreferences.getInstance()
        .then((sharedPre) {
      _sharedPreferences = sharedPre;
      _clockState.utcOffset = _sharedPreferences.getString(utcOffsetKey) ?? '+08:00';
      _locationId = _sharedPreferences.getString(locationIdKey) ?? '101280101';

      setState(() {});
    });
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
    Location res = await Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return TimezonePage();
        })
    );

    if (res == null) {
      return;
    }

    setState(() {
      _clockState.utcOffset = res.utcOffset;
      _locationId = res.id;
    });

    _sharedPreferences.setString(utcOffsetKey, res.utcOffset);
    _sharedPreferences.setString(locationIdKey, res.id);

  }

}
